<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>
<%
 String id = request.getParameter("id");
 String passwd = request.getParameter("passwd");
 
 Map map = new HashMap();
 map.put("id", id);
 map.put("pw", passwd);
 
 flag = dao.updatePw(map);
%>

<!DOCTYPE html>
<html>
<head>
  <title>비밀번호확인</title>
  <meta charset="utf-8">
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">비밀번호확인</h1>
  <%  if(flag){ %>
  <script>
  alert("비밀번호 변경 성공하였습니다.");
	window.location.href="<%=root%>/join/loginForm.jsp";
  </script>
  <% }else{ %>
  <script>
  alert("비밀번호 변경 실패하였습니다.");
	window.location.href="<%=root%>/join/updatePwProc.jsp";
  </script>
  <%}  %>

</div>
</body>
</html>