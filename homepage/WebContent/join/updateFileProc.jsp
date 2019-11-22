<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>
<%
//request : 내부객체
// -1 메모리에 저장할 최대크기 : 무제한사용
// -1 업로드할 파일의 최대 파일 크기 , byte, 무제한사용
//tempDir 파일업로드중에 임시로 저장할 폴더
UploadSave upload = new UploadSave(request, -1, -1, tempDir);

//파일객체 추출 
FileItem fileItem = upload.getFileItem("fname");

String id = upload.getParameter("id");
String oldfile=UploadSave.encode(upload.getParameter("oldfile"));

if(oldfile != null && !oldfile.equals("member.jpg")){
	UploadSave.deleteFile(upDir, oldfile);
}

String fname = UploadSave.saveFile(fileItem, upDir);

Map map = new HashMap();
map.put("id", id);
map.put("fname", fname);

flag = dao.updateFile(map);
%>
<!DOCTYPE html>
<html>
<head>
  <title>사진수정</title>
  <meta charset="utf-8">
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container mt-5">
	<h1 class="col-sm-offset-2 col-sm-10">사진수정</h1>
		<% if(flag){ %>		
		<script>
		alert("사진이 수정되었습니다.");
		location.href='read.jsp?id=<%=id%>';
		</script>
		<%}else{ %>
		<script>
		alert("다시 수정해주세요");
		history.back();
		</script>
		<%} %>

</div>
</body>
</html>