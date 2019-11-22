<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/gssi.jsp"%>
<jsp:useBean id="dto" class="guest.GuestDTO"/>
<jsp:setProperty name="dto" property="*"/>
<%
	
	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());

	
	dao.reply_ansnum(map); // 기조ㄴ답변의 순서를 변경
	
	flag = dao.reply_create(dto); //답변등록

%>

<!DOCTYPE html>
<html>
<head>
  <title>bbs</title>
  <meta charset="utf-8">
    <script>
  	function listb(){
  		var url= "list.jsp";
  		url += "?col=<%=request.getParameter("col")%>";
  		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";

  		location.href=url;
  	}
  </script>
</head>

<body>
<jsp:include page ="/menu/top2.jsp"/>
	<div class="container mt-5">
		<div class="alert alert-success">
			<%
				if(flag){
					out.print("글 답변에 성공");
				}else if(flag){
					out.print("글답변 실패");
				}
			%>
		</div>
	
		<button class="btn btn-primary ">다시등록</button>
		<button class="btn btn-info" onclick="listb()">목록</button>
	</div>
</body>
</html>