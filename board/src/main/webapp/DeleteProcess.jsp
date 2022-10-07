<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model1.board.boardDAO"%>
<%@ page import="model1.board.boardDTO"%>
<%@ page import="utils.JSFunction"%>

<% 

String num=request.getParameter("num");


boardDTO dto= new boardDTO();

boardDAO dao= new boardDAO(application);

dto=dao.selectView(num);



//로그인된 사용자 id 얻기
String sessionId=session.getAttribute("UserId").toString();

int result = 0;

if (sessionId.equals(dto.getId())) {  
	dto.setNum(num);
	result = dao.deletePost(dto);
	dao.close();
	
	
	if(result ==1){
		 JSFunction.alertLocation("삭제 진행합니다!", "List.jsp", out);
		
	}else{
 	   JSFunction.alertBack("삭제에 실패하였습니다.", out);
    }	
	
}
else{
	JSFunction.alertBack("작성자 본인만 삭제할 수 있습니다.", out);
return;
	
}

%>