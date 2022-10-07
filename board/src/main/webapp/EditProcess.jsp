<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="model1.board.boardDAO"%>
<%@ page import="model1.board.boardDTO"%>
<%@ page import="utils.JSFunction"%>

<%
String num=request.getParameter("num");
String title= request.getParameter("title");
String content=request.getParameter("content");



boardDTO dto = new boardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

//db에 반영 : board테이블에 num과 같은 row를 업데이트
boardDAO dao = new boardDAO(application);
int result=dao.updateEdit(dto);



%>


