<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/jssi.jsp" %>
<%
String id =request.getParameter("id");
if(id==null) id = (String)session.getAttribute("id");

JoinDTO dto = dao.read(id);
%>
<!DOCTYPE html>
<html>
<head>
  <title>정보수정</title>
  <meta charset="utf-8">
  <style>
  #need{
  color :red;
  }
  </style>
  <script>
  	function emailCheck(email){
  			var url='email_form.jsp';
  			url += "?email="+email;
  			
			wr = window.open(url, "이메일중복확인", "width=500, height=350");
			wr.moveTo((window.screen.width-500)/2, (window.screen.height-350)/2);
  	}
  </script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script>
	function inCheck(f){
		if(f.tel.value.length==0){
			alert('전화번호를 입력하세요');
			f.tel.focus();
			return false;
		}		
		if(f.email.value.length==0){
			alert('이메일을 입력하세요');
			f.email.focus();
			return false;
		}
		if(f.job.selectedIndex == 0){
			alert('직업을 선택하세요');
			f.job.focus();
			return false;
		}		
		
	}
	
	function emailMsg(){
		alert("이메일변경 원하면 이메일변경을 눌러주세요");
		
	}
</script>
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container mt-5">
	<div class="form-group row">
		<div class="form-group col-sm-1">
		</div>
			<h2 class="col-sm-offset-5 col-sm-10">회원정보 수정</h2>
	</div>
  <form class="form-horizontal" action="updateProc.jsp" method="post" name = "frm" onsubmit="return inCheck(this)">
	<input type="hidden" name="id" value="<%=dto.getId() %>">
    <div class="form-group row mt-3">
      <label class="control-label col-sm-2" for="id" style="text-align:right">아이디</label>
      <div class="col-sm-4">          
		<%=dto.getId() %>
      </div>
    </div>

    <div class="form-group row mt-3">
      <label class="control-label col-sm-2" for="mname" style="text-align:right">이름</label>
      <div class="col-sm-4">          
        <%=dto.getMname() %>
      </div>
    </div>
    <div class="form-group row mt-3">
      <label class="control-label col-sm-2" for="tel" style="text-align:right">전화번호</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" id="tel" value="<%=dto.getTel() %>" name="tel">
      </div>
    </div>  
    <div class="form-group row mt-3">
      <label class="control-label col-sm-2" for="email" style="text-align:right">이메일</label>
      <div class="col-sm-4">          
        <input type="email" class="form-control" id="email" value="<%=dto.getEmail() %>" name="email" readonly onclick="emailMsg()">
      </div>
      <button type="button" class = "btn btn-info col-sm-2" onclick  = "emailCheck(document.frm.email.value)" >이메일변경</button>
    </div> 
    
    <div class="form-group row mt-3">
      <label class="control-label col-sm-2" for="sample6_postcode" style="text-align:right">우편번호</label>
      <div class="col-sm-2">          
        <input type="text" class="form-control" name="zipcode" id="sample6_postcode" value="<%=dto.getZipcode() %>">
      </div>
      <button type="button" class = "btn btn-info col-sm-1" onclick="sample6_execDaumPostcode()">주소검색</button>
    </div> 
        
    <div class="form-group row mt-3">
      <label class="control-label col-sm-2" for="sample6_address" style="text-align:right">주소</label>
      <div class="col-sm-6">          
        <input type="text" class="form-control" id="sample6_address" value="<%=dto.getAddress1() %>" name="address1"><br>
        <input type="text" class="form-control" id="sample6_detailAddress" value="<%=dto.getAddress2() %>" name="address2">
      </div>
    </div>     

    <div class="form-group row mt-3">        
      <div class="col-sm-2">
      </div>
      <div class="col-sm-10">
        <button type="submit" class="btn btn-primary">정보수정</button>
        <button type="reset" class="btn btn-danger" onclick="location.href='read.jsp?id=<%=dto.getId() %>'">취소</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>