<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/gssi.jsp"%>

<%
	
%>
<!DOCTYPE html>
<html>
<head>
  <title>글쓰기</title>
  <meta charset="utf-8">
  <script>
  function input(f){
	  if(f.wname.value==''){
		  alert("이름을 입력하세요");
		  f.wname.focus();
		  return false;
	  }
	  if(f.pwd.value==''){
		  alert("비밀번호를 입력하세요");
		  f.pwd.focus();
		  return false;
	  }
	  if(f.title.value==''){
		  alert("제목을 입력하세요");
		  f.title.focus();
		  return false;
	  }
	  if(f.contet.value==''){
		  alert("내용을 입력하세요");
		  f.content.focus();
		  return false;
	  }
  }
  </script>
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container mt-5">
    <div class="form-group row mt-3">
    	<div class="col-sm-2">
    	</div>
    	<div class="col-sm-6">
    		<h3 class="col-sm-offset-2 col-sm-10">게시글 작성</h3>
    	</div>
	</div>

  <form class="form-horizontal" action="createProc.jsp" method="post" onsubmit="return input(this)">
  
     <div class="form-group row">
	      <label class="control-label col-sm-2" for="wname" style="text-align:right"> 이름</label>
	      <div class="col-sm-6">
	        <input type="text" class="form-control" id="wname" placeholder="이름을 입력하세요" name="wname">
		</div>
			</div>
		
     <div class="form-group row">
	      <label class="control-label col-sm-2" for="pwd" style="text-align:right">비밀번호</label>
	      <div class="col-sm-6">          
	        <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요" name="passwd">
	      </div>
    </div>
    
     <div class="form-group row">
      <label class="control-label col-sm-2" for="title" style="text-align:right">제목</label>
      <div class="col-sm-6">          
        <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title">
      </div>
    </div>
    
     <div class="form-group row">
      <label class="control-label col-sm-2" for="content" style="text-align:right">내용</label>
      <div class="col-sm-6">          
      	<textarea rows="12" cols="6" class="form-control" id="content" name="content" placeholder="내용을 입력하세요"></textarea>
      </div>
    </div>
    
    
    <div class="form-group row">  
      <div class="col-sm-2">
      </div>      
      <div class="col-sm-offset-2 col-sm-6">
        <button type="submit" class="btn btn-primary" >등록</button>
        <button type="reset" class="btn btn-danger"  onclick = "location.href='./list.jsp'">취소</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>