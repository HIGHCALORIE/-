<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.*" %>
<%@ include file="IsLoggedIn.jsp"%>

<!-- 폼 값 받기 -->
<%
String title = request.getParameter("title");
String content = request.getParameter("content");
%>
<!-- boardDTO객체에 저장 -->
<%

boardDTO dto= new boardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("UserId").toString());
//member아이디를 저장
%>

<!-- dao객체를 통해 db에 dto저장 -->
<%
boardDAO dao = new boardDAO(application);
int iResult = dao.insertWrite(dto);

%>

<!-- 성공 -->

<%
if(iResult==1){
	response.sendRedirect("List.jsp");
}else{
	request.getRequestDispatcher("List.jsp").forward(request,response);
}


%>


