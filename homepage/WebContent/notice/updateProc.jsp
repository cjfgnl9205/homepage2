<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/nssi.jsp"%>
<jsp:useBean id="dto" class="notice.NoticeDTO" />
<jsp:setProperty name="dto" property="*" />
<%
	Map map = new HashMap();
	map.put("no", dto.getNo());
	map.put("passwd", dto.getPasswd());

	boolean pflag = dao.passCheck(map);
	flag = false;

	if (pflag) {
		flag = dao.update(dto);
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>공지사항 수정</title>
<meta charset="utf-8">
<script>
  	function listb(){
  		var url= "list.jsp";
  		url += "?col=<%=request.getParameter("col")%>";
  		url += "&word=<%=request.getParameter("word")%>"; 
		url += "&nowPage=<%=request.getParameter("nowPage")%>";

		location.href = url; 
	}
</script>
</head>
<body>
	<jsp:include page="/menu/top2.jsp" />
	<div class="container mt-5">
		<div class="alert alert-success">
			<%
				if (!pflag) {
					out.print("잘못된 비밀번호입ㄴ디ㅏ.");
				} else if (flag) {
					out.print("글수정성공했씁니다.");
				} else {
					out.print("샐패");
				}
			%>
		</div>
		<%
			if (!pflag) {
		%>
		<button class="btn btn-primary" onclick="history.back()">다시시도</button>
		<%
			}
		%>
		<button class="btn btn-primary" onclick="./create.Form">다시등록</button>
		<button class="btn btn-info" onclick="listb()">목록</button>
	</div>
</body>
</html>