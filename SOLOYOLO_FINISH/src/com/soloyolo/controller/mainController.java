package com.soloyolo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.soloyolo.model.dao.CCommentDao;
import com.soloyolo.model.dao.CaloriesDao;
import com.soloyolo.model.dao.CommunityDao;
import com.soloyolo.model.dao.CookDao;
import com.soloyolo.model.dao.DeliveryDao;
import com.soloyolo.model.dao.HomeTrainingDao;
import com.soloyolo.model.dao.MDCommentDao;
import com.soloyolo.model.dao.MovieDao;
import com.soloyolo.model.dao.SNSDao;
import com.soloyolo.model.dto.CComment;
import com.soloyolo.model.dto.Calories;
import com.soloyolo.model.dto.Community;
import com.soloyolo.model.dto.Cook;
import com.soloyolo.model.dto.Crawling;
import com.soloyolo.model.dto.HomeTraining;
import com.soloyolo.model.dto.MDComment;
import com.soloyolo.model.dto.Menu;
import com.soloyolo.model.dto.SNS;
import com.soloyolo.model.dto.Shop;

@WebServlet("/SKILLSOLOYOLO")
public class mainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public mainController() {
    	System.out.println( "MAIN SERVLET IN" );
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding( "UTF-8" );
		response.setContentType( "text/html; charset=UTF-8" );
		
		// 업로드 파일 크기 지정
		int maxSize = 1024 * 1024 * 10;
		
		if( !ServletFileUpload.isMultipartContent( request ) ) {
			jsResponse( "파일 전송이 되지 않았습니다.\n 목록으로 되돌아갑니다.", "SKILLSOLOYOLO?command=communityList", response );
		}
		
		String command = request.getParameter( "command" );
		System.out.println( "[ command : " + command + " ]" );
		
		// Community게시판 과 HT, Cook List & Detail
		CommunityDao comDao = new CommunityDao();
		HomeTrainingDao htDao = new HomeTrainingDao();
		CookDao cDao = new CookDao();
		
		// Culture( Movie ) & Delivery Comment
		MDCommentDao mdcomDao = new MDCommentDao();
		MovieDao mDao = new MovieDao();
		DeliveryDao dDao = new DeliveryDao();
		
		// Community 게시판 Comment
		CCommentDao ccomDao = new CCommentDao();
		
		// SNS
		SNSDao snsDao = new SNSDao();
		
		
		// [1-1. Community게시판 List ]
		if(command.equals("communityList")) {
			List<Community> comList = comDao.communityList();
			request.setAttribute( "comList", comList );
			
			dispatch( "sub_Community01.jsp", request, response );
		} 
		
		// [ 1-2. Community게시판 Detail ]
		else if( command.equals( "communityDetail" ) ) {
			int comno = Integer.parseInt( request.getParameter( "comno" ) );
			
			int view_Up = comDao.viewUpdate( comno );
			
			if( view_Up > 0 ) {
				System.out.println( comno + "번 게시글 조회수 업데이트 성공" );
			} else {
				System.out.println( comno + "번 게시글 조회수 업데이트 실패" );
			}
			
			Community comSelOne = comDao.selectOne( comno );
			request.setAttribute( "comSelOne", comSelOne );
			
			int divno = Integer.parseInt( request.getParameter( "divno" ) );
			
			CComment ccom = new CComment();
			ccom.setComno( comno );
			ccom.setDivno( divno );
			
			List<CComment> ccomList = null;
			ccomList = ccomDao.ccomList( ccom );
			
			request.setAttribute( "ccomList", ccomList );
			
			dispatch("sub_Community02.jsp", request, response);
		} 
		
		// [ 1-3-1. Community게시판 게시글 Write( Insert ) 연결 ]
		else if( command.equals( "communityWrite" ) ) {
			response.sendRedirect( "sub_CommunityWrite.jsp" );
		}
		
