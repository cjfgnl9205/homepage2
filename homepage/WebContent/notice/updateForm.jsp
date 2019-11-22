<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/nssi.jsp" %>
<% 
	int no = Integer.parseInt(request.getParameter("no"));
NoticeDTO dto = dao.read(no);
%>
<!DOCTYPE html>
<html>
<head>
  <title>공지사항 수정</title>
  <meta charset="utf-8">
  <script>
	function input(){
		var f = document.frm;
		if(f.title.value==''){
			alert("제목을 입력해주세요");
			f.title.focus();
			return
		}
		if(f.content.value==''){
			alert("내용을 입력해주세요");
			f.content.focus();
			return
		}
		if(f.pwd.value==''){
			alert("비밀번호를 입력해주세요");
			f.pwd.focus();
			return
		}
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container mt-5">


<h3 class="col-sm-offset-2 col-sm-10">공지사항 수정</h3>
  <form class="form-horizontal" action="updateProc.jsp" method="post" name="frm">
  	<input type="hidden" name="no" value="<%=no %>">
    <input type="hidden" name="col" value="<%=request.getParameter("col")%>">
  	<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
  	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
    
     <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="title" value=<%=dto.getTitle() %> name="title">
      </div>
    </div>
    
     <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용</label>
      <div class="col-sm-8">          
      	<textarea rows="12" cols="6" class="form-control" id="content" name="content" ><%=dto.getContent() %></textarea>
      </div>
    </div>
    	
	<div class="form-group">
		<label class="control-label col-sm-2" for="pwd">비밀번호</label>
    	<div class="col-sm-4">          
	        <input type="password" class="form-control" id="pwd" name="passwd">
	    </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-6">
        <button type="button" class="btn btn-primary" onclick="input()">수정</button>
        <button type="reset" class="btn btn-danger" onclick = "location.href='./list.jsp'">취소</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>