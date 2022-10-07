package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import db.JDBConnect;

public class boardDAO extends JDBConnect {

	public boardDAO(ServletContext application) {
		super(application);   //application을 통해 web.xml 에 정의해둔 오라클 접속 정보를 가져와 db연동 
	}
	
	
	//검색조건에 맞는 개시물의 개수를 반환하는 selectCount(Map<String,object> map)
	
	public int selectCount(Map<String, Object>map) {
		//쿼리 작성
		int totalcount=0;  //결과(게시물 수)를 담을 변수
		
		//동적쿼리 생성
		String query = "select count(*) from board";
		if (map.get("searchWord") != null) {
			query +=" where " + map.get("searchField") +" "
							+ " LIKE '%"+map.get("searchWord")+"%'";
		}
		//쿼리문 생성
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
			rs.next(); //커서를 첫번째 행으로 이동
			totalcount = rs.getInt(1); //첫번째 컬럼값을 가져옴
			
			
	
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("게시물 수를 구하는 중 예외발생");
			e.printStackTrace();
		}
		
		return totalcount;
	}
	
	//검색조건에 맞는 게시물 목록을 반환하는 selectList(Map<String,object> map)
	
	public List<boardDTO> selectList(Map<String,Object>map){
		List<boardDTO> bbs = new Vector<boardDTO>(); // 결과(게시물 목록)을 담을 변수
		//list계열의 collection은 데이터가 순서대로 저장되어 인덱스를 통해 가져올수 있기 때문
		String query="select * from board ";
		if(map.get("searchword")!=null) {
			query += " where "+map.get("searchField")+" "+" LIKE '%" +
										map.get(" searchword ")+"%'";
		}
		query +=" order by num desc ";
		
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
			while(rs.next()) {
				boardDTO dto = new boardDTO();
				dto.setNum(rs.getString("num")); 		  //일련번호
				dto.setTitle(rs.getString("title"));  	  //제목
				dto.setContent(rs.getString("content"));  //내용
				dto.setPostdate(rs.getDate("postdate"));  //날짜
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				bbs.add(dto); //결과를 목록에 저장
				
				
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
				
		
		return bbs;
	}
	//board 테이블에 새글 저장 기능
			public int insertWrite(boardDTO dto) {
				int result=0;
				
			//inset쿼리문 작성
				
				try {
					
					String query="insert into board values ( "									
								+" seq_board_num.nextval, ?, ?, ?, sysdate, 0)";
					
					psmt = con.prepareStatement(query);
					psmt.setString(1, dto.getTitle());
					psmt.setString(2, dto.getContent());
					psmt.setString(3, dto.getId());
					
					
					result=psmt.executeUpdate();  //동적쿼리 실행
					
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("글쓰는 도중 예외 발생!");
					e.printStackTrace();
				}							
				
				return result;
			}
	
	public void updateVisitCount(String num){
		//쿼리문 준비
		String query = "update board set "
						+" visitcount = visitcount + 1 "
						+" where num = ?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
			
		}
		
		
	}
	
	public boardDTO selectView(String num) {
		boardDTO dto = new boardDTO(); //해당 num값의 board테이블의 row값을 담는다.
		//쿼리문 작성
		String query= " select B.*, M.name "
					  + " from member M inner join board B"
					  + " on M.id = B.id "
					  + " where num=?";
		
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1,num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("게시물 상세보기중 예외 발생");
			e.printStackTrace();
		}		
		return dto;
	}
	
	
	public int updateEdit(boardDTO dto) {
		int result=0;
		try {
			String query = " update board set "
						   + " title=?, content=? "
						   + " where num=? ";
			psmt=con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("업데이트 도중 예외 발생!!");
			e.printStackTrace();
		}		
		
		return result;		
		
	}
	
	
	public int deletePost(boardDTO dto) {
		int result=0;
		
		try {
			String query = " delete from board where num=?";
					    
			
			psmt=con.prepareStatement(query);
					
			psmt.setString(1, dto.getNum());
			
			result=psmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("삭제하려했는대 예외발생");
			e.printStackTrace();
		}
				
		return result;
	}
	
	
	
	
	
	
}