		// [ 1-3-2. Community게시판 게시글 Write( Insert ) ]
		else if( command.equals( "communityInsert" ) ) {
			String root = request.getSession().getServletContext().getRealPath( "/" );
			String savePath = root + "images/upLoadFiles";
			System.out.println( "root : " + root );
			System.out.println( "savePath : " + savePath );
			
			MultipartRequest mpRequest = 
					new MultipartRequest( request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy() );
			
			int divno = Integer.parseInt( mpRequest.getParameter( "divno" ) );
			String nickName = mpRequest.getParameter( "nickName" );
			String title = mpRequest.getParameter( "title" );
			String originalFileName = mpRequest.getFilesystemName( "upfile" );
			String content = mpRequest.getParameter( "content" );
			
			String divName = "";
			switch( divno ) {
				case 1: divName = "Culture";
				break;
				case 2: divName = "Home Trainning";
				break;
				case 3: divName = "Cook";
				break;
				case 4: divName = "Delivery";
				break;
			}
			
			if( originalFileName != null ) {
				SimpleDateFormat sdf = new SimpleDateFormat( "yyyyMMddHHmmss" );
				
				String fileName = divName + "_" + sdf.format( new Date( System.currentTimeMillis() ) );
				
				String renameFileName = fileName + "." + originalFileName.substring( originalFileName.lastIndexOf( "." ) + 1 );
				System.out.println( "reFileName : " + renameFileName );
				
				File originalFile = new File( savePath + "/" + originalFileName );
				File renameFile = new File( savePath + "/" + renameFileName );
				
				if( !originalFile.renameTo( renameFile ) ) {
					int read = -1;
					byte[] buf = new byte[1024];
					
					FileInputStream fin = new FileInputStream( originalFile );
					FileOutputStream fout = new FileOutputStream( renameFile );
					
					while( ( read = fin.read( buf, 0, buf.length ) ) != -1 ) {
						fout.write( buf, 0, read );
					}
					
					fin.close();
					fout.close();
					originalFile.delete();
				}
				
				response.setContentType( "text/html; charset=UTF-8" );
				
				String fileUrl = renameFileName;
				
				Community community = new Community();
				community.setDivno( divno );
				community.setTitle( title );
				community.setNickName( nickName );
				community.setFileUrl( fileUrl );
				community.setContent( content );
				
				int ins_Res = comDao.insertBoard( community );
				
				if( ins_Res > 0 ) {
					System.out.println( "Community게시판 게시글 등록 성공 !!!" );
					jsResponse( "게시글 등록 성공 !!!", "SKILLSOLOYOLO?command=communityList", response);
				} else {
					System.out.println( "Community게시판 게시글 등록 실패 ..." );
					jsResponse( "게시글 등록 실패 ...", "SKILLSOLOYOLO?command=communityWrite", response);
				}
			} 
			
			// 첨부파일 없이 게시글 등록
			else {
	            Community community = new Community();
	            community.setDivno( divno );
	            community.setTitle( title );
	            community.setNickName( nickName );
	            community.setContent( content );
	            
	            int ins_Res = comDao.insertBoard2( community );
	            
	            if( ins_Res > 0 ) {
	               System.out.println( "Community게시판 게시글 등록 성공 !!!" );
	               jsResponse( "게시글 등록 성공 !!!", "SKILLSOLOYOLO?command=communityList", response);
	            } else {
	               System.out.println( "Community게시판 게시글 등록 실패 ..." );
	               jsResponse( "게시글 등록 실패 ...", "SKILLSOLOYOLO?command=communityWrite", response);
	            }
	         }
		}
		
		// [ 1-4-1. Community게시판 게시글 Update 연결 ]
		else if( command.equals( "communityUpdate" ) ) {
			int comno = Integer.parseInt( request.getParameter( "comno" ) );
			Community community = comDao.selectOne( comno );
			request.setAttribute( "community", community );
			dispatch( "sub_CommunityUpdate.jsp", request, response );
		}
		
