<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>
<jsp:useBean id="dto" class="join.JoinDTO"/>
<jsp:setProperty  name="dto" property="*"/>

<%
flag=dao.update(dto);
%>
<!DOCTYPE html>
<html>
<head>
  <title>회원수정</title>
  <meta charset="utf-8">
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">회원수정</h1>
<%if(flag){%>
<script>
alert("회원정보가 수정되었습니다.");
location.href="read.jsp?id=<%=dto.getId()%>";
</script>
<%}else{ %>
alert("회원정보가 실패했습니다.");
history.back();
<%} %>

</div>
</body>
</html>