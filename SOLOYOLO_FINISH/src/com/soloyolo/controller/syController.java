package com.soloyolo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.soloyolo.model.dao.CaloriesDao;
import com.soloyolo.model.dao.CookDao;
import com.soloyolo.model.dao.DeliveryDao;
import com.soloyolo.model.dao.DivTBDao;
import com.soloyolo.model.dao.FavoritesDao;
import com.soloyolo.model.dao.HistoryDao;
import com.soloyolo.model.dao.HomeTrainingDao;
import com.soloyolo.model.dao.MDCommentDao;
import com.soloyolo.model.dao.MemberDao;
import com.soloyolo.model.dao.MovieDao;
import com.soloyolo.model.dao.SNSDao;
import com.soloyolo.model.dto.Calories;
import com.soloyolo.model.dto.Cook;
import com.soloyolo.model.dto.Crawling;
import com.soloyolo.model.dto.DivTable;
import com.soloyolo.model.dto.Favorites;
import com.soloyolo.model.dto.History;
import com.soloyolo.model.dto.HomeTraining;
import com.soloyolo.model.dto.MDComment;
import com.soloyolo.model.dto.Member;
import com.soloyolo.model.dto.Movie;
import com.soloyolo.model.dto.SNS;
import com.soloyolo.model.dto.Shop;

@WebServlet("/SOLOYOLO")
public class syController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public syController() {
    	System.out.println( "MYPAGE & MOVIE SERVLET IN" );
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding( "UTF-8" );
		response.setContentType( "text/html; charset=UTF-8" );
		
		// 웹 페이지에서 controller로 들어오기 위해 command값을 받아온다.
		String command = request.getParameter( "command" );
		
		// 들어오는 command값에 따라 사용할 객체를 생성
		MemberDao memDao = new MemberDao();
		MovieDao movieDao = new MovieDao();
		FavoritesDao favoDao = new FavoritesDao();
		DivTBDao divTBDao = new DivTBDao();
		HistoryDao hisDao = new HistoryDao();
		MDCommentDao mdcomDao = new MDCommentDao();
		
		HomeTrainingDao htDao = new HomeTrainingDao();
		CookDao cDao = new CookDao();
		DeliveryDao dDao = new DeliveryDao();
		
		SNSDao snsDao = new SNSDao();
		CaloriesDao calDao = new CaloriesDao();
		
		
		
		// [ 1. ADMIN계정으로 로그인시에 마이페이지를 클릭했을 경우, 해당 웹페이지에 가입된 Member들을 List로 볼 수 있게 해준다. ]
		if( command.equals( "list" ) ) {
			List<Member> memList = memDao.memberList();
			request.setAttribute( "memList", memList );
			dispatch( "member_List.jsp", request, response );
		} 
		
		
		
		// [ 2-1. login.jsp페이지에서 'login'버튼을 클릭 시에 login하게 해준다. ]
		else if( command.equals( "success" ) ) {
			// 입력된 id와 pw의 값을 넘겨받아 출력해준다.
			String userid = request.getParameter( "userid" );
			String userpw = request.getParameter( "userpw" );
			System.out.println( "ID : " + userid + ", PW : " + userpw );
			
			// Member타입의 객체를 생성하여, 넘겨받은 id와 pw를 초기화 해준다.
			Member login_Ing = new Member();
			login_Ing.setUserid( userid );
			login_Ing.setUserpw( userpw );
			
			// 위에서 생성한 객체를 이용하여 입력한 id값으로 DB에 접근하여 selectOne하고, 결과값을 login_Res라는 Member객체에 담는다.
			// ( memDao.login()은 selectOne을 수행( USERID, USERPW값을 비교하기 위해 실행 ) )
			Member login_Res = memDao.login( userid );
			
			// 입력한 id값으로 selectOne한 결과값이 null인 경우
			if( login_Res == null ) {
				// 아래에 적힌 문자열로 alert창을 띄운 후, 다시 login.jsp페이지로 이동한다.
				jsResponse( "입력하신 아이디로 가입된 회원이 존재하지 않습니다.", "login.jsp", response );
			} 
			// id값으로 selectOne한 결과값이 null이 아닌 객체가 존재하는 경우
			else {
				// id값으로 selectOne한 객체에서 pw값을 가져오고, 입력된 pw값과 비교하여 같을 경우
				if( login_Res.getUserpw().equals( userpw ) ) {
					// id값으로 selectOne한 객체를 session영역에 올려둔다.
					// ( -1값으로 인해 session영역에서 일정시간이 지나도 소멸하지 않고 계속 유지시킨다. )
					request.getSession().setAttribute( "login_Res", login_Res );
					request.getSession().setMaxInactiveInterval( -1 );
					
					// session객체를 가진 상태로 main.jsp페이지로 이동한다.
					dispatch( "main.jsp", request, response );
				} 
				// id값으로 selectOne한 객체에서 pw값을 가져오고, 입력된 pw값과 비교하여 같지 경우
				else {
					// 아래에 적힌 문자열로 alert창을 띄운 후, 다시 login.jsp페이지로 이동한다.
					jsResponse( "입력된 패스워드가 일치하지 않습니다.", "login.jsp", response );
				}
			}
		}
		
		// [ 2-2. SNS LOGIN ]
		else if( command.equals( "success_api" ) ) {
			String userid = request.getParameter( "userid" );
			System.out.println( "ID : " + userid );

			Member login_Ing = new Member();
			login_Ing.setUserid( userid );
			
			System.out.println( "login_Ing : " + login_Ing );

			Member login_Res = memDao.login( login_Ing.getUserid() );

			if( login_Res == null ) {
				Member dto_res =  memDao.insertSNS( login_Ing );
				System.out.println( dto_res );
				
				request.getSession().setAttribute( "login_Res", dto_res );
				request.getSession().setMaxInactiveInterval( -1 );
				
				dispatch( "SOLOYOLO?command=userInfoUpdate&userno="+ dto_res.getUserno(), request, response );
				return;
			} else {
				request.getSession().setAttribute( "login_Res", login_Res );
				request.getSession().setMaxInactiveInterval( -1 );

				Member userInfo = memDao.memberOne( login_Res.getUserno() );
				
				request.setAttribute( "userInfo", userInfo );

				dispatch( "main.jsp", request, response );
			}
		}
		
		
		