		// [ 1-4-2. Community게시판 게시글 Update ]
		else if( command.equals( "boardUpdate" ) ) {
			String root = request.getSession().getServletContext().getRealPath( "/" );
			String savePath = root + "images/upLoadFiles";
			System.out.println( "root : " + root );
			System.out.println( "savePath : " + savePath );
			
			MultipartRequest mpRequest = 
					new MultipartRequest( request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy() );
			
			int comno = Integer.parseInt( mpRequest.getParameter( "comno" ) );
			int divno = Integer.parseInt( mpRequest.getParameter( "divno" ) );
			String nickName = mpRequest.getParameter( "nickName" );
			String title = mpRequest.getParameter( "title" );
			String originalFileName = mpRequest.getFilesystemName( "upfile" );
			String content = mpRequest.getParameter( "content" );
			
			String divName = "";
			switch( divno ) {
				case 1: divName = "Culture";
				break;
				case 2: divName = "Home Trainning";
				break;
				case 3: divName = "Cook";
				break;
				case 4: divName = "Delivery";
				break;
			}
			
			if( originalFileName != null ) {
				SimpleDateFormat sdf = new SimpleDateFormat( "yyyyMMddHHmmss" );
				
				String fileName = divName + "_" + sdf.format( new Date( System.currentTimeMillis() ) );
				
				String renameFileName = 
						divName + "_" + sdf.format( new Date( System.currentTimeMillis() ) ) 
						+ "." + originalFileName.substring( originalFileName.lastIndexOf( "." ) + 1 );
				System.out.println( "reFileName : " + renameFileName );
				
				File originalFile = new File( savePath + "/" + originalFileName );
				File renameFile = new File( savePath + "/" + renameFileName );
				
				if( !originalFile.renameTo( renameFile ) ) {
					int read = -1;
					byte[] buf = new byte[1024];
					
					FileInputStream fin = new FileInputStream( originalFile );
					FileOutputStream fout = new FileOutputStream( renameFile );
					
					while( ( read = fin.read( buf, 0, buf.length ) ) != -1 ) {
						fout.write( buf, 0, read );
					}
					
					fin.close();
					fout.close();
					originalFile.delete();
				}
				
				response.setContentType( "text/html; charset=UTF-8" );
				
				String fileUrl = renameFileName;
				
				Community community = new Community();
				community.setComno( comno );
//				community.setDivno( divno );
//				community.setTitle( title );
//				community.setNickName( nickName );
				community.setFileUrl( fileUrl );
				community.setContent( content );
				
				int up_Res = comDao.updateBoard( community );
				
				if( up_Res > 0 ) {
					System.out.println( "Community게시판 게시글 수정 성공 !!!" );
					jsResponse( "게시글 수정 성공 !!!", "SKILLSOLOYOLO?command=communityList", response);
				} else {
					System.out.println( "Community게시판 게시글 수정 실패 ..." );
					jsResponse( "게시글 수정 실패 ...", "SKILLSOLOYOLO?command=communityDetail&comno=" + comno, response);
				}
			}
		}
		
		// [ 1-5. Community게시판 게시글 Delete ]
		else if( command.equals( "communityDelete" ) ) {
			int comno = Integer.parseInt( request.getParameter( "comno" ) );
			
			int del_Res = comDao.deleteBoard( comno );
			
			if( del_Res > 0 ) {
				System.out.println( "Community게시판 게시글 삭제 성공 !!!" );
				jsResponse( "게시글 삭제 성공 !!!", "SKILLSOLOYOLO?command=communityList", response);
			} else {
				System.out.println( "Community게시판 게시글 삭제 실패 ..." );
				jsResponse( "게시글 삭제 실패 ...", "SKILLSOLOYOLO?command=communityList", response);
			}
		}
		
		// [ 1-6. Community게시판 추천수 업데이트 ]
		else if( command.equals( "boardRecommend" ) ) {
			int comno = Integer.parseInt( request.getParameter( "comno" ) );
			
			int recom_Up = comDao.recomUpdate( comno );
			
			if( recom_Up > 0 ) {
				System.out.println( comno + "번 게시글 추천수 업데이트 성공 !!!" );
			} else {
				System.out.println( comno + "번 게시글 추천수 업데이트 실패 ..." );
			}
			
			dispatch( "SKILLSOLOYOLO?command=communityList", request, response );
		}
		
		
		// =================== [ Culture( Movie ) ] =================== //
		
		
		// [ 2-1. Movie select List ]
		// 해당하는 기능은 SOLOYOLO SERVLET [ 8-1 ]항목에서 하고 있다.
		
