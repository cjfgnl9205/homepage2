<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>
<%
	String email = request.getParameter("email");
	flag = dao.duplicateEmail(email);
%>
<!DOCTYPE html>
<html>
<head>
  <title>email중복확인</title>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
function use(){
	opener.frm.email.value='<%=email%>';
	self.close();
}
</script>
</head>
<body>
<div class="container">
<br><br>
	<div class = "well well-lg col-sm-offset-1 col-sm-4">
		<br>
		입력된 이메일 : <%=email %> <br><br>
		<%
			if(flag){
				out.print("중복되어 사용할수없습니다.");
			}else{
				out.print("사용가능합니다.");
				out.print("<button class='btn btn-default' onclick = 'use()'>사용</button>");
			}
		%>
	</div>
      <div class="col-sm-offset-2 col-sm-6">
        <button class="btn btn-default" onclick = "location.href='email_form.jsp'">다시시도</button>
        <button class="btn btn-default" onclick = "window.close()">닫기</button>
      </div>
</div>
</body>
</html>