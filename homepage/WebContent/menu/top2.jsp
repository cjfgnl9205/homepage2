<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
	
	String str = "로그인";
	if(id != null && grade.equals("A")){
		str = "관리자";
	}else if(id !=null && !grade.equals("A")){
		str=id+"님";
	}
	String root=request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<title>Memo</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel = "stylesheet" href="/homepage/css/bootstrap.min.css">
<link rel = "stylesheet" href="/homepage/css/custom.css">
</head>

<body>
<div class="jumbotron mb-0">
	<h1>Main Title</h1>
	<p>Generate Lorem Ipsum placeholder text for use in your graphic, print and web layouts, and discover plugins for your favorite writing, design and blogging tools.</p>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="<%=root %>/index.jsp">홈페이지</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/homepage/notice/list.jsp">공지사항</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/guest/list.jsp">게시판</a>
      </li>
     </ul>
     
     <ul class="navbar-nav my-2  my-lg-0">
				
		<li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	        	<%=str %></a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">

	        <%if(id !=null && !grade.equals("A")){ %>
	       	<a class="dropdown-item" href="<%=root %>/join/read.jsp">내정보</a>
	       	<a class="dropdown-item" href="<%=root %>/join/updateForm.jsp">정보수정</a>
	       	<a class="dropdown-item" href="<%=root %>/join/logout.jsp">로그아웃</a>
	        
	        <%}else if(id !=null && grade.equals("A")){ %>
	          <a class="dropdown-item" href="<%=root %>/admin/list.jsp">회원목록</a>
	          <a class="dropdown-item" href="<%=root %>/join/logout.jsp">로그아웃</a>
	          
	        <%}else if(id ==null ){ %>
	          <a class="dropdown-item" href="<%=root %>/join/agreement.jsp">회원가입</a>
	          <a class="dropdown-item" href="<%=root%>/join/loginForm.jsp">로그인</a>
	        <%} %>
	        </div>
     	 </li>
   	</ul>
  </div>
</nav>
</body>
</html>