		// [ 2-2. Movie Search ]
		else if( command.equals( "movieSearch" ) ) {
			String all = request.getParameter( "all_genre" );
			String[] genre = request.getParameterValues( "genre" );
			String search = request.getParameter( "search" );
			String recommend = request.getParameter( "recommend" );

			// 전체가 체크됐을 경우 → all_genre가 체크
			if( all != null ) {
				//전체 체크와 검색어 입력했을경우
				if( search != "" ) {
					List<Crawling> movieWord = mDao.movieWordSearch( search );
					request.setAttribute( "mList", movieWord );
					
					dispatch("sub_Culture01.jsp", request, response );
					return;
				} else {
					response.sendRedirect( "SOLOYOLO?command=mList&grade=USER" );
					return;
				}
			} 
			
			//전체가 체크 안됐을 경우
			else if( all == null && genre == null && search == "" && recommend == null ) {
				response.sendRedirect( "SOLOYOLO?command=mList&grade=USER" );
				return;
			}
			
			//장르만 체크되었을 경우
			else if( genre != null && search == "" && recommend == null ) {
				List<Crawling> movieGenre = mDao.movieGenre( genre );
				request.setAttribute( "mList", movieGenre );
			}
			
			// 장르와 검색어
			else if( genre != null && search != "" && recommend == null ) {
				List<Crawling> movieWord = mDao.movieWordSearch( search );
				List<Crawling> movieGenre = mDao.movieGenre( genre );

				List<Crawling> movieResult = new ArrayList<>();
				
				for( Crawling craw : movieGenre ) {
					for( Crawling craw2 : movieWord ) {
						if( craw.equals( craw2 ) ) {
							movieResult.add( craw );
						}
					}
				}

				request.setAttribute( "mList", movieResult );
			}
			
			// 장르, 추천, 검색어 모두 입력
			else if( genre != null && search != "" && recommend != null ) {
				List<Crawling> movieGenre = mDao.movieGenre( genre );
				List<Crawling> movieWord = mDao.movieWordSearch( search );
				List<Crawling> movieRecommend = mDao.movieRecommend( recommend );

				List<Crawling> movieResult = new ArrayList<>();
				
				for( Crawling craw : movieRecommend ) {
					movieGenre.add( craw );
				}
				
				for( Crawling craw : movieGenre ) {
					for( Crawling craw2 : movieWord ) {
						if( craw.equals( craw2 ) ) {
							movieResult.add( craw );
						}
					}
				}

				request.setAttribute( "mList", movieResult );
			}
			
			// 검색어와 추천 입력
			else if( genre == null && search != "" && recommend != null ) {
				List<Crawling> movieRecommend = mDao.movieRecommend( recommend );
				List<Crawling> movieWord = mDao.movieWordSearch( search );
				
				List<Crawling> movieResult = new ArrayList<>();

				for( Crawling craw : movieRecommend ) {
					for( Crawling craw2 : movieWord ) {
						if( craw.equals( craw2 ) ) {
							movieResult.add( craw );
						}
					}
				}
				
				request.setAttribute( "mList", movieResult );
			}
			
			// 장르와 추천 입력
			else if( genre != null && search == "" && recommend != null ) {
				List<Crawling> movieGenre = mDao.movieGenre( genre );
				List<Crawling> movieRecommend = mDao.movieRecommend( recommend );
				
				for(Crawling craw : movieRecommend ) {
					movieGenre.add( craw );
				}

				request.setAttribute( "mList", movieGenre );
			} 
			
			// 추천 입력
			else if( genre == null && search == "" && recommend != null ) {
				List<Crawling> movieRecommend = mDao.movieRecommend( recommend );
				request.setAttribute( "mList", movieRecommend );
			} else if(genre == null && search != "" && recommend == null ) {
	            List<Crawling> movieWord = mDao.movieWordSearch( search );
	            request.setAttribute( "mList", movieWord );
	         }

			dispatch("sub_Culture01.jsp", request, response );
		}
		
		// [ 2-3. Movie select One ]
		// syController에 작성되어있으므로 생략
		
		// =================== [ HomeTraining ] =================== //
		
		
		// [ 3-1. Home Training select List ]
		else if( command.equals( "htList" ) ) {
			List<HomeTraining> htList = htDao.HTList();
			List<HomeTraining> htListReverse = new ArrayList<>();
			
			for( int i = 0; i < htList.size(); i++ ) {
				htListReverse.add( htList.get(htList.size() - 1 - i) );
			}
			
			request.setAttribute( "htList", htList );
			request.setAttribute( "htListReverse", htListReverse );
			
			dispatch( "sub_HT01.jsp", request, response );
		}
		
