<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="join.JoinDAO"></jsp:useBean>
<%
String id = request.getParameter("id");
boolean flag = dao.duplicateId(id);

String str = "";
if(flag){
	str = id+"는 중복되어 사용할수 없습니다.";
}else{
	str = id+"는 사용할수 있습니다.";
}

out.print(str);
%>