		// [ 3. login한 Member가 웹페이지에서 header부분의 '로그아웃'버튼을 클릭 시에 logout하게 해준다. ]
		else if( command.equals( "logout" ) ) {
			// login된 Member의 정보가 담긴 객체의 값을 session영역에서 소멸시키고, login.jsp페이지로 이동한다.
			request.getSession().invalidate();
			response.sendRedirect( "login.jsp" );
		} 
		
		
		
		// [ 4-1. login.jsp페이지에서 '회원가입' 버튼을 클릭 시에 회원가입을 할 수 있는 join.jsp페이지로 이동한다. ]
		else if( command.equals( "regist" ) ) {
			response.sendRedirect( "join.jsp" );
		} 
		
		// [ 4-2. 회원가입 페이지인 join.jsp페이지에서 입력된 아이디와 DB에 저장된 아이디와 비교하여 사용가능, 블가능을 판별한다. ]
		else if( command.equals( "idChk" ) ) {
			// join.jsp에서 입력된 id값을 가져온다.
			String userid = request.getParameter( "userid" );
			System.out.println( "userid : " + userid );
			
			// 가져온 id값으로 DB에 접근하여 selectOne하고, 결과값을 idChk_Res라는 Member객체에 담는다.
			// ( memDao.idChk()은 selectOne을 수행( 해당하는 DB의 값을 전부 가져온다. ) )
			Member idChk_Res = new Member();
			idChk_Res = memDao.idChk( userid );
			boolean idNotUsed = true;
			
			// id값으로 selectOne한 결과값이 존재할 경우
			if( idChk_Res != null ) {
				idNotUsed = false;
			}
			
			// idNotUsed의 값을 가진채로 id_Chk.jsp페이지로 이동한다. → 이 방식은 JSP태그를 사용해야 하여 아래 방식으로 변경
//			response.sendRedirect( "id_Chk.jsp?idNotUsed=" + idNotUsed );
			
			// idNotUsed의 값을 request영역에 담아 id_Chk.jsp페이지로 이동한다.
			request.setAttribute( "idNotUsed", idNotUsed );
			dispatch( "id_Chk.jsp", request, response );
		} 
		
		// [ 4-3. 회원가입페이지인 join.jsp페이지에서 작성이 완료되어 '회원가입' 버튼을 클릭하게 되면 해당하는 Member를 DB에 저장한다. ]
		else if(command.equals( "insertMember" )) {
			// 각 항목의 입력된 값들을 가져와 변수에 담는다.
			String userid = request.getParameter( "userid" );
			String userpw = request.getParameter("userpw");
			String name = request.getParameter( "name" );
			String nickname = request.getParameter( "nickname" );
			String email = request.getParameter("email");
			String e_domain = request.getParameter("e_domain");
			email += "@" + e_domain;
			String phone = request.getParameter("phone");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			phone += "-" + phone1 + "-" + phone2;
			double height = Double.parseDouble(request.getParameter("height"));
			double weight = Double.parseDouble(request.getParameter("weight"));
			int postCode = Integer.parseInt( request.getParameter( "postCode" ) );
			Double addr_X = Double.parseDouble( request.getParameter("namex" ) );
			Double addr_Y = Double.parseDouble( request.getParameter("namey" ) );
			String addr = request.getParameter("addr");
			String addr_Detail = request.getParameter("addr_Detail");
			String grade = "USER";
			String[] genres = request.getParameterValues("favogenre");
			String[] hts = request.getParameterValues("favoht");
			
			// 새로운 Member객체를 생성하여 위에 담은 변수들을 객체에 초기화한다.
			Member mem = new Member();
			mem.setUserid( userid );
			mem.setUserpw( userpw );
			mem.setName(name);
			mem.setNickname(nickname);
			mem.setEmail( email );
			mem.setPhone( phone );
			mem.setHeight( height );
			mem.setWeight( weight );
			mem.setPostCode( postCode );
			mem.setAddr( addr );
			mem.setAddr_Detail( addr_Detail );
			mem.setAddr_X( addr_X );
			mem.setAddr_Y( addr_Y );
			mem.setGrade( grade );
			
			// 영화 장르의 경우, 배열로 들어오기 때문에 배열의 길이에 따라 문자열의 값을 조절하여 초기화한다.
			String favogenre = genres[0];
			if( genres.length > 1 ) {
				for( int i = 1; i < genres.length; i++ ) {
					favogenre += "," + genres[i];
				}
			}
			mem.setFavogenre( favogenre );
			
			// 홈트레이닝 종류의 경우, 배열로 들어오기 때문에 배열의 길이에 따라 문자열의 값을 조절하여 초기화한다.
			String favoht = hts[0];
			if( hts.length > 1 ) {
				for( int i = 1; i < hts.length; i++ ) {
					favoht += "," + hts[i];
				}
			}
			mem.setFavoht( favoht );
			
			// 객체가 제대로 초기화되었는지 console에 출력하여 확인해본다.
			System.out.println( mem );
			
			// 초기화된 객체를 통해 DB에 접근하여 회원가입을 시도한 Member의 정보를 insert하고, insert된 컬럼의 수만큼 정수값을 반환한다.
			// ( memDao.insertMember()는 insert를 수행( 객체에 초기화된 값들을 이용하여 insert한다. ) )
			int res = memDao.insertMember(mem);
			
			// DB에 insert된 Member가 존재할 경우
			if( res > 0 ) {
				// join.jsp페이지에서 alert창을 띄운다. 그 이후에 login.jsp페이지로 이동한다.
				jsResponse( "회원 가입 성공 !!", "login.jsp", response);
			} 
			
			// DB에 insert된 Member가 존재하지 않을 경우
			else {
				// join.jsp페이지에서 alert창을 띄운다. 그 이후에 다시 회원가입을 할 수 있게 해당하는 SERVLET의 command값으로 이동한다.
				jsResponse( "회원 가입 실패 !!", "SOLOYOLO?command=insertMember", response);
			}
		}
		
		
		
		// [ 5-1. login.jsp페이지에서 'ID찾기' 버튼을 클릭 시에 실행된다. ]
		else if( command.equals( "idFind" ) ) {
			// id_Find.jsp페이지로 이동한다.
			response.sendRedirect( "id_Find.jsp" );
		}
		
