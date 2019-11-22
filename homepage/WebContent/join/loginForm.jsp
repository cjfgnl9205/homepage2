<%@ page contentType="text/html; charset=UTF-8"%>
<%
String c_id="";
String c_id_val="";
String c_passwd="";
String c_passwd_val="";

Cookie[] cookies = request.getCookies();
Cookie cookieid = null;
Cookie cookiepasswd = null;

if(cookies != null){
	for(int i =0;i<cookies.length; i++){
		cookieid = cookies[i];
		
		if(cookieid.getName().equals("c_id")){
			c_id=cookieid.getValue();
		}else if(cookieid.getName().equals("c_id_val")){
			c_id_val=cookieid.getValue();
		}
	}
}

if(cookies!=null){
	for(int i=0;i<cookies.length; i++){
		cookiepasswd=cookies[i];
		
		if(cookiepasswd.getName().equals("c_passwd")){
			c_passwd=cookiepasswd.getValue();
		}else if(cookiepasswd.getName().equals("c_passwd_val")){
			c_passwd_val=cookiepasswd.getValue();
		}
	}
}


%>
<!DOCTYPE html>
<html>
<head>
  <title>로그인</title>
  <meta charset="utf-8">

    <script>
    function idFind(){
		$(function(){
			$("#newidpw").text("");
	    	$("#newidpw").load("findidForm.jsp");

		})
    }
	function pwFind(){
		
		$(function(){
			$("#newidpw").text("");
			$("#newidpw").load("findpwForm.jsp");
		})
  		}
  		

	  
	  function use(){
		  $(function(){
			  var findid = $.trim($("#findid").text());
			  $("#id").val(findid);  
			  $("#newidpw").text("");
		  })
		  
	  }
	  
	  function use2(){
		  $(function(){
			  var findpw = $.trim($("#findpw").text());
			  $("#passwd").val(findpw);  
			  $("#newidpw").text("");

		  })
		  
	  }
	  

	  
  </script>

</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container mt-5">
    <div class="form-group row mt-3">
    	<div class="col-sm-2">
    	</div>
    	<div class="col-sm-4">
    		<h3 class="col-sm-offset-2 col-sm-10">로그인</h3>
    	</div>
	</div>
	<form class="form-horizontal" action = "loginProc.jsp" name = "frm" method="post">
		<div class="form-group row">
			<label class= "control-label col-sm-2" for="id" style="text-align:right">ID :</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id ="id" placeholder="Enter id" name = "id" value="<%=c_id_val%>">
			</div>
		</div>
		<div class="form-group row">
			<label class= "control-label col-sm-2" for="passwd" style="text-align:right">Password :</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" id ="passwd" placeholder="Enter passwd" name = "passwd" value="<%=c_passwd_val%>">
			</div>
		</div>
		
		<div class="form-group row">
		    <div class="col-sm-2">
    		</div>
			<div class="col-sm-offset-2 col-sm-2">
				<div class="checkbox">
				<%if(c_id.equals("Y")){ %>
					<label><input type="checkbox" name="c_id" value="Y" checked="checked">아이디 저장</label>
				<% }else{ %>	
					<label><input type="checkbox" name="c_id" value="Y">아이디 저장</label>
				<%} %>	
				</div>
			</div>
			<div class="col-sm-offset-2 col-sm-2">
				<div class="checkbox">
				<%if(c_passwd.equals("Y")){ %>
					<label><input type="checkbox" name="c_passwd" value="Y" checked="checked">비밀번호 저장</label>
				<% }else{ %>	
					<label><input type="checkbox" name="c_passwd" value="Y">비밀번호 저장</label>
				<%} %>	
				</div>
			</div>
		</div>
		
		<div class= "form-group row">
			<div class="col-sm-2">
    		</div>
			<div class="col-sm-offset-2 col-sm-6">
				<button type="submit" class= "btn btn-primary" >로그인</button>
				<button type="button" class= "btn btn-primary" onclick = "location.href='agreement.jsp'" >회원가입</button>
				<button type="button" class= "btn btn-info" onclick="idFind()">아이디찾기</button>
				<button type="button" class= "btn btn-info" onclick = "pwFind()">비밀번호찾기</button>
			</div>
		</div>
	</form> 
	<div id="newidpw"></div>
</div>
</body>
</html>