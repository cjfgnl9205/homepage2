<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>
<%
String mname = request.getParameter("mname");
String email = request.getParameter("email");

Map map = new HashMap();
map.put("mname", mname);
map.put("email", email);

String id = dao.idFind(map);
String str = "";

if(id!=null){
	str = id.trim();
}else{
	str = "정보를 확인해주세요";
}


out.print(str);
%>