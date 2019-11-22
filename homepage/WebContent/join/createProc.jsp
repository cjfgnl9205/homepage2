<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>
<jsp:useBean id="dto" class="join.JoinDTO"/>
<%
	UploadSave upload = (UploadSave)request.getAttribute("upload");
	
	dto.setId(upload.getParameter("id"));
	dto.setEmail(upload.getParameter("email"));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setTel(upload.getParameter("tel"));
	dto.setZipcode(upload.getParameter("zipcode"));
	
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));  //한글처리
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	
	FileItem fileItem = upload.getFileItem("fname");
	int size=(int)fileItem.getSize();
	
	if(size>0){
		String fname = UploadSave.saveFile(fileItem, upDir);   //  storage폴더에 업로드 파일 저장
		dto.setFname(fname);
	}else{
		dto.setFname("member.jpg");
	}
	
	flag = dao.create(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
  <title>회원</title>
  <meta charset="utf-8">

</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>

	<%if(flag){%>
		<script>
		alert("회원가입성공");
		window.location.href="<%=root%>/index.jsp"
		</script>
	<%}else{%>
		<script>
		alert("회원가입실패");
		window.location.href="<%=root%>/join/createForm.jsp"
		</script>
		
	<% }%>


</body>
</html>