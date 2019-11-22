<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/nssi.jsp" %>
<%

//검색관련
String word = Utility.checkNull(request.getParameter("word"));
String col = Utility.checkNull(request.getParameter("col"));

if(col.equals("total")) word="";

//페이징관련
int nowPage = 1;
if(request.getParameter("nowPage") !=null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

int recordPerPage = 5; //한페이지당 보여줄 레코드 개수

//DB에서 가져올 순번
int sno = ((nowPage-1)*recordPerPage)+1;
int eno = nowPage*recordPerPage;

Map map = new HashMap();
map.put("col", col);
map.put("word", word); 
map.put("sno", sno);
map.put("eno", eno);

int total = dao.total(map);  
list = dao.list(map);    
iter = list.iterator();

String id = (String)session.getAttribute("id");
String grade = (String)session.getAttribute("grade");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript">
	function read(no) {
		var url = "read.jsp";
		url += "?no=" + no;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href = url;
	}
</script>
</head>
<body>
<jsp:include page="/menu/top2.jsp" />
<div class="container mt-5">
	<h3>공지사항</h3>
		<form class="form-inline" action="./list.jsp">
			<div class="form-group mr-2">
				<select class="form-control" name="col">
					<option value="title" <% if(col.equals("title")) out.print("selected"); %> >제목</option>
					<option value="content" <% if(col.equals("content")) out.print("selected"); %> >내용</option>
					<option value="title_content" <% if(col.equals("title_content")) out.print("selected"); %> >제목+내용</option>
					<option value="total" <% if(col.equals("total")) out.print("selected"); %> >전체</option>
				</select>
			</div>
			
			<div class="form-group mr-2">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요" name = "word" value="<%=word %>">
			</div>
			
			<div class="form-group mr-2">
				<button class="btn btn-primary">검색</button>
			</div>
			<div class="form-group mr-2">
				<%if(id!=null && grade.equals("A")){ %>
				<button type = "button" class="btn btn-primary" onclick="location.href='createForm.jsp'">등록</button>
				<%} %>		
			</div>
		</form>
		
		<table class="table table-hover mt-3">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th style="text-align:right">작성자</th>
					<th style="text-align:right">조회수</th>
					<th style="text-align:right">등록일</th>
				</tr>
			</thead>
			<tbody>
				<%
					if (list.size() == 0) {
				%>
				<tr>
					<td colspan="5" style="text-align:center;">등록된 글이 없습니다.</td>
				</tr>
				<%
					} else {
						while (iter.hasNext()) {
							NoticeDTO dto = iter.next();
				%>
				<tr>
					<td><%=dto.getNo()%></td>
					<td>
						<a href="javascript:read('<%=dto.getNo()%>')" style="text-decoration:none;">
						 <%=dto.getTitle()%>
						</a>
						<%if(Utility.compareDay(dto.getWdate())){%>
						<img src="<%=root %>/images/new.gif">
						<%} %>
					</td>
					<td style="text-align:right"><%=dto.getId()%></td>
					<td style="text-align:right"><%=dto.getViewcnt() %></td>
					<td style="text-align:right"><%=dto.getWdate() %></td>
				</tr>
				<%
					} //for end 

					} //if end
				%>
			</tbody>
		</table>
		<div>
		<%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
		</div>
</div>
</body>
</html>