<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import = "kiosk.KioskDAO" %>
    <%@page import = "kiosk.KioskDTO" %>

  <script>
console.log("대지")
</script>


  <%
  String fid=request.getParameter("fid");
  String fname=request.getParameter("fname");
  String price=request.getParameter("price");  
  String category=request.getParameter("category");
  String explain=request.getParameter("explain");
  
  
  KioskDTO dto = new KioskDTO();
  
  dto.setFid(fid);
  dto.setFname(fname);
  dto.setPrice(price);
  dto.setCategory(category);
  dto.setExplain(explain);
  
  
  KioskDAO dao = new KioskDAO(application);
  int result = dao.insertmenu(dto);
  
  
  if(result ==1){
	  response.sendRedirect("menumana.jsp");
  }else{
	  request.getRequestDispatcher("menumodi.jsp").forward(request, response);
  } 
  
  
  %>
  
  
  
  
  <script>
console.log("대지")
</script>
  
  
  
  
  
  