		// [ 5-2. id_Find.jsp페이지에서 'ID찾기' 버튼을 클릭 시에 실행된다. ]
		else if( command.equals( "idFound" ) ) {
			// 입력된 데이터를 가져와 변수에 저장한다.
			String name = request.getParameter( "name" );
			String phone = request.getParameter( "phone" );
			phone += "-" + request.getParameter( "phone1" );
			phone += "-" + request.getParameter( "phone2" );
			
			// idFind라는 Member객체를 생성하여 가져온 데이터로 초기화한다.
			Member idFind = new Member();
			idFind.setName( name );
			idFind.setPhone( phone );
			
			// 초기화된 객체를 통해 DB에 접근하여 selectOne한 결과값을 idFound라는 Member객체에 담는다.
			Member idFound = memDao.idFind( idFind );
			
			// idFound라는 Member객체에 값이 존재할 경우
			if( idFound != null ) {
				// id_Find.jsp페이지에서 alert창을 띄운후, login.jsp페이지로 이동한다.
				jsResponse( idFound.getName() + "님의 아이디는 " + idFound.getUserid() + "입니다.", "login.jsp", response );
			} 
			
			// idFound라는 Member객체에 값이 존재하지 않을 경우
			else {
				// id_Find.jsp페이지에서 alert창을 띄운다. 다시 ID를 찾을 수 있게 해당하는 SERVLET의 command값으로 이동한다.( [ 5-1 실행 ] )
				jsResponse( "찾으시는 계정이 존재하지 않습니다.", "SOLOYOLO?command=idFind", response );
			}
		}
		
		
		
		// [ 6-1. login.jsp페이지에서 'PW찾기' 버튼을 클릭 시에 실행된다. ]
		else if( command.equals( "pwFind" ) ) {
			// pw_Find.jsp페이지로 이동한다.
			response.sendRedirect( "pw_Find.jsp" );
		} 
		
		// [ 6-2. pw_Find.jsp페이지에서 'PW찾기' 버튼을 클릭 시에 실행된다. ]
		else if( command.equals( "pwFound" ) ) {
			// 입력된 데이터를 가져와 변수에 저장한다.
			String name = request.getParameter( "name" );
			String phone = request.getParameter( "phone" );
			phone += "-" + request.getParameter( "phone1" );
			phone += "-" + request.getParameter( "phone2" );
			String userid = request.getParameter( "userid" );
			
			// pwFind라는 Member객체를 생성하여 가져온 데이터로 초기화한다.
			Member pwFind = new Member();
			pwFind.setName( name );
			pwFind.setPhone( phone );
			pwFind.setUserid( userid );
			
			// 초기화된 객체를 통해 DB에 접근하여 selectOne한 결과값을 pwFound라는 Member객체에 담는다.
			Member pwFound = memDao.pwFind( pwFind );
			
			// pwFound라는 Member객체에 값이 존재하는 경우
			if( pwFound != null ) {
				// 비밀번호 앞3자리 이후의 값은 *로 표현해주기 위해 문자열 변수 star를 생성한다.
				String star = "";
				// pwFound객체에 userpw값을 가져와 앞 3자리만 잘라 초기값으로 설정한다.( i = 3; )
				// pwFound객체에 userpw값을 가져와 그 길이만큼 for문 실행( i < userpw.length(); )
				for( int i = pwFound.getUserpw().substring( 0, 3 ).length(); i < pwFound.getUserpw().length(); i++ ) {
					// for문이 실행되는 만큼 문자열 star에 '*'값을 추가한다.
					star += "*";
				}
				
				// pw_Find.jsp페이지에서 alert창을 띄운후, login.jsp페이지로 이동한다.
				jsResponse( pwFound.getName() + "님의 비밀번호는 " + pwFound.getUserpw().substring( 0, 3 ) + star + " 입니다.", "login.jsp", response );
			} 
			
			// pwFound라는 Member객체에 값이 존재하지 않는 경우
			else {
				// pw_Find.jsp페이지에서 alert창을 띄운다. 다시 PW를 찾을 수 있게 해당하는 SERVLET의 command값으로 이동한다.( [6-1 실행] )
				jsResponse( "찾으시는 계정이 존재하지 않습니다.", "SOLOYOLO?command=pwFind", response );
			}
		} 
		
		
		
		// [ 7-1. 회원가입된 Member가 myPage를 볼 수 있게 해준다. ]
		else if( command.equals( "myPage" ) ) {
			// 넘겨받은 문자열 값을 해당하는 타입의 맞게 변수에 담아준다.
			int userno = Integer.parseInt( request.getParameter( "userno" ) );
			String grade = request.getParameter( "grade" );
			
			// 넘겨받은 변수 중, grade에 해당하는 값이 'ADMIN'과 동일할 경우( login한 Member가 ADMIN인지 확인한다. )
			if( grade.equals( "ADMIN" ) ) {
				// login한 Member가 ADMIN 즉, 관리자이므로 모든 회원의 정보를 보여주기 위해 Member타입의 List를 생성한다.
				// ( memDao.memberList()는 selectAll를 수행( 회원정보를 모두 가져온다. ) )
				List<Member> memberList = new ArrayList<>();
				memberList = memDao.memberList();
				
				// 가져온 List객체를 request영역에 담아 member_List.jsp페이지로 이동한다.
				request.setAttribute( "memberList", memberList );
				dispatch( "member_List.jsp", request, response );
			} 
			
			// grade의 값이 'ADMIN'과 동일하지 않을 경우( login한 Member가 USER라는 것 )
			else {
				// 넘겨받은 변수 중, 정수형 변수인 userno값을 통해 userInfo라는 Member객체를 생성하여 selectOne해온다.
				// ( memDao.memberOne()은 selectOne을 수행( userno에 해당하는 회원의 정보만 가져온다. ) )
				Member userInfo = memDao.memberOne( userno );
				
				// 가져온 회원정보가 담긴 Member객체인 userInfo를 request영역에 담아 user_myPage.jsp페이지로 이동한다.
				request.setAttribute( "userInfo", userInfo );
				
				List<Favorites> favoList = new ArrayList<>();
				favoList = favoDao.favoSearch( userno );
				
				request.setAttribute( "favoList", favoList );
				
				// 히스토리 리스트 가져오기
				List<History> hisList = new ArrayList<>();
				hisList = hisDao.hisSearch( userno );
				
				// 히스토리 최근 내역 6개를 List에 담기
				List<History> hisRank = new ArrayList<>();
				if( hisList.size() > 6 ) {
					for( int i = 0; i < 6; i++ ) {
						hisRank.add( hisList.get(i) );
					}
				} else {
					for( int i = 0; i < hisList.size(); i++ ) {
						hisRank.add( hisList.get(i) );
					}
				}
				
				request.setAttribute( "hisList", hisRank );
				
				// SNS List
				List<SNS> snsList = new ArrayList<>();
				snsList = snsDao.SNSSearch( memDao.memberOne( userno ).getNickname() );
				
				request.setAttribute( "snsList", snsList );
				
				
				List<Calories> calList = calDao.selectAll( userno );
				
				// 칼로리 최근 내역 6개를 List에 담기
				List<Calories> calRank = new ArrayList<>();
				if( calList.size() > 6 ) {
					for( int i = 0; i < 6; i++ ) {
						calRank.add( calList.get(i) );
					}
				} else {
					for( int i = 0; i < calList.size(); i++ ) {
						calRank.add( calList.get(i) );
					}
				}
				
				request.setAttribute( "calList", calRank );
				
				dispatch( "user_myPage.jsp", request, response);
			}
		} 
		
