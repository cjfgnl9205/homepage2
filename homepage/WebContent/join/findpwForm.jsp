<%@ page contentType="text/html; charset=UTF-8"%>
<%
String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
  <title>비밀번호찾기</title>
  <meta charset="utf-8">
    <script>
  function inCheck(f){
		if(f.mname.value.length==0){
			alert('이름을 입력하세요');
			f.mname.focus();
			return false;
		}
		if(f.id.value.length==0){
			alert('아이디를 입력하세요');
			f.id.focus();
			return false;
		}
  }
  
  function findpw(f){
	  
	  var mname = f.mname.value;
	  var id = f.id.value;
	  var param = "mname="+mname;
	  param+="&id="+id;
	  var url = "findpwnew.jsp";
	  
		$.get(url, param, function(data, textStatus){
			$("#findpw").html(data);
			$("#newbutton").html("<button type='button' class='btn btn-info' onclick='use2()'>사용</button>");

		})
  }
  </script>
</head>
<body>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel = "stylesheet" href="/homepage/css/bootstrap.min.css">
<link rel = "stylesheet" href="/homepage/css/custom.css">
<div class="container">
	<div class="form-group row mt-3">
		<div class="col-sm-2">
	</div>
		<div class="col-sm-4">
    		<h3 class="col-sm-offset-2 col-sm-10"> 비밀번호 찾기 </h3>
    	</div>
	</div>  
  
  
  <form class="form-horizontal" name = "frm3" method="post" onsubmit="return inCheck(this)">


    <div class="form-group row">
      <label class="control-label col-sm-2" for="mname" style="text-align:right">이름 :</label>
      <div class="col-sm-3">          
        <input type="text" class="form-control" id="mname" placeholder="Enter name" name="mname" value="김길동">
      </div>
    </div>
    <div class="form-group row">
      <label class="control-label col-sm-2" for="id" style="text-align:right">아이디 : </label>
      <div class="col-sm-3">          
        <input type="text" class="form-control" id="id" placeholder="Enter id" name="id" value="cjfgnl9205">
      </div>
    </div>
    <div class="form-group row">        
    		<div class="col-sm-2">
		</div>      
      <div class="col-sm-offset-2 col-sm-3">
        <button type="button" class="btn btn-info" onclick="findpw(document.frm3)">비밀번호 찾기</button>
      </div>
      <div class= "col-sm-1 row" id="findpw"></div>
      <div id="newbutton"></div>
      
    </div>

  </form>
</div>
</body>
</html>