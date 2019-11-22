<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/jssi.jsp"%>
<%
	String id = request.getParameter("id");
	
	if(id==null) id = (String)session.getAttribute("id");
	
	String grade = (String)session.getAttribute("grade");
	JoinDTO dto = dao.read(id);
%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보</title>
<meta charset="utf-8">
<script>	
function updateM(){
	var url="<%=root%>/join/updateForm.jsp";
	url+="?id=<%=dto.getId()%>";
	location.href=url;
}

function updatePw(){
	var url = "<%=root%>/join/updatePwForm.jsp";
 	url += "?id=<%=dto.getId()%>";
 	location.href=url;
}
function updateFile(){
	var url = "<%=root%>/join/updateFileForm.jsp";
	url += "?id=<%=dto.getId()%>";
	url += "&oldfile=<%=dto.getFname()%>";
	location.href=url;
}
function deleteM(){
	var url = "<%=root%>/join/deleteForm.jsp";
	url += "?id=<%=dto.getId()%>";
	url += "&oldfile=<%=dto.getFname()%>";
	location.href=url;
}
</script>
</head>
<body>
	<jsp:include page="/menu/top2.jsp" />
	<div class="container mt-5">
		<h2 class="col-sm-offset-2 col-sm-10"><%=dto.getMname()%>의 회원정보</h2>
		<table class="table table-bordered">
			<tr>
				<td colspan="2" style="text-align: center">
					<img src="./storage/<%=dto.getFname()%>" class="img-rounded" width="250px" height="250px">
				</td>
			</tr>
			<tr>
				<th style="width:20%">아이디</th>
				<td><%=dto.getId()%></td>

			</tr>
			<tr>
				<th>성명</th>
				<td><%=dto.getMname()%></td>

			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=dto.getTel()%></td>

			</tr>
			<tr>
				<th>이메일</th>
				<td><%=dto.getEmail()%></td>

			</tr>
			<tr>
				<th>우편번호</th>
				<td><%=dto.getZipcode()%></td>

			</tr>
			<tr>
				<th>주소</th>
				<td><%=dto.getAddress1()%> <%=dto.getAddress2()%></td>

			</tr>
			<tr>
				<th>날짜</th>
				<td><%=dto.getMdate()%></td>

			</tr>
		</table> 

		<div style="text-align: center">
			<%if(id !=null && !grade.equals("A")){ %>
			<button class="btn btn-primary" onclick = "updateM()">정보수정</button>
			<button class="btn btn-primary" onclick = "updateFile()">사진수정</button>
			<button class="btn btn-primary" onclick = "updatePw()">패스워드 변경</button>
			<%} %>
			<%if(id !=null && grade.equals("A")){ %>
			<button class="btn btn-info" onclick = "location.href='<%=root%>/admin/list.jsp'">회원목록</button>
			<%} %>
			<button class="btn btn-primary" onclick = "deleteM()">회원탈퇴</button>
			
		</div>
</body>
</html>