		// [ 7-2. myPage에서 '회원정보 수정' 버튼을 클릭 시에 실행된다. ]
		else if( command.equals( "userInfoUpdate" ) ) {
			// 넘겨받은 문자열 값을 해당하는 타입의 맞게 변수에 담아준다.
			int userno = Integer.parseInt( request.getParameter( "userno" ) );
			// 넘겨받은 변수 중, 정수형 변수인 userno값을 통해 userInfoUpdate라는 Member객체를 생성하여 selectOne해온다.
			// ( memDao.memberOne()은 selectOne을 수행( userno에 해당하는 회원의 정보만 가져온다. ) )
			Member userInfoUpdate = memDao.memberOne( userno );
			
			// 가져온 회원정보가 담긴 Member객체인 userInfoUpdate를 request영역에 담아 user_infoWrite.jsp페이지로 이동한다.
			request.setAttribute( "userInfoUpdate", userInfoUpdate );
			dispatch( "user_infoWrite.jsp", request, response );
		}
		
		// [ 7-3. user_infoWrite.jsp페이지에서 '수정' 버튼 클릭 시에 실행된다. ]
		else if( command.equals( "updateMember" ) ) {
			// 각 항목의 입력된 값들을 가져와 변수에 담는다.
			int userno = Integer.parseInt( request.getParameter( "userno" ) );
			String userid = request.getParameter( "userid" );
			String userpw = request.getParameter("userpw");
			String name = request.getParameter( "name" );
			String nickname = request.getParameter( "nickname" );
			String email = request.getParameter("email");
			String e_domain = request.getParameter("e_domain");
			email += "@" + e_domain;
			String phone = request.getParameter("phone");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			phone += "-" + phone1 + "-" + phone2;
			double height = Double.parseDouble(request.getParameter("height"));
			double weight = Double.parseDouble(request.getParameter("weight"));
			int postCode = Integer.parseInt( request.getParameter( "postCode" ) );
			Double addr_X = Double.parseDouble( request.getParameter("namex" ) );
			Double addr_Y = Double.parseDouble( request.getParameter("namey" ) );
			String addr = request.getParameter("addr");
			String addr_Detail = request.getParameter("addr_Detail");
			String grade = "USER";
			String[] genres = request.getParameterValues("favogenre");
			String[] hts = request.getParameterValues("favoht");
			
			// 새로운 Member객체를 생성하여 위에 담은 변수들을 객체에 초기화한다.
			Member mem = new Member();
			mem.setUserno( userno );
			mem.setUserid( userid );
			mem.setUserpw( userpw );
			mem.setName(name);
			mem.setNickname(nickname);
			mem.setEmail( email );
			mem.setPhone( phone );
			mem.setHeight( height );
			mem.setWeight( weight );
			mem.setPostCode( postCode );
			mem.setAddr( addr );
			mem.setAddr_Detail( addr_Detail );
			mem.setAddr_X( addr_X );
			mem.setAddr_Y( addr_Y );
			mem.setGrade( grade );
			
			// 영화 장르의 경우, 배열로 들어오기 때문에 배열의 길이에 따라 문자열의 값을 조절하여 초기화한다.
			String favogenre = genres[0];
			if( genres.length > 1 ) {
				for( int i = 1; i < genres.length; i++ ) {
					favogenre += "," + genres[i];
				}
			}
			mem.setFavogenre( favogenre );
			
			// 홈트레이닝 종류의 경우, 배열로 들어오기 때문에 배열의 길이에 따라 문자열의 값을 조절하여 초기화한다.
			String favoht = hts[0];
			if( hts.length > 1 ) {
				for( int i = 1; i < hts.length; i++ ) {
					favoht += "," + hts[i];
				}
			}
			mem.setFavoht( favoht );
			
			// 객체가 제대로 초기화되었는지 console에 출력하여 확인해본다.
			System.out.println( mem );
			
			// 초기화된 객체를 통해 DB에 접근하여 회원가입을 시도한 Member의 정보를 update하고, update된 컬럼의 수만큼 정수값을 반환한다.
			// ( memDao.updateMember()는 update를 수행( 객체에 초기화된 값들을 이용하여 update한다. ) )
			int res = memDao.updateMember( mem );
			
			// DB에 update된 Member가 존재할 경우
			if( res > 0 ) {
				// user_infoWrite.jsp페이지에서 alert창을 띄운다. 그 이후에 해당하는 SERVLET의 command값으로 이동한다.( [7-1 실행] )
				jsResponse( "회원정보 수정 성공 !!", "SOLOYOLO?command=myPage&userno" + userno + "&grade=" + grade, response);
//				jsResponse( "회원정보 수정 성공 !!", "SOLOYOLO?command=myPage&grade=" + grade + "&userno=" + userno, response);
			} else {
				// user_infoWrite.jsp페이지에서 alert창을 띄운다. 그 이후에 다시 정보 수정을 할 수 있게 해당하는 SERVLET의 command값으로 이동한다.( [7-2 실행] )
				jsResponse( "회원정보 수정 실패 !!", "SOLOYOLO?command=userInfoUpdate&userno=" + userno, response);
			}
		}
		
		// [ 7-4. 회원 탈퇴 ]
		else if( command.equals( "userDelete" ) ) {
			int userno = Integer.parseInt( request.getParameter( "userno" ) );
			String grade = request.getParameter( "grade" );
			
			int del_Res = memDao.deleteMember( userno );
			
			String str = "";
			if( del_Res > 0 ) {
				str = "회원 탈퇴 성공 !!!";
				System.out.println( str );
				jsResponse( str, "login.jsp", response);
			} else {
				str = "회원 탈퇴 실패  T.T";
				System.out.println( str );
				jsResponse( str, "SOLOYOLO?command=myPage&userno" + userno + "&grade=" + grade, response);
			}
		}
		
