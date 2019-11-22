<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록하기</title>
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
		if(f.passwd.value==''){
			alert("비밀번호를 입력해주세요");
			f.passwd.focus();
			return
		}
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="/menu/top2.jsp" />
<div class="container mt-5">
    <div class="form-group row mt-3">
    	<div class="col-sm-2">
    	</div>
    	<div class="col-sm-6">
    		<h3 class="col-sm-offset-2 col-sm-10">공지사항 작성</h3>
    	</div>
	</div>
  <form class="form-horizontal" action="createProc.jsp" method="post" name = "frm">

    
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
	      <label class="control-label col-sm-2" for="pwd" style="text-align:right">비밀번호</label>
	      <div class="col-sm-6">          
	        <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요" name="passwd">
	      </div>
    </div>
    
    <div class="form-group row">   
      <div class="col-sm-2">
      </div>     
      <div class="col-sm-offset-2 col-sm-6">
        <button type="button" class="btn btn-primary" onclick  ="input()">등록</button>
        <button type="reset" class="btn btn-danger"  onclick = "location.href='./list.jsp'">취소</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>