<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>
<%
String id = request.getParameter("id");

%>
<!DOCTYPE html>
<html>
<head>
  <title>비밀번호 변경</title>
  <meta charset="utf-8">
  <script>
  function inCheck(f){
	  if(f.passwd.value.length==0){
		  alert("비밀번호를 입력해주세요");
		  f.passwd.focus();
		  return false;
	  }
	  if(f.repasswd.value.length==0){
		  alert("비밀번호확인을 입력해주세요");
		  f.repasswd.focus();
		  return false;
	  }
	  if(f.passwd.value != f.repasswd.value){
		  alert("비밀번호가 다시 확인해주세요.");
		  f.passwd.value="";
		  f.repasswd.value="";
		  f.passwd.focus();
		  return false;
	  }
	  
	  
  }
  </script>
  <script>
function pwCheck(){

	if(document.getElementById('passwd').value != '' && document.getElementById('repasswd').value !=''){
		if(document.getElementById('passwd').value == document.getElementById('repasswd').value){
			document.getElementById('pwsame').innerHTML='비밀번호가 일치합니다.';
			document.getElementById('pwsame').style.color='blue';
		}else{
			document.getElementById('pwsame').innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById('pwsame').style.color='red';
		}
	}else{
		document.getElementById('pwsame').innerHTML = '';
	}
	
}
</script>
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container">

    <div class="form-group row mt-3">
    	<div class="col-sm-2">
    	</div>
    	<div class="col-sm-6">
			<h3 class="col-sm-offset-2 col-sm-10 mt-5">비밀번호변경</h3>
    	</div>
	</div>
  <form class="form-horizontal" action="updatePwProc.jsp" method="post" onsubmit="return inCheck(this)">
  	<input type="hidden" name="id" value="<%=id%>">
    <div class="form-group row">
      <label class="control-label col-sm-2" for="passwd" style="text-align:right">비밀번호</label>
      <div class="col-sm-4">
        <input type="password" class="form-control" id="passwd" placeholder="Enter password" name="passwd">
      </div>
    </div>
    <div class="form-group row">
      <label class="control-label col-sm-2" for="repasswd" style="text-align:right">비밀번호확인</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" id="repasswd" placeholder="Enter repassword" name="repasswd" onkeyup="pwCheck()">
      </div>
      <span id = "pwsame"></span>
    </div>
    
    <div class="form-group row">
      <div class="col-sm-2">
      </div>        
      <div class="col-sm-offset-2 col-sm-6">
        <button type="submit" class="btn btn-primary">변경</button>
        <button type="button" class="btn btn-danger" onclick="history.back()">취소</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>