		// [ 7-5. 관리자 회원 탈퇴 ]
		else if( command.equals( "adminDelete" ) ) {
			int userno = Integer.parseInt( request.getParameter( "userno" ) );
			String grade = request.getParameter( "grade" );
			
			int del_Res = memDao.deleteMember( userno );
			
			List<Member> memberList = new ArrayList<>();
			memberList = memDao.memberList();

			request.setAttribute( "memberList", memberList );
			
			String str = "";
			if( del_Res > 0 ) {
				str = "회원 탈퇴 성공 !!!";
				System.out.println( str );
//				jsResponse( str, "member_List.jsp", response);
				dispatch( "member_List.jsp", request, response );
			} else {
				str = "회원 탈퇴 실패  T.T";
				System.out.println( str );
//				jsResponse( str, "member_List.jsp", response);
				dispatch( "member_List.jsp", request, response );
			}
		}
		
		
		
		// [ 8-1. sub_Culture01.jsp - 다음영화 crawling( movie list ) ]
		else if( command.equals( "mList" ) ) {
			int page_res = movieDao.pageNum();
			System.out.println( "controller - page_res : " + page_res );
			
			List<Crawling> mList = new ArrayList<>();
			
			for( int i = 1; i <= page_res; i++ ) {
				mList.addAll( movieDao.mList( i ) );
			}
			
			System.out.println( "mList.size : " +  mList.size() );
			
			String grade = request.getParameter( "grade" );
			System.out.println( grade + "계정으로 로그인 하였습니다." );
			
			if( grade.equals( "ADMIN" ) ) {
				Movie mSave = new Movie();
				Movie mDetail = new Movie();
				int ins_Res = 0;
				
				for( int i = 0; i < mList.size(); i++ ) {
					mSave = movieDao.mDetail( mList.get(i).getMid(), mList.get(i).getMurl() );
					mDetail = movieDao.midSelect( mSave.getMid() );
					
//					System.out.println( mDetail );
					
					if( mDetail == null ) {
						System.out.println( mList.get(i).getMname() + " 영화 저장X → 저장 실행" );
						ins_Res += movieDao.insertMovie( mSave );
					} else {
//						System.out.println( cd.getTitle() + " 영화 저장O → 저장X" );
					}
				}
				
				System.out.println( "con " + ins_Res );
				
				if( ins_Res == mList.size() ) {
					System.out.println( "불러온 영화 상세정보 저장 완료" );
				} else if( ins_Res < mList.size() && ins_Res > 0 ) {
					System.out.println( "이미 저장된 영화 포함하여 " + ins_Res + " 개의 영화 저장" );
				} else {
					System.out.println( "불러온 영화는 이미 저장되어 있습니다." );
				}
			}
			
			request.setAttribute( "mList", mList );
			dispatch( "sub_Culture01.jsp", request, response);
		}
		
		// [8-2. sub_Culture02.jsp ]
		else if( command.equals( "mDetail" ) || command.equals( "mdetail" ) ) {
			int mid = Integer.parseInt( request.getParameter( "mid" ) );
			System.out.println( "[ " + command + " = movieid : " + mid + " ]" );
			
			Movie mDetail = new Movie();
			mDetail = movieDao.midSelect( mid );
			
			System.out.println( mDetail );
			
			request.setAttribute( "command", command );
			request.setAttribute( "mDetail", mDetail );
			
			int mno = mDetail.getMno();
			int divno = Integer.parseInt( request.getParameter( "divno" ) );
			
			MDComment mdcom = new MDComment();
			mdcom.setBoardno( mno );
			mdcom.setDivno( divno );
			
			List<MDComment> mdcomList = null;
			mdcomList = mdcomDao.mdcomList( mdcom );
			
			request.setAttribute( "mdcomList", mdcomList );
			
			dispatch( "sub_Culture02.jsp", request, response);
		}
		
		
		
		
		
		
		
