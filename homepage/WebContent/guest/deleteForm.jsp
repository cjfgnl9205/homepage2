<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/gssi.jsp" %>
<% int no=Integer.parseInt(request.getParameter("no")); 
	
	flag = dao.checkRefnum(no);
%>
<!DOCTYPE html>
<html>
<head>
  <title>guest</title>
  <meta charset="utf-8">
  <style type="text/css">
  	#red{
  		color:red;
  	}
  </style>
  
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container mt-5">
<h3 class="col-sm-offset-2 col-sm-10">삭제</h3>
<%if(flag) {%>
	<div class="alert alert-success">
		<p> 삭제할수없습니다.(부모글입니다.)</p>
	</div>
	<button class = "btn btn-primary" onclick="history.back()">뒤로가기</button>
<%}else{ %>
  <form class="form-horizontal" action="deleteProc.jsp" method="post">
  <input class= "d-none" name="no" value="<%=no %>">
  <input type="hidden" name="col" value="<%=request.getParameter("col")%>">
  <input type="hidden" name="word" value="<%=request.getParameter("word") %>">
  <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
   
    <div class="form-group">
      <label class="control-label col-sm-2" for="passwd">비밀번호</label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="passwd" placeholder="Enter password" name="passwd">
      </div>
    </div>


	<p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다.</p>

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-6">
        <button type="submit" class="btn btn-danger">삭제</button>
        <button type="reset" class="btn btn-primary" onclick="history.back()">취소</button>
      </div>
    </div>
  </form>
 <%} %>
</div>
</body>
</html>