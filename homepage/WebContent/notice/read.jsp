<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/nssi.jsp"%>
<%
	int no=Integer.parseInt(request.getParameter("no"));
	dao.upViewcnt(no);
	NoticeDTO dto = dao.read(no);
	String content = dto.getContent().replaceAll("\r\n", "<br>");
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
%>
<!DOCTYPE html>
<html>
<head>
  <title>내용</title>
  <meta charset="utf-8">
  <script type="text/javascript">
	function listb(){
  		var url = "list.jsp";
  		url += "?col=<%=request.getParameter("col") %>";
  		url += "&word=<%=request.getParameter("word") %>";
  		url += "&nowPage=<%=request.getParameter("nowPage")%>";

  		location.href=url;
  	}
  	function updateb(no){
  		var url = "updateForm.jsp";
  		url += "?no="+no;
 		url += "&col=<%=request.getParameter("col") %>";
  		url += "&word=<%=request.getParameter("word") %>";
  		url += "&nowPage=<%=request.getParameter("nowPage")%>";

  		location.href=url;
  	}

  	function deleteb(no){
  		var url = "deleteForm.jsp";
  		url += "?no="+no;
 		url += "&col=<%=request.getParameter("col") %>";
  		url += "&word=<%=request.getParameter("word") %>";
  		url += "&nowPage=<%=request.getParameter("nowPage")%>";

  		location.href=url;
  	}

  	function replyb(no){
  		var url = "replyForm.jsp";
  		url += "?no="+no;
 		url += "&col=<%=request.getParameter("col") %>";
  		url += "&word=<%=request.getParameter("word") %>";
  		url += "&nowPage=<%=request.getParameter("nowPage")%>";

  		location.href=url;
  	}
  </script>
  
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container mt-5">
<div class="row">
	<div class="col-sm-10">
		<h3 style="display:inline-block">조회</h3>
	</div>
	<div class="col-sm-2" style="text-align:rihgt">
		<div class="badge badge-light" >조회수 <%=dto.getViewcnt() %></div>
		<div class="badge badge-light">등록날짜  <%=dto.getWdate() %></div>
	</div>
</div>


  <div class="card card-default mt-3">  		
	  	<div class="card-header">제목</div>
	  	<div class="card-body"><%=dto.getTitle() %></div>
	  	
	  	<div class="card-header">내용</div>
	  	<div class="card-body" style="height: 200px"><%=content %></div>
  </div>

	<div class="group mt-3">
		<%if(id!=null && grade.equals("A")){ %>
	  <button class="btn btn-primary" onclick = "location.href='./createForm.jsp'">등록</button>
	  <button class="btn btn-primary" onclick = "updateb('<%=no %>')">수정</button>
	  <button class="btn btn-danger" onclick = "deleteb('<%=no %>')">삭제</button>
	  <button class="btn btn-info" onclick = "listb()">목록</button>
	  <%}else if(id !=null && !grade.equals("A")){ %>
	  <button class="btn btn-info" onclick = "listb()">목록</button>
	  <%} %>
	</div> 
  
</div>
</body>
</html>