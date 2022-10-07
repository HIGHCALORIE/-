package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import db.JDBConnect; 

public class boardDAO2 extends JDBConnect {
   
	   public boardDAO2(ServletContext application) {
		      super(application);  
		     //application을 통해 web.xml에 정의해둔 오라클 접속 정보를 가져와 db연동 
	   }
 
	   //검색조건에 맞는 개시물의 개수를 반환하는 selectCount(Map<String,Object> map)
	   
	   public int selectCount(Map<String,Object> map) {
		     int totalcount = 0;  //결과(게시물 수)를 담을 변수
		       //동적 쿼리 생성 중요!
		   String query = "SELECT COUNT(*) FROM board";
		     if(map.get("searchWord") != null) {
		    	 query += " where" + map.get("searchField") +" " 
		                             +" LIKE '%" + map.get("searchWord") + "%'";
		     }
		   
		  //쿼리문 생성 
		     try {
		    	 stmt = con.createStatement();
		    	 rs = stmt.executeQuery(query);   //쿼리문 실행 
		    	 rs.next(); //커서를 첫번째 행으로 이동
		    	 totalcount = rs.getInt(1); //첫번째 컬럼값을 가져옴
		     }catch (Exception e) {
				System.out.println("게시물 수를 구하는 중 예외발생");
				e.printStackTrace();
			}
		 	   
		   return totalcount;}
	   
	   
	   //검색조건에 맞는 게시물 목록을 반환하는 selectList(Map<String,Object> map) 	 
	   
	   public List<boardDTO> selectList(Map<String,Object> map){
		    List<boardDTO> bbs = new ArrayList<boardDTO>(); //결과(게시물 목록)을  담을 변수
		    //List계열의 collection은 데이터가 순서대로 저장되어 인덱스를 통해 가져올수 있기때문에  
		    String query = "SELECT * FROM board ";
		    if(map.get("searchWord") !=null) {
		    	query += " WHERE " + map.get("searchField") + " " + " LIKE '%"  
		                       + map.get("searchWord") + "%' ";
		    }            
		    query += "ORDER BY num DESC ";
		    
		    try {
		    	stmt = con.createStatement();
		    	rs = stmt.executeQuery(query);
		    	
		    	while(rs.next()) {
		    		boardDTO dto = new boardDTO();
		    		
		    		dto.setNum(rs.getString("num"));  //일련번호
		    		dto.setTitle(rs.getString("title")); //제목
		    		dto.setContent(rs.getString("content")); //내용
		    		dto.setPostdate(rs.getDate("postdate"));
		    		dto.setId(rs.getString("id"));
		    		dto.setVisitcount(rs.getString("visitcount"));
		    		bbs.add(dto); // 결과 목록에 저장 
		    	}
				
			} catch (Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
		    
		   return bbs; 
	   }
	   
}













