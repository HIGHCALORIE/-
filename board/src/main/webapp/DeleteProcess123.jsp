<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.boardDAO"%>
<%@ page import="model1.board.boardDTO"%>
<%@ page import="utils.JSFunction"%>
<%@ include file="IsLoggedIn.jsp" %>
<%
  //일련번호 num 받기 
  String num = request.getParameter("num");

  //DTO 객체생성
  boardDTO dto = new boardDTO();
  //DAO 객체생성 
  boardDAO dao = new boardDAO(application);
  //주어진 일련번호에 해당하는 기존 게시물 얻기  dao.selectView(num)
  dto = dao.selectView(num);
  //로그인된 사용자 ID얻기 
  String sessionId = session.getAttribute("UserId").toString();
  
  int result = 0;
  //만약 작성자가 본인이라면 deletePost(dto) 실행 
    if(sessionId.equals(dto.getId())){
    	dto.setNum(num);
    	result = dao.deletePost(dto);
    	dao.close();
      
       if(result == 1){
    	     //성공시 목록 페이지로 이동
    	   JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
    	   
       }else{
    	   JSFunction.alertBack("삭제에 실패하였습니다.", out);
       }	
      	
    }else{
    	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
    	return;    	
    }
  
  




%>