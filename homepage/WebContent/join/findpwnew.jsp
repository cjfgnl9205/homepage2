<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>

<%
String mname = request.getParameter("mname");
String id = request.getParameter("id");

Map map = new HashMap();
map.put("mname", mname);
map.put("id", id);

String pw = dao.pwFind(map);

String str = "";

if(pw!=null){
	str = pw.trim();
}else{
	str = "정보를 확인해주세요";
}
out.print(str);

%>