		// ====================================================================================================
		// [ 9-1. 즐겨찾기 추가 ]
		else if( command.equals( "getFavo" ) ) {
			int divno = Integer.parseInt( request.getParameter( "divno" ) );
			int boardno = Integer.parseInt( request.getParameter( "boardno" ) );
			int userno = Integer.parseInt( request.getParameter( "userno" ) );
			String title = request.getParameter( "title" );
			String favoAddr = request.getParameter( "favoAddr" );
			System.out.println( favoAddr );
			
			String divBoard = "";
			switch( divno ) {
				case 1: divBoard = "Culture";
				break;
				case 2: divBoard = "Home Trainning";
				break;
				case 3: divBoard = "Cook";
				break;
				case 4: divBoard = "Delivery";
				break;
			}
			
			System.out.println( divBoard + "게시판의 " + boardno + "번 게시글 [ " + title + " ] 을 " + userno + "번째로 가입한 유저가 클릭하였습니다. 주소는 '" + favoAddr + "'" );
			
//			PrintWriter pwOut = response.getWriter();
//			pwOut.println( favoAddr );
//			System.out.println( "SERVLET에서 sub_Culture02에 보내는 데이터 : " + favoAddr );
			
			// [ 1. Culture 게시판 즐겨찾기 등록 ]
			if( divno == 1 ) {
				String img = movieDao.mnoSelect( boardno ).getMurl();
				
				// userno, favoAddr로 검색
				Favorites searchFavo = new Favorites();
				searchFavo.setUserno( userno );
				searchFavo.setFavoAddr( favoAddr );
				int favo_Ins = 0;
				
				Favorites selectFavo = new Favorites();
				
				selectFavo = favoDao.FavoDuplicate( searchFavo );
				
				System.out.println( "selectFavo = " + selectFavo );
				
				if( selectFavo == null ) {
					System.out.println( "즐겨찾기가 등록되지 않은 게시글 입니다." );
					DivTable divTB = new DivTable();
					String divTBName = "";
					
					divTB = divTBDao.searchDivTB( divno );
					divTBName = divTB.getBname();
					
					System.out.println( "즐겨찾기 : divno - " + divno + ", divTBName - " + divTBName );
					
					Favorites favo = new Favorites();
					favo.setDivno( divno );
					favo.setUserno( userno );
					favo.setTitle( "[ " + divTBName + " ] " + title );
					favo.setImg( img );
					favo.setFavoAddr( favoAddr );
					System.out.println( "favo : " + favo );
					
					favo_Ins = favoDao.insertFavo( favo );
					
					if( favo_Ins > 0 ) {
						JSONObject jsonObjFavo = new JSONObject();
						jsonObjFavo.put( "divBoard", divBoard );
						jsonObjFavo.put( "mno", boardno );
						
						PrintWriter pwOut = response.getWriter();
						pwOut.println( jsonObjFavo.toString() );
						System.out.println( "SERVLET에서 보내는 데이터 : " + jsonObjFavo.toString() );
					} else {
						System.out.println( "즐겨찾기 등록에 실패하였습니다." );
					}
				} else {
					System.out.println( "이미 즐겨찾기에 등록된 게시글 입니다." );
				}
			}
			
			// [ 2. Home Training 게시판 즐겨찾기 등록 ]
			else if( divno == 2 ) {
				String img = htDao.htSelOne( boardno ).getPic();
				
				// userno, favoAddr로 검색
				Favorites searchFavo = new Favorites();
				searchFavo.setUserno( userno );
				searchFavo.setFavoAddr( favoAddr );
				int favo_Ins = 0;
				
				Favorites selectFavo = new Favorites();
				
				selectFavo = favoDao.FavoDuplicate( searchFavo );
				
				System.out.println( "selectFavo = " + selectFavo );
				
				if( selectFavo == null ) {
					System.out.println( "즐겨찾기가 등록되지 않은 게시글 입니다." );
					DivTable divTB = new DivTable();
					String divTBName = "";
					
					divTB = divTBDao.searchDivTB( divno );
					divTBName = divTB.getBname();
					
					System.out.println( "즐겨찾기 : divno - " + divno + ", divTBName - " + divTBName );
					
					Favorites favo = new Favorites();
					favo.setDivno( divno );
					favo.setUserno( userno );
					favo.setTitle( "[ " + divTBName + " ] " + title );
					favo.setImg( img );
					favo.setFavoAddr( favoAddr );
					System.out.println( "favo : " + favo );
					
					favo_Ins = favoDao.insertFavo( favo );
					
					if( favo_Ins > 0 ) {
						JSONObject jsonObjFavo = new JSONObject();
						jsonObjFavo.put( "divBoard", divBoard );
						jsonObjFavo.put( "htno", boardno );
						
						PrintWriter pwOut = response.getWriter();
						pwOut.println( jsonObjFavo.toString() );
						System.out.println( "SERVLET에서 보내는 데이터 : " + jsonObjFavo.toString() );
					} else {
						System.out.println( "즐겨찾기 등록에 실패하였습니다." );
					}
				} else {
					System.out.println( "이미 즐겨찾기에 등록된 게시글 입니다." );
				}
			}
			
			// [ 3. Cook 게시판 즐겨찾기 등록 ]
			else if( divno == 3 ) {
				String img = cDao.cookSelOne( boardno ).getcUrl();
				
				// userno, favoAddr로 검색
				Favorites searchFavo = new Favorites();
				searchFavo.setUserno( userno );
				searchFavo.setFavoAddr( favoAddr );
				int favo_Ins = 0;
				
				Favorites selectFavo = new Favorites();
				
				selectFavo = favoDao.FavoDuplicate( searchFavo );
				
				System.out.println( "selectFavo = " + selectFavo );
				
				if( selectFavo == null ) {
					System.out.println( "즐겨찾기가 등록되지 않은 게시글 입니다." );
					DivTable divTB = new DivTable();
					String divTBName = "";
					
					divTB = divTBDao.searchDivTB( divno );
					divTBName = divTB.getBname();
					
					System.out.println( "즐겨찾기 : divno - " + divno + ", divTBName - " + divTBName );
					
					Favorites favo = new Favorites();
					favo.setDivno( divno );
					favo.setUserno( userno );
					favo.setTitle( "[ " + divTBName + " ] " + title );
					favo.setImg( img );
					favo.setFavoAddr( favoAddr );
					System.out.println( "favo : " + favo );
					
					favo_Ins = favoDao.insertFavo( favo );
					
					if( favo_Ins > 0 ) {
						JSONObject jsonObjFavo = new JSONObject();
						jsonObjFavo.put( "divBoard", divBoard );
						jsonObjFavo.put( "cno", boardno );
						
						PrintWriter pwOut = response.getWriter();
						pwOut.println( jsonObjFavo.toString() );
						System.out.println( "SERVLET에서 보내는 데이터 : " + jsonObjFavo.toString() );
					} else {
						System.out.println( "즐겨찾기 등록에 실패하였습니다." );
					}
				} else {
					System.out.println( "이미 즐겨찾기에 등록된 게시글 입니다." );
				}
			}
			
			// [ 4. Delivery 게시판 즐겨찾기 등록 ]
			else if( divno == 4 ) {
				String img = dDao.shopOne( boardno ).getShopImg();
				
				// userno, favoAddr로 검색
				Favorites searchFavo = new Favorites();
				searchFavo.setUserno( userno );
				searchFavo.setFavoAddr( favoAddr );
				int favo_Ins = 0;
				
				Favorites selectFavo = new Favorites();
				
				selectFavo = favoDao.FavoDuplicate( searchFavo );
				
				System.out.println( "selectFavo = " + selectFavo );
				
				if( selectFavo == null ) {
					System.out.println( "즐겨찾기가 등록되지 않은 게시글 입니다." );
					DivTable divTB = new DivTable();
					String divTBName = "";
					
					divTB = divTBDao.searchDivTB( divno );
					divTBName = divTB.getBname();
					
					System.out.println( "즐겨찾기 : divno - " + divno + ", divTBName - " + divTBName );
					
					Favorites favo = new Favorites();
					favo.setDivno( divno );
					favo.setUserno( userno );
					favo.setTitle( "[ " + divTBName + " ] " + title );
					favo.setImg( img );
					favo.setFavoAddr( favoAddr );
					System.out.println( "favo : " + favo );
					
					favo_Ins = favoDao.insertFavo( favo );
					
					if( favo_Ins > 0 ) {
						JSONObject jsonObjFavo = new JSONObject();
						jsonObjFavo.put( "divBoard", divBoard );
						jsonObjFavo.put( "sno", boardno );
						
						PrintWriter pwOut = response.getWriter();
						pwOut.println( jsonObjFavo.toString() );
						System.out.println( "SERVLET에서 보내는 데이터 : " + jsonObjFavo.toString() );
					} else {
						System.out.println( "즐겨찾기 등록에 실패하였습니다." );
					}
				} else {
					System.out.println( "이미 즐겨찾기에 등록된 게시글 입니다." );
				}
			}
		}
		
