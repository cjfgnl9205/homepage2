<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

Map map = new HashMap();
map.put("id", id);
map.put("passwd", passwd);

flag = dao.loginCheck(map);

if(flag){
	String grade = dao.getGrade(id);
	session.setAttribute("id", id);
	session.setAttribute("grade", grade);
	
	Cookie cookieid = null;
	Cookie cookiepasswd = null;
    
    String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 
    String c_passwd = request.getParameter("c_passwd");
    
    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
      cookieid = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
      cookieid.setMaxAge(120);               // 2 분 유지 
      response.addCookie(cookieid);          // 쿠키 기록 
   
      cookieid = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
      cookieid.setMaxAge(120);               // 2 분 유지 
      response.addCookie(cookieid);    
      
         
    }else{ 
      cookieid = new Cookie("c_id", "");     // 쿠키 삭제 
      cookieid.setMaxAge(0); 
      response.addCookie(cookieid); 
         
      cookieid = new Cookie("c_id_val", ""); // 쿠키 삭제 
      cookieid.setMaxAge(0); 
      response.addCookie(cookieid); 
      
    } 
    

    
    if (c_passwd !=null){  // 처음에는 값이 없음으로 null 체크로 처리

        
        cookiepasswd = new Cookie("c_passwd", "Y");    // 아이디 저장 여부 쿠키 
        cookiepasswd.setMaxAge(120);               // 2 분 유지 
        response.addCookie(cookiepasswd);          // 쿠키 기록 
     
        cookiepasswd = new Cookie("c_passwd_val", passwd); // 아이디 값 저장 쿠키  
        cookiepasswd.setMaxAge(120);               // 2 분 유지 
        response.addCookie(cookiepasswd);  
           
      }else{ 

        
        cookiepasswd = new Cookie("c_passwd", "");     // 쿠키 삭제 
        cookiepasswd.setMaxAge(0); 
        response.addCookie(cookiepasswd); 
           
        cookiepasswd = new Cookie("c_passwd_val", ""); // 쿠키 삭제 
        cookiepasswd.setMaxAge(0); 
        response.addCookie(cookiepasswd); 
      } 
      
}
%>
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <meta charset="utf-8">
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container">
		<% if(flag){ %>
		<script>
			alert("로그인 성공");
			window.location.href="<%=root%>/index.jsp";
		</script>
		<%}else{ %>
		<script>
			alert("아이디랑 비밀번호를 확인해주세요");
			window.location.href="<%=root%>/join/loginForm.jsp";
		</script>
		<%} %>
  
</div>
</body>
</html>