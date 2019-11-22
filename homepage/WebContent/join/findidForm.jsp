<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>아이디찾기</title>
  <meta charset="utf-8">
    <script>
  function inCheck(f){
		if(f.mname.value.length==0){
			alert('이름을 입력하세요');
			f.mname.focus();
			return false;
		}
		if(f.email.value.length==0){
			alert('이메일을 입력하세요');
			f.email.focus();
			return false;
		}
  }
  function findid(f){
	  
	  var mname = f.mname.value;
	  var email = f.email.value;
	  var param = "mname="+mname;
	  param += "&email="+email;
	  var url = "findidnew.jsp";
		
		$.get(url, param, function(data, textStatus){
			$("#findid").html(data);
			$("#newbutton").html("<button type='button' class='btn btn-info' onclick='use()'>사용</button>");

		})
  }


  </script>
</head>
<body>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel = "stylesheet" href="/homepage/css/bootstrap.min.css">
<link rel = "stylesheet" href="/homepage/css/custom.css">
<div class="container mt-5">
	<div class="form-group row mt-3">
		<div class="col-sm-2">
	</div>
		<div class="col-sm-4">
    		<h3 class="col-sm-offset-2 col-sm-10"> 아이디 찾기 </h3>
    	</div>
	</div>  
	
<form class="form-horizontal" action="findidProc.jsp"  name = "frm2" method="post" onsubmit="return inCheck(this)">

    <div class="form-group row">
      <label class="control-label col-sm-2" for="mname" style="text-align:right">이름 :</label>
      <div class="col-sm-3">          
        <input type="text" class="form-control" id="mname" placeholder="Enter name" name="mname" value="김길동">
      </div>
    </div>
    <div class="form-group row">
      <label class="control-label col-sm-2" for="email" style="text-align:right">이메일 :</label>
      <div class="col-sm-3">          
        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="cjfgnl9205@naver.com">
      </div>
    </div>
    <div class="form-group row">  
		<div class="col-sm-2">
		</div>      
      <div class="col-sm-offset-2 col-sm-3">
        <button type="button" class="btn btn-info" onclick="findid(document.frm2)">아이디 찾기</button>
        
      </div>
      <div class= "col-sm-1" id="findid"></div>
      <div id="newbutton"></div>
      
    </div>
  </form>
</div>
</body>
</html>