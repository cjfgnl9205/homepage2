<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>
<%
String id = request.getParameter("id");
String oldfile = request.getParameter("oldfile");

flag = dao.delete(id);

if(flag) session.invalidate();
if(flag && !oldfile.equals("member.jpg")){
	UploadSave.deleteFile(upDir, oldfile);
	
}
%>

 		<% if(flag){ %>
		<script>
			alert("탈퇴 성공");
			window.location.href="<%=root%>/index.jsp";
		</script>
		<%}else{ %>
		<script>
			alert("탈퇴 실패");
			history.back();
		</script>
		<%} %>
