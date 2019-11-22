<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>

<%

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	String id = upload.getParameter("id");
	String email = upload.getParameter("email");
	
	String str = "";
	
	if(dao.duplicateId(id)){
		str = "중복된 아이디 입니다. 아이디 중복을 확인하세요";
	}else if(dao.duplicateEmail(email)){
		str ="중복된 이메일입니다. 이메일을 확인하세요";
	}else{
		// 보낸 파일 및 파라매터받아서 dto에 저장하고 dao를통해서 DB에 저장
		
		request.setAttribute("upload", upload);
		
%>
		<jsp:forward page = "/join/createProc.jsp"/>

<%
	return;
	}
%>
<!DOCTYPE html>
<html>
<head>
  <title>회원가입중</title>
  <meta charset="utf-8">
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container mt-5">
	<div class="alert alert-success">
		<br>
		<%=str %>
		<br>
	</div>
	<button onclick = "history.back()" class="btn btn-info">다시시도</button>
</body>
</html>