		// [ 9-2. 즐겨찾기 삭제 ]
		else if( command.equals( "delFavo" ) ) {
			int userno = Integer.parseInt( request.getParameter( "userno" ) );
			String grade = request.getParameter( "grade" );
			String favoAddr = request.getParameter( "favoAddr" );
			
			System.out.println( userno + "\n" + favoAddr );
			
			// userno, favoAddr로 검색
			Favorites searchFavo = new Favorites();
			searchFavo.setUserno( userno );
			searchFavo.setFavoAddr( favoAddr );
			int del_Favo = 0;
			
			del_Favo = favoDao.deleteFavo( searchFavo );
			
			if( del_Favo > 0 ) {
				String str = "즐겨찾기가 삭제되었습니다.";
				System.out.println( str );
				jsResponse( str, "SOLOYOLO?command=myPage&userno=" + userno + "&grade=" + grade, response );
			}
		}
		
		
		
		// ====================================================================================================
		// [ 히스토리 ]
		else if( command.equals( "getHis" ) ) {
			int divno = Integer.parseInt( request.getParameter( "divno" ) );
			int userno = Integer.parseInt( request.getParameter( "userno" ) );
			String title = request.getParameter( "title" );
			String hisAddr = request.getParameter( "hisAddr" );
			
			// [ 1. Culture 게시판 히스토리 등록 ]
			if( divno == 1 ) {
				int mid = Integer.parseInt( request.getParameter( "mid" ) );
				
				Movie selMno = movieDao.midSelect( mid );
				String img = selMno.getMurl();
				int mno = selMno.getMno();
				
				String divBoard = "";
				switch( divno ) {
					case 1: divBoard = "Culture";
					break;
					case 2: divBoard = "Home Trainning";
					break;
					case 3: divBoard = "Cook";
					break;
					case 4: divBoard = "Delivery";
					break;
				}
				
				System.out.println( divBoard + "게시판의 " + mno + "번 게시글 [ " + title + " ] 을 " + userno + "번째로 가입한 유저가 클릭하였습니다. 주소는 '" + hisAddr + "'" );
				
				// userno, hisAddr로 검색
				History searchHis = new History();
				searchHis.setUserno( userno );
				searchHis.setHisAddr( hisAddr );
				int his_Ins = 0;
				
				History selectHis = null;
				
				// 중복값 확인
				selectHis = hisDao.hisDuplicate( searchHis );
				
				System.out.println( "selectHis = " + selectHis );
				
				
				if( selectHis == null ) {
					System.out.println( "히스토리에 등록되지 않은 게시글 입니다." );
					
					DivTable divTB = new DivTable();
					String divTBName = "";
					
					divTB = divTBDao.searchDivTB( divno );
					divTBName = divTB.getBname();
					
					System.out.println( "히스토리 : divno - " + divno + ", divTBName - " + divTBName );
					
					History his = new History();
					his.setDivno( divno );
					his.setUserno( userno );
					his.setTitle( "[ " + divTBName + " ] " + title );
					his.setImg( img );
					his.setHisAddr( hisAddr );
					System.out.println( "his : " + his );
					
					his_Ins = hisDao.insertHis( his );
					
					if( his_Ins > 0 ) {
						System.out.println("히스토리에 등록되었습니다." );
						JSONObject jsonObjHis = new JSONObject();
						jsonObjHis.put( "divBoard", divBoard );
						jsonObjHis.put( "mno", mno );
						
						PrintWriter pwOut = response.getWriter();
						pwOut.println( jsonObjHis.toString() );
						System.out.println( "SERVLET에서 보내는 데이터 : " + jsonObjHis.toString() );
					} else {
						System.out.println( "히스토리 등록에 실패하였습니다." );
					}
				} else {
					System.out.println( "히스토리에 등록된 게시글 입니다.\n 중복된 게시글 이므로, delete 진행" );
					
					// userno, favoAddr로 검색
					History delHis = new History();
					delHis.setUserno( userno );
					delHis.setHisAddr( hisAddr );
					int his_Up = 0;
					
					his_Up = hisDao.hisUpdate( delHis );
					
					if( his_Up > 0 ) {
						System.out.println( "중복된 히스토리 게시글이 수정되었습니다." );
					}
				}
			}
			
			// [ 2. Home Training 게시판 히스토리 등록 ]
			if( divno == 2 ) {
				int htno = Integer.parseInt( request.getParameter( "boardno" ) );
				
				HomeTraining ht = htDao.htSelOne( htno );
				String img = ht.getPic();
				
				String divBoard = "";
				switch( divno ) {
					case 1: divBoard = "Culture";
					break;
					case 2: divBoard = "Home Trainning";
					break;
					case 3: divBoard = "Cook";
					break;
					case 4: divBoard = "Delivery";
					break;
				}
				
				System.out.println( divBoard + "게시판의 " + htno + "번 게시글 [ " + title + " ] 을 " + userno + "번째로 가입한 유저가 클릭하였습니다. 주소는 '" + hisAddr + "'" );
				
				// userno, hisAddr로 검색
				History searchHis = new History();
				searchHis.setUserno( userno );
				searchHis.setHisAddr( hisAddr );
				int his_Ins = 0;
				
				History selectHis = null;
				
				// 중복값 확인
				selectHis = hisDao.hisDuplicate( searchHis );
				
				System.out.println( "selectHis = " + selectHis );
				
				
				if( selectHis == null ) {
					System.out.println( "히스토리에 등록되지 않은 게시글 입니다." );
					
					DivTable divTB = new DivTable();
					String divTBName = "";
					
					divTB = divTBDao.searchDivTB( divno );
					divTBName = divTB.getBname();
					
					System.out.println( "히스토리 : divno - " + divno + ", divTBName - " + divTBName );
					
					History his = new History();
					his.setDivno( divno );
					his.setUserno( userno );
					his.setTitle( "[ " + divTBName + " ] " + title );
					his.setImg( img );
					his.setHisAddr( hisAddr );
					System.out.println( "his : " + his );
					
					his_Ins = hisDao.insertHis( his );
					
					if( his_Ins > 0 ) {
						System.out.println("히스토리에 등록되었습니다." );
						JSONObject jsonObjHis = new JSONObject();
						jsonObjHis.put( "divBoard", divBoard );
						jsonObjHis.put( "htno", htno );
						
						PrintWriter pwOut = response.getWriter();
						pwOut.println( jsonObjHis.toString() );
						System.out.println( "SERVLET에서 보내는 데이터 : " + jsonObjHis.toString() );
					} else {
						System.out.println( "히스토리 등록에 실패하였습니다." );
					}
				} else {
					System.out.println( "히스토리에 등록된 게시글 입니다.\n 중복된 게시글 이므로, delete 진행" );
					
					// userno, favoAddr로 검색
					History delHis = new History();
					delHis.setUserno( userno );
					delHis.setHisAddr( hisAddr );
					int his_Up = 0;
					
					his_Up = hisDao.hisUpdate( delHis );
					
					if( his_Up > 0 ) {
						System.out.println( "중복된 히스토리 게시글이 수정되었습니다." );
					}
				}
			}
			
			// [ 3. Cook 게시판 히스토리 등록 ]
			if( divno == 3 ) {
				int cno = Integer.parseInt( request.getParameter( "boardno" ) );
				
				Cook cook = cDao.cookSelOne( cno );
				String img = cook.getcUrl();
				
				String divBoard = "";
				switch( divno ) {
					case 1: divBoard = "Culture";
					break;
					case 2: divBoard = "Home Trainning";
					break;
					case 3: divBoard = "Cook";
					break;
					case 4: divBoard = "Delivery";
					break;
				}
				
				System.out.println( divBoard + "게시판의 " + cno + "번 게시글 [ " + title + " ] 을 " + userno + "번째로 가입한 유저가 클릭하였습니다. 주소는 '" + hisAddr + "'" );
				
				// userno, hisAddr로 검색
				History searchHis = new History();
				searchHis.setUserno( userno );
				searchHis.setHisAddr( hisAddr );
				int his_Ins = 0;
				
				History selectHis = null;
				
				// 중복값 확인
				selectHis = hisDao.hisDuplicate( searchHis );
				
				System.out.println( "selectHis = " + selectHis );
				
				
				if( selectHis == null ) {
					System.out.println( "히스토리에 등록되지 않은 게시글 입니다." );
					
					DivTable divTB = new DivTable();
					String divTBName = "";
					
					divTB = divTBDao.searchDivTB( divno );
					divTBName = divTB.getBname();
					
					System.out.println( "히스토리 : divno - " + divno + ", divTBName - " + divTBName );
					
					History his = new History();
					his.setDivno( divno );
					his.setUserno( userno );
					his.setTitle( "[ " + divTBName + " ] " + title );
					his.setImg( img );
					his.setHisAddr( hisAddr );
					System.out.println( "his : " + his );
					
					his_Ins = hisDao.insertHis( his );
					
					if( his_Ins > 0 ) {
						System.out.println("히스토리에 등록되었습니다." );
						JSONObject jsonObjHis = new JSONObject();
						jsonObjHis.put( "divBoard", divBoard );
						jsonObjHis.put( "cno", cno );
						
						PrintWriter pwOut = response.getWriter();
						pwOut.println( jsonObjHis.toString() );
						System.out.println( "SERVLET에서 보내는 데이터 : " + jsonObjHis.toString() );
					} else {
						System.out.println( "히스토리 등록에 실패하였습니다." );
					}
				} else {
					System.out.println( "히스토리에 등록된 게시글 입니다.\n 중복된 게시글 이므로, delete 진행" );
					
					// userno, favoAddr로 검색
					History delHis = new History();
					delHis.setUserno( userno );
					delHis.setHisAddr( hisAddr );
					int his_Up = 0;
					
					his_Up = hisDao.hisUpdate( delHis );
					
					if( his_Up > 0 ) {
						System.out.println( "중복된 히스토리 게시글이 수정되었습니다." );
					}
				}
			}
			
			// [ 4. Delivery 게시판 히스토리 등록 ]
			if( divno == 4 ) {
				int sno = Integer.parseInt( request.getParameter( "boardno" ) );
				
				Shop shop = dDao.shopOne( sno );
				String img = shop.getShopImg();
				
				String divBoard = "";
				switch( divno ) {
					case 1: divBoard = "Culture";
					break;
					case 2: divBoard = "Home Trainning";
					break;
					case 3: divBoard = "Cook";
					break;
					case 4: divBoard = "Delivery";
					break;
				}
				
				System.out.println( divBoard + "게시판의 " + sno + "번 게시글 [ " + title + " ] 을 " + userno + "번째로 가입한 유저가 클릭하였습니다. 주소는 '" + hisAddr + "'" );
				
				// userno, hisAddr로 검색
				History searchHis = new History();
				searchHis.setUserno( userno );
				searchHis.setHisAddr( hisAddr );
				int his_Ins = 0;
				
				History selectHis = null;
				
				// 중복값 확인
				selectHis = hisDao.hisDuplicate( searchHis );
				
				System.out.println( "selectHis = " + selectHis );
				
				
				if( selectHis == null ) {
					System.out.println( "히스토리에 등록되지 않은 게시글 입니다." );
					
					DivTable divTB = new DivTable();
					String divTBName = "";
					
					divTB = divTBDao.searchDivTB( divno );
					divTBName = divTB.getBname();
					
					System.out.println( "히스토리 : divno - " + divno + ", divTBName - " + divTBName );
					
					History his = new History();
					his.setDivno( divno );
					his.setUserno( userno );
					his.setTitle( "[ " + divTBName + " ] " + title );
					his.setImg( img );
					his.setHisAddr( hisAddr );
					System.out.println( "his : " + his );
					
					his_Ins = hisDao.insertHis( his );
					
					if( his_Ins > 0 ) {
						System.out.println("히스토리에 등록되었습니다." );
						JSONObject jsonObjHis = new JSONObject();
						jsonObjHis.put( "divBoard", divBoard );
						jsonObjHis.put( "sno", sno );
						
						PrintWriter pwOut = response.getWriter();
						pwOut.println( jsonObjHis.toString() );
						System.out.println( "SERVLET에서 보내는 데이터 : " + jsonObjHis.toString() );
					} else {
						System.out.println( "히스토리 등록에 실패하였습니다." );
					}
				} else {
					System.out.println( "히스토리에 등록된 게시글 입니다.\n 중복된 게시글 이므로, delete 진행" );
					
					// userno, favoAddr로 검색
					History delHis = new History();
					delHis.setUserno( userno );
					delHis.setHisAddr( hisAddr );
					int his_Up = 0;
					
					his_Up = hisDao.hisUpdate( delHis );
					
					if( his_Up > 0 ) {
						System.out.println( "중복된 히스토리 게시글이 수정되었습니다." );
					}
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
