<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>

<%
String mname = request.getParameter("mname");
String email = request.getParameter("email");

Map map = new HashMap();
map.put("mname", mname);
map.put("email", email);

String id = dao.idFind(map);

%>


<!DOCTYPE html>
<html>
<head>
  <title>아이디찾기</title>
  <meta charset="utf-8">
</head>
<body>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel = "stylesheet" href="/homepage/css/bootstrap.min.css">
<link rel = "stylesheet" href="/homepage/css/custom.css">
 <%if(id !=null){ %>
<script>
alert("ID : <%=id%> 입니다.");
window.location.href="<%=root%>/join/loginForm.jsp";
opener.frm.id.value='<%=id%>';
</script>

<%}else{%>
<script>
alert("정보를 확인해주세요");
window.location.href="<%=root%>/join/loginForm.jsp";
</script>
<% } %>

</body>
</html>