		// [ 3-2. Home Training Search ]
		else if( command.equals( "htSearch" ) ) {
			String all = request.getParameter( "all_genre" );
			String[] genre = request.getParameterValues( "genre" );
			String search = request.getParameter( "search" );
			String recommend = request.getParameter( "recommend" );

			// 전체가 체크됐을 경우 → all_genre가 체크
			if( all != null ) {
				//전체 체크와 검색어 입력했을경우
				if( search != "" ) {
					List<HomeTraining> htWord = htDao.htWordSearch( search );
					request.setAttribute( "htList", htWord );
					
					dispatch("sub_HT01.jsp", request, response );
					return;
				} else {
					response.sendRedirect( "SKILLSOLOYOLO?command=htList" );
					return;
				}
			} 
			
			//전체가 체크 안됐을 경우
			else if( all == null && genre == null && search == "" && recommend == null ) {
				response.sendRedirect( "SKILLSOLOYOLO?command=htList" );
				return;
			}
			
			//장르만 체크되었을 경우
			else if( genre != null && search == "" && recommend == null ) {
				List<HomeTraining> htGenre = htDao.htGenre( genre );
				request.setAttribute( "htList", htGenre );
			}
			
			// 장르와 검색어
			else if( genre != null && search != "" && recommend == null ) {
				List<HomeTraining> htWord = htDao.htWordSearch( search );
				List<HomeTraining> htGenre = htDao.htGenre( genre );

				List<HomeTraining> htResult = new ArrayList<>();
				
				for( HomeTraining ht : htGenre ) {
					for( HomeTraining ht2 : htWord ) {
						if( ht.equals( ht2 ) ) {
							htResult.add( ht );
						}
					}
				}

				request.setAttribute( "htList", htResult );
			}
			
			// 장르, 추천, 검색어 모두 입력
			else if( genre != null && search != "" && recommend != null ) {
				List<HomeTraining> htGenre = htDao.htGenre( genre );
				List<HomeTraining> htWord = htDao.htWordSearch( search );
				List<HomeTraining> htRecommend = htDao.htRecommend( recommend );

				List<HomeTraining> htResult = new ArrayList<>();
				
				for( HomeTraining ht : htRecommend ) {
					htGenre.add( ht );
				}
				
				for( HomeTraining ht : htGenre ) {
					for( HomeTraining ht2 : htWord ) {
						if( ht.equals( ht2 ) ) {
							htResult.add( ht );
						}
					}
				}

				request.setAttribute( "htList", htResult );
			}
			
			// 검색어와 추천 입력
			else if( genre == null && search != "" && recommend != null ) {
				List<HomeTraining> htRecommend = htDao.htRecommend( recommend );
				List<HomeTraining> htWord = htDao.htWordSearch( search );
				
				List<HomeTraining> htResult = new ArrayList<>();

				for( HomeTraining ht : htRecommend ) {
					for( HomeTraining ht2 : htWord ) {
						if( ht.equals( ht2 ) ) {
							htResult.add( ht );
						}
					}
				}
				
				request.setAttribute( "htList", htResult );
			}
			
			// 장르와 추천 입력
			else if( genre != null && search == "" && recommend != null ) {
				List<HomeTraining> htGenre = htDao.htGenre( genre );
				List<HomeTraining> htRecommend = htDao.htRecommend( recommend );
				
				for(HomeTraining ht : htRecommend ) {
					htGenre.add( ht );
				}

				request.setAttribute( "htList", htGenre );
			}
			
			// 추천 입력
			else if( genre == null && search == "" && recommend != null ) {
				List<HomeTraining> htRecommend = htDao.htRecommend( recommend );
				request.setAttribute( "htList", htRecommend );
			} else if(genre == null && search != "" && recommend == null ) {
				List<HomeTraining> htWord = htDao.htWordSearch( search );
	            request.setAttribute( "htList", htWord );
	         }
			
			List<HomeTraining> htList = htDao.HTList();
			List<HomeTraining> htListReverse = new ArrayList<>();
			
			for( int i = 0; i < htList.size(); i++ ) {
				htListReverse.add( htList.get(htList.size() - 1 - i) );
			}
			
			request.setAttribute( "htListReverse", htListReverse );
			
			dispatch("sub_HT01.jsp", request,response);
		}
		
		// [ 3-3. Home Training select One ]
		else if( command.equals( "htOne" ) ) {
			int htno = Integer.parseInt( request.getParameter( "htno" ) );
			Double cal = Double.parseDouble( request.getParameter( "cal" ) );
			
			HomeTraining htSelOne = htDao.htSelOne( htno );
			String[] htIntro = htSelOne.getIntro().split( ";" );
			
			request.setAttribute( "command", command );
			request.setAttribute( "htSelOne", htSelOne );
			request.setAttribute( "htIntro", htIntro );
			
			
			
			CaloriesDao calDao = new CaloriesDao();

			Double downcal = Double.parseDouble( request.getParameter( "cal" ) );

			if(downcal != 0) {
				int userno = Integer.parseInt( request.getParameter( "userno" ) );
				Calendar dal = new GregorianCalendar();
				Date regdate = new Date(dal.getTimeInMillis());
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				String to = transFormat.format(regdate);

				Calories calone = calDao.selectOne(userno, to);

				int res = 0;
				if(calone.getSubcal() != null) {

					Double totalcal = calone.getSubcal()+downcal;
					calDao.downcal(userno, totalcal);
				}else {
					calDao.downinsert(userno, downcal);
				}
			}
			
			
			
			dispatch( "sub_HT02.jsp", request, response );
		}
		
		
		// =================== [ Cook ] =================== //
		
		
		// [ 4-1. Cook select List ]
		else if( command.equals( "cookList" ) ) {
			List<Cook> cookList = cDao.cookList();
			request.setAttribute( "cookList", cookList );
			
			dispatch( "sub_Cook01.jsp", request, response );
		}
		
