<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//session.invalidate();  다지우겠다..
	session.removeAttribute("id");  // id로 저장된 속성만 지우기
	
	response.sendRedirect("../index.jsp");


%>