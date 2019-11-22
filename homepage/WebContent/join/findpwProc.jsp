<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>

<%
String mname = request.getParameter("mname");
String id = request.getParameter("id");

Map map = new HashMap();
map.put("mname", mname);
map.put("id", id);




String pw = dao.pwFind(map);

%>


<!DOCTYPE html>
<html>
<head>
  <title>비밀전호찾기</title>
  <meta charset="utf-8">
<script>
function use(){
	self.close();
	
}

</script>
</head>
<body>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel = "stylesheet" href="/homepage/css/bootstrap.min.css">
<link rel = "stylesheet" href="/homepage/css/custom.css">
 <%if(pw !=null){ %>
<script>
alert("password : <%=pw%> 입니다.");
window.location.href="<%=root%>/join/loginForm.jsp";

opener.frm.passwd.value='<%=pw%>';
</script>
<%}else{%>
<script>
alert("정보를 확인해주세요");
window.location.href="<%=root%>/join/loginForm.jsp";
</script>
<% } %>
</body>
</html>