		// [ 4-2. Cook Search ]
		else if( command.equals( "cookSearch" ) ) {
			String all = request.getParameter( "all_genre" );
			String[] genre = request.getParameterValues( "genre" );
			String search = request.getParameter( "search" );
			String recommend = request.getParameter( "recommend" );

			// 전체가 체크됐을 경우 → all_genre가 체크
			if( all != null ) {
				//전체 체크와 검색어 입력했을경우
				if( search != "" ) {
					List<Cook> cookWord = cDao.cookWordSearch( search );
					request.setAttribute( "cookList", cookWord );
					
					dispatch("sub_Cook01.jsp", request, response );
					return;
				} else {
					response.sendRedirect( "SKILLSOLOYOLO?command=cookList" );
					return;
				}
			} 
			
			//전체가 체크 안됐을 경우
			else if( all == null && genre == null && search == "" && recommend == null ) {
				response.sendRedirect( "SKILLSOLOYOLO?command=cookList" );
				return;
			}
			
			//장르만 체크되었을 경우
			else if( genre != null && search == "" && recommend == null ) {
				List<Cook> cookGenre = cDao.cookGenre( genre );
				request.setAttribute( "cookList", cookGenre );
			}
			
			// 장르와 검색어
			else if( genre != null && search != "" && recommend == null ) {
				List<Cook> cookWord = cDao.cookWordSearch( search );
				List<Cook> cookGenre = cDao.cookGenre( genre );

				List<Cook> cookResult = new ArrayList<>();
				
				for( Cook cook : cookGenre ) {
					for( Cook cook2 : cookWord ) {
						if( cook.equals( cook2 ) ) {
							cookResult.add( cook );
						}
					}
				}

				request.setAttribute( "cookList", cookResult );
			}
			
			// 장르, 추천, 검색어 모두 입력
			else if( genre != null && search != "" && recommend != null ) {
				List<Cook> cookGenre = cDao.cookGenre( genre );
				List<Cook> cookWord = cDao.cookWordSearch( search );
				List<Cook> cookRecommend = cDao.cookRecommend( recommend );

				List<Cook> cookResult = new ArrayList<>();
				
				for( Cook cook : cookRecommend ) {
					cookGenre.add( cook );
				}
				
				for( Cook cook : cookGenre ) {
					for( Cook cook2 : cookWord ) {
						if( cook.equals( cook2 ) ) {
							cookResult.add( cook );
						}
					}
				}

				request.setAttribute( "cookList", cookResult );
			}
			
			// 검색어와 추천 입력
			else if( genre == null && search != "" && recommend != null ) {
				List<Cook> cookRecommend = cDao.cookRecommend( recommend );
				List<Cook> cookWord = cDao.cookWordSearch( search );
				
				List<Cook> cookResult = new ArrayList<>();

				for( Cook cook : cookRecommend ) {
					for( Cook cook2 : cookWord ) {
						if( cook.equals( cook2 ) ) {
							cookResult.add( cook );
						}
					}
				}
				
				request.setAttribute( "cookList", cookResult );
			}
			
			// 장르와 추천 입력
			else if( genre != null && search == "" && recommend != null ) {
				List<Cook> cookGenre = cDao.cookGenre( genre );
				List<Cook> cookRecommend = cDao.cookRecommend( recommend );
				
				for(Cook cook : cookRecommend ) {
					cookGenre.add( cook );
				}

				request.setAttribute( "cookList", cookGenre );
			}
			
			// 추천 입력
			else if( genre == null && search == "" && recommend != null ) {
				List<Cook> cookRecommend = cDao.cookRecommend( recommend );
				request.setAttribute( "cookList", cookRecommend );
			} else if(genre == null && search != "" && recommend == null ) {
				List<Cook> cookWord = cDao.cookWordSearch( search );
	            request.setAttribute( "cookList", cookWord );
	         }

			dispatch("sub_Cook01.jsp", request,response);
		}
		
