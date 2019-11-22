<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>
<%
String id = request.getParameter("id");
String oldfile=request.getParameter("oldfile");
%>
<!DOCTYPE html>
<html>
<head>
  <title>사진</title>
  <meta charset="utf-8">
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container mt-5">
<h1 class="col-sm-offset-2 col-sm-10">사진수정</h1>
  <form class="form-horizontal" action="updateFileProc.jsp" method="post" enctype="multipart/form-data">
  	<input type="hidden" name="id" value="<%=id %>">
  	<input type="hidden" name="id" value="<%=oldfile %>">
    <div class="form-group">
      <label class="control-label col-sm-2">회원사진</label>
      <div class="col-sm-6">
        <img src="<%=root %>/member/storage/<%=oldfile %>" class="img-rounded" width="200px" height="200px">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="fname">변경파일</label>
      <div class="col-sm-6">          
        <input type="file" class="form-control" id="fname" name="fname" accept=".jpg, .png, .gif" required="required">
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-6">
        <button type="submit" class="btn btn-primary">수정</button>
        <button type="reset" class="btn btn-danger" onclick="history.back()">취소</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>