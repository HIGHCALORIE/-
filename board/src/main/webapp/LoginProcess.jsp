<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="membership.MemberDTO" %>
    <%@page import="membership.MemberDAO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//로그인 폼으로 부터 받은 아이디와 패스워드
String userId=request.getParameter("user_id");
String userPs=request.getParameter("user_pw");


//회원테이블에 DAO를 통해 회원정보 DTO 획득
MemberDAO dao= new MemberDAO(application);	
MemberDTO member = dao.getMemberDTO(userId, userPs);
dao.close();

//로그인 성공확인 여부
if(member.getUser_id() != null){
	//로그인 성공
	session.setAttribute("UserId", member.getUser_id());
	session.setAttribute("UserName",member.getUsername());
	response.sendRedirect("LoginForm.jsp");
	
}else {
	//로그인 실패
	request.setAttribute("LoginErrMsg", "로그인 오류 아이디, 비밀번호 확인!");
	request.getRequestDispatcher("LoginForm.jsp").forward(request,response);
}

%>


</body>
</html>