		// [ 4-3. Cook select One ]
		else if( command.equals( "cookOne" ) ) {
			int cno = Integer.parseInt( request.getParameter( "cno" ) );
			Double cal = Double.parseDouble( request.getParameter( "cal" ) );
			
			Cook cookSelOne = cDao.cookSelOne( cno );
			String[] cRecipe = cookSelOne.getRecipe().split( ";" );
			String[] cMaterial = cookSelOne.getMaterial().split( ";" );
			String[] cSeasoning = cookSelOne.getSeasoning().split( ";" );
			
			request.setAttribute( "command", command );
			request.setAttribute( "cookSelOne", cookSelOne );
			request.setAttribute( "cRecipe", cRecipe );
			request.setAttribute( "cMaterial", cMaterial );
			request.setAttribute( "cSeasoning", cSeasoning );
			
			
			
			CaloriesDao calDao = new CaloriesDao();

			Double upcal = Double.parseDouble( request.getParameter( "cal" ) );

			if(upcal != 0) {
				int userno = Integer.parseInt( request.getParameter( "userno" ) );
				Calendar dal = new GregorianCalendar();
				Date regdate = new Date(dal.getTimeInMillis());
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				String to = transFormat.format(regdate);

				Calories calone = null;
	            calone  = calDao.selectOne(userno, to);
	            
	            System.out.println("calone : "+ calone);
	            
	            if(calone==null) {
	               calDao.upinsert(userno, upcal, to);
	            }else {
	               Double totalcal = calone.getSumcal()+upcal;
	               calDao.upcal(userno, totalcal);
	               
	            }
			}
			
			
			
			dispatch( "sub_Cook02.jsp", request, response );
		}
		
		
		// =================== [ Delivery ] =================== //
		
		
		// [ 5-1. Delivery select List ]
		else if( command.equals( "deliveryList" ) ) {
			List<Shop> shopList = dDao.shopList();
			request.setAttribute( "shopList", shopList );
			
			dispatch( "sub_Delivery01.jsp", request, response );
		}
		
		// [ 5-2. Delivery select One ]
		else if( command.equals( "delOne" ) ) {
			int sno = Integer.parseInt( request.getParameter( "sno" ) );
			Double cal = Double.parseDouble( request.getParameter( "cal" ) );
			
			// 음식점 정보
			Shop shopOne = dDao.shopOne( sno );
			request.setAttribute( "shopOne", shopOne );
			
			// 음식점 메뉴 리스트
			List<Menu> menuList = dDao.menuList( sno );
			request.setAttribute( "menuList", menuList );
			
			// 댓글
			int divno = Integer.parseInt( request.getParameter( "divno" ) );
			
			MDComment mdcom = new MDComment();
			mdcom.setBoardno( sno );
			mdcom.setDivno( divno );
			
			List<MDComment> mdcomList = null;
			mdcomList = mdcomDao.mdcomList( mdcom );
			
			request.setAttribute( "mdcomList", mdcomList );
			
			
			
			CaloriesDao calDao = new CaloriesDao();

			Double upcal = Double.parseDouble( request.getParameter( "cal" ) );

			if(upcal != 0) {
				int userno = Integer.parseInt( request.getParameter( "userno" ) );
				System.out.println("userno: "+userno);
				Calendar dal = new GregorianCalendar();
				Date regdate = new Date(dal.getTimeInMillis());
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				String to = transFormat.format(regdate);

				Calories calone = null;
				calone  = calDao.selectOne(userno, to);

				System.out.println("calone : "+ calone);

				if(calone==null) {
					calDao.upinsert(userno, upcal, to);
				}else {
					Double totalcal = calone.getSumcal()+upcal;
					calDao.upcal(userno, totalcal);

				}
			}
			
			request.setAttribute( "command", command );
			
			
			dispatch( "sub_Delivery02.jsp", request, response );
		}
		
		
		
		// [ 6-1. Culture & Delivery Comment Insert ]
		else if( command.equals( "insertComment" ) ) {
			int userno = Integer.parseInt( request.getParameter( "userno" ) );
			int divno = Integer.parseInt( request.getParameter( "divno" ) );
			int boardno = Integer.parseInt( request.getParameter( "boardno" ) );
			String nickName = request.getParameter( "nickname" );
			String content = request.getParameter( "content" );
			
			MDComment mdcom = new MDComment();
			mdcom.setUserno( userno );
			mdcom.setDivno( divno );
			mdcom.setBoardno( boardno );
			mdcom.setNickName( nickName );
			mdcom.setContent( content );
			
			int mdcom_ins = mdcomDao.mdcomInsert( mdcom );
			
			if( mdcom_ins > 0 ) {
				System.out.println( "댓글 작성 성공 !!!" );
			} else {
				System.out.println( "댓글 작성 실패 T.T" );
			}
		}
		
