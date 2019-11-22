<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/gssi.jsp" %>
<jsp:useBean id ="dto" class="guest.GuestDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	flag = dao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
  <title>등록확인</title>
  <meta charset="utf-8">
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container mt-5">
	<div class="alert alert-success">
		<%
			if(flag){
				out.print("등록되었습니다.");
			}else{
				out.print("다시입력해주세요");
			}
		%>
	</div>
	<button onclick="location.href='./createForm.jsp'" class="btn btn-primary">다시등록</button>
	<button onclick="location.href='./list.jsp'" class="btn btn-info">목록</button>
</div>
</body>
</html>