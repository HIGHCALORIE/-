<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("UserId")==null){
	request.setAttribute("LoginErrMsg", "로그인 오류");
	request.getRequestDispatcher("LoginForm.jsp").forward(request,response);
}
%>