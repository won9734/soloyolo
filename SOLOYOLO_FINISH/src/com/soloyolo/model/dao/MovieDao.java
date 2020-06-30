package com.soloyolo.model.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.soloyolo.model.dto.Crawling;
import com.soloyolo.model.dto.Movie;

public class MovieDao extends SqlMapConfig {
	String url = "https://movie.daum.net/premovie/released";
	String namespace = "soloyolo.Movie.";
	
	public int pageNum() {
		String page_Chk = "";
		int page_res = 0;
		try {
			Document doc = Jsoup.connect( url ).get();
			
			for( Element moviePage : doc.select( "span.inner_paging > a" ) ) {
				page_Chk = moviePage.getElementsByAttribute( "href" ).attr( "href" ) + ",";
			}
			
			String[] page_Arr = page_Chk.split( "," );
			for( int i = 0; i < page_Arr.length; i++ ) {
				if( i == page_Arr.length - 1 ) {
					page_res = Integer.parseInt( page_Arr[i].split( "=" )[2] );
				}
			}
			System.out.println( "몇개의 페이지 : " + page_res );
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return page_res;
	}
	
	public List<Crawling> mList( int page_res ) {
//		  - Document 클래스 : 연결해서 얻어온 HTML전체 문서
//		  - Element  클래스 : Document의 HTML요소
//		  - Elements 클래스 : Element가 모인 자료	
		List<Crawling> res = new ArrayList<>();

		String realUrl = ""; 
		
		if( page_res == 1 ) {
			realUrl += "https://movie.daum.net/premovie/released";
		} else {
			realUrl += "https://movie.daum.net/premovie/released?opt=reserve&page=" + page_res;
		}
		
		String img_res = "";
		String title_res = "";
		String movieid_res = "";
		
		try {
			Document realDoc = Jsoup.connect( realUrl ).get();
			
			Elements img = realDoc.select( "img[src]" );

			System.out.println( img.size() + "개의 영화 포스터 img url 가져옴" );
			for(Element imgs : img) {
				img_res += imgs + ",";
			}
			System.out.println( "영화 포스터 가져오기 완료" );
			
			for(Element title : realDoc.select( "div.info_tit > a" )) {
				title_res += title.text() + ",";
			}
			System.out.println( "영화 제목 가져오기 완료" );
			
			for( Element movie : realDoc.select( "div.info_tit > a" ) ) {
				movieid_res += movie.getElementsByAttribute( "href" ).attr( "href" ) + ",";
			}
			
			String[] img_final = img_res.split( "," );
			String[] title_final = title_res.split( "," );
			String[] movieid_final = movieid_res.split( "," );
			
			int[] mid_final = new int[ movieid_final.length ];
			for( int i = 0; i < movieid_final.length; i++ ) {
				mid_final[i] = Integer.parseInt( movieid_final[i].split( "=" )[1] );
			}
			
			for( int i = 0; i < img.size(); i++ ) {
				Crawling tmp = new Crawling();
				tmp.setMurl( img_final[i] );
				tmp.setMname( title_final[i] );
				tmp.setMid( mid_final[i] );

				res.add( tmp );
			}
			System.out.println( page_res + "번째 페이지의 영화 저장 완료" );
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public Movie mDetail( int movieid, String img ) {
		/* String detailUrl = "https://movie.daum.net/" + movieid; */
		String detailUrl = "https://movie.daum.net/moviedb/main?movieId=" + movieid;
		Movie movie = new Movie();
/*
	private int mno;
	private String mname;
	private String genre;
	private String nation;
	private String release;
	private String mgrade;
	private double mscore;
	private String mintro;
	private String mtime;
	private String murl;
	private String director;
	private String actor;
	private int movieid;
 */
		
		try {
			Document doc = Jsoup.connect( detailUrl ).get();
			// 제목
			String mname = doc.select("div.subject_movie > strong.tit_movie").text();
			
			// 장르, 개봉일, 제작국가, 상영시간, 상영등급
			String str01 = doc.select( "dl.list_movie > dd.txt_main" ).text();
			
			String[] splitStr01 = str01.split( " " );
			String genre = splitStr01[0];
			String mday = splitStr01[1];
			
			String str02 = doc.select( "dl.list_movie > dd+dd" ).text();
			
			String nation = "";
			String runtime = "";
			String grade = "";
			String[] splitStr02 = str02.split( ",| " );
			
//			System.out.println( "장르, 개봉일, 제작국가, 상영시간, 상영등급 확인" );
//			for( int i = 0; i < splitStr02.length; i++ ) {
//				System.out.println( splitStr02[i] );
//			}
//			System.out.println( "========================================" );
			
			if( splitStr02.length > 3 ) {
				nation = splitStr02[0];
				runtime = splitStr02[1];
				grade = splitStr02[3];
				
				if( splitStr02.length > 5 ) {
					nation += ", " + splitStr02[2];
					runtime = splitStr02[3];
					grade = splitStr02[5];
					
					if( splitStr02.length > 11 ) {
						for( int i = 4; i <= 8; i+=2 ) {
							nation += ", " + splitStr02[i];
						}
						runtime = splitStr02[9];
						grade = splitStr02[11];
					}
				}
			}
			
			// 감독, 주연
//			String director = doc.select( "dd.type_ellipsis > a.link_person" ).text();
			String dir = doc.select( "dd.type_ellipsis" ).text();
//			System.out.println( dir );
			String[] dirArr = dir.split( "\\(|\\)" );
			
//			System.out.println( "dirArr.length : " + dirArr.length );
			
			String director = "";
			String actor = "";

			if( dirArr.length > 2 ) {
				director = dirArr[2].trim();
				
				if( dirArr.length > 4 ) {
					actor = dirArr[4].trim();
				}
			}
//			System.out.println( "dir : " + director + "\tactor : " + actor );
			
			// 평점
			double score = Double.parseDouble( doc.select("div.subject_movie em.emph_grade").text() );
			
			// 줄거리
			String intro = doc.select( "div.main_detail > div.desc_movie > p" ).html();
			
//			System.out.println( "[ MovieDao.mDetail ]" );
//			System.out.println( "mname : " + mname + "\ngenre : " + genre + "\nnation : " + nation + "\nmday : " + mday + "\nruntime : " + runtime + "\ngrade : " + grade + "\nscore : " + score + "\nintro : " + intro );
			
			movie.setMname( mname.trim() );
			movie.setGenre( genre.trim() );
			movie.setNation( nation.trim() );
			movie.setRelease( mday.trim() );
			movie.setMgrade( grade.trim() );
			movie.setMscore( score );
			movie.setMintro( intro.trim() );
			movie.setMtime( runtime.trim() );
			movie.setMurl( img );
			movie.setDirector( director.trim() );
			movie.setActor( actor.trim() );
			movie.setMid( movieid );
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return movie;
	}
	
	
	
	public List<Movie> selectAll() {
		List<Movie> selAll_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			selAll_Res = session.selectList( namespace + "movieAll" );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return selAll_Res;
	}
	
	public int insertMovie( Movie movie ) {
		int ins_Res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			ins_Res = session.insert( namespace + "insertMovie", movie );
			if( ins_Res > 0 ) {
				session.commit();
			}
		} catch ( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return ins_Res;
	}
	
	public Movie mnoSelect( int mno ) {
		Movie selOne_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			selOne_Res = session.selectOne( namespace + "mnoSelect", mno );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return selOne_Res;
	}
	
	public Movie midSelect( int mid ) {
		Movie selOne_Res = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			selOne_Res = session.selectOne( namespace + "midSelect", mid );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return selOne_Res;
	}
	
//	public Movie selDetail( int mid ) {
//		Movie selOne_Res = null;
//		SqlSession session = null;
//		
//		try {
//			session = getSqlSessionFactory().openSession( true );
//			selOne_Res = session.selectOne( namespace + "selDetail", mid );
//		} catch( Exception e ) {
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//		
//		return selOne_Res;
//	}
	
	
	
	
	
	// ==================== [ SEARCH ] ==================== //
	
	
	
	public List<Crawling> movieSearch( String[] values ) {
		List<Crawling> movieSearch = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			movieSearch = session.selectList( namespace + "movieSearch", values );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return movieSearch;
	}
	
	public List<Crawling> movieWordSearch( String search ) {
		List<Crawling> movieWordSearch = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession( true );
			movieWordSearch = session.selectList( namespace + "movieWordSearch", search );
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return movieWordSearch;
	}
	
	// 장르 선택
	public List<Crawling> movieGenre( String[] genre ) {
		List<Crawling> movieGenre = null;
		
		// 체크박스에 체크된 장르 value들을 담은 배열( genre )의 길이만큼 새로운 배열 생성
		String[] genres = new String[genre.length];
		
		// 새롭게 생성된 배열에 좌우 공백을 제거하여 장르 value값 초기화
		for( int i = 0; i < genre.length; i++ ) {
			if( genre[i] != null ) {
				for( String data : genre[i].trim().split("/") ) {
					genres[i] = data;
				}
			}
		}
		
		// 선택된 장르 출력
		for( String str : genres ) {
			System.out.println( "선택된 장르 : " + str );
		}
		
		movieGenre = movieSearch( genres );
		System.out.println( movieGenre );
		
		return movieGenre;
	}
	
	// 선호하는 장르
	public List<Crawling> movieRecommend( String recommend ) {
		List<Crawling> movieRecommend = null;
		
		String[] recomValues = recommend.split( "," );
		String[] recommends = new String[recomValues.length];
		
		// 새롭게 생성된 배열에 좌우 공백을 제거하여 선호하는 장르 value값 초기화
		for( int i = 0; i < recomValues.length; i++ ) {
			if( recomValues[i] != null ) {
				for( String data : recomValues[i].trim().split("/") ) {
					recommends[i] = data;
				}
			}
		}
		
		// 선호하는 장르 출력
		for( String str : recommends ) {
			System.out.println( "선택된 장르 : " + str );
		}
		
		movieRecommend = movieSearch( recommends );
		
		return movieRecommend;
	}
}
