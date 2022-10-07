<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%SimpleDateFormat date = new SimpleDateFormat("HH:mm:ss");
    long createTime = session.getCreationTime(); //최초 요청(세션생성)시각
    String creationTimeStr = date.format(new Date(createTime));
    
    long lastTime = session.getLastAccessedTime(); //마지막 요청(세션)시각
    String lastTimeStr = date.format(new Date(lastTime));
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 확인</title>
</head>
<body>
<ul>
<li>세션 유지시간 : <%=session.getMaxInactiveInterval()%> </li>
<li>세션 아이디 : <%=session.getId() %> </li>
<li> 세션 요청 시간 : <%=creationTimeStr %> </li>
<li> 마지막 요청 시간 : <%=lastTimeStr %> </li>
</ul>




</body>
</html>