		// [ 5-2. Culture & Delivery Comment List ]
		// SOLOYOLO SERVLET에서 command값이 "mDetail"일 때 Culture의 Comment를, 
		// SKILLSOLOYOLO SERVLET에서 command값이 ""
		
		
		
		// [ 6-2. Community 게시판 Comment Insert ]
		else if( command.equals( "insertCComment" ) ) {
			int userno = Integer.parseInt( request.getParameter( "userno" ) );
			int divno = Integer.parseInt( request.getParameter( "divno" ) );
			String nickName = request.getParameter( "nickname" );
			String content = request.getParameter( "content" );
			
			CComment ccom = new CComment();
			ccom.setUserno( userno );
			ccom.setDivno( divno );
			ccom.setNickName( nickName );
			ccom.setContent( content );
			
			int ccom_ins = ccomDao.ccomInsert( ccom );
			
			if( ccom_ins > 0 ) {
				System.out.println( "댓글 작성 성공 !!!" );
			} else {
				System.out.println( "댓글 작성 실패 T.T" );
			}
		}
		
		
		
		// [ 7-1. SNS Write ]
		else if( command.equals( "snsWrite" ) ) {
			response.sendRedirect( "sub_snsWrite.jsp" );
		}
		
		// [ 7-2. SNS Insert ]
		else if( command.equals( "snsInsert" ) ) {
			String root = request.getSession().getServletContext().getRealPath( "/" );
			String savePath = root + "images/snsFiles";
			System.out.println( "root : " + root );
			System.out.println( "savePath : " + savePath );

			MultipartRequest mpRequest = 
					new MultipartRequest( request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy() );
			int userno = Integer.parseInt(mpRequest.getParameter("userno"));
			String grade = request.getParameter("grade");
			String nickName = mpRequest.getParameter( "nickname" );
			String originalFileName = mpRequest.getFilesystemName( "upfile" );
			String content = mpRequest.getParameter( "content" );


			if( originalFileName != null ) {
				SimpleDateFormat sdf = new SimpleDateFormat( "yyyyMMddHHmmss" );

				String fileName = "sns_" + sdf.format( new Date( System.currentTimeMillis() ) );

				String renameFileName = 
						fileName + "." + originalFileName.substring( originalFileName.lastIndexOf( "." ) + 1 );
				System.out.println( "reFileName : " + renameFileName );

				File originalFile = new File( savePath + "/" + originalFileName );
				File renameFile = new File( savePath + "/" + renameFileName );

				if( !originalFile.renameTo( renameFile ) ) {
					int read = -1;
					byte[] buf = new byte[1024];

					FileInputStream fin = new FileInputStream( originalFile );
					FileOutputStream fout = new FileOutputStream( renameFile );

					while( ( read = fin.read( buf, 0, buf.length ) ) != -1 ) {
						fout.write( buf, 0, read );
					}

					fin.close();
					fout.close();
					originalFile.delete();
				}

				response.setContentType( "text/html; charset=UTF-8" );

				String fileUrl = renameFileName;

				SNS sns = new SNS();
				sns.setNickname( nickName );
				sns.setFileurl( fileUrl );
				sns.setContent( content );
				System.out.println(sns.getNickname());
				System.out.println(sns.getFileurl());
				int ins_Res = snsDao.insertSNS( sns );

				if( ins_Res > 0 ) {
					System.out.println( "SNS 등록 성공 !!!" );
					jsResponse( "SNS 등록 성공 !!!", "SOLOYOLO?command=myPage&userno=" + userno + "&grade=" + grade, response);
				} else {
					System.out.println( "SNS 등록 실패 ..." );
					jsResponse( "SNS 등록 실패 ...", "SKILLSOLOYOLO?command=snsWrite", response);
				}

			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void dispatch( String url, HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher( url );
		dispatch.forward( request, response );
	}

	private void jsResponse( String msg, String url, HttpServletResponse response ) throws IOException {
		// 사용할 HTML구문을 저장
		String script = " <script type='text/javascript'> alert( '" + msg + "' ); location.href='" + url + "'; </script> ";
		PrintWriter pwOut = response.getWriter();
		pwOut.print( script );
	}
}
