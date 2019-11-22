<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/ssi/jssi.jsp"%>
<%

  //검색관련
  String col = Utility.checkNull(request.getParameter("col"));
  String word = Utility.checkNull(request.getParameter("word"));
  
  if(col.equals("total")) word="";
  
  //페이징 관련
  int nowPage = 1;
  int recordPerPage =3;
  
  if(request.getParameter("nowPage")!=null){
    nowPage = Integer.parseInt(request.getParameter("nowPage"));
  }
  
  int sno = ((nowPage-1)*recordPerPage) +1;
  int eno = nowPage * recordPerPage;
  
  Map map = new HashMap();
  map.put("col", col);
  map.put("word", word);
  map.put("sno", sno);
  map.put("eno", eno);
  
  list = dao.list(map);

  int total = dao.total(map);
  
  String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
  
%>
<!DOCTYPE html>
<html>
<head>
  <title>회원목록</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  
  	function read(id){
  		var url="<%=root%>/join/read.jsp";
  		url += "?id=" + id;
  		location.href=url;
  	}
  </script>
</head>
<body>
<jsp:include page ="/menu/top2.jsp"/>
<div class="container">
<h2 class="col-sm-offset-2 col-sm-10 mt-5">회원목록</h2>
<form class="form-group" method="post" action="list.jsp">
  <div class="form-group row">
	  <div class="form-group ">
	    <select class="form-control ml-2" name="col">
	      <option value="mname"  <%if(col.equals("mname")) out.print("selected"); %>>성명</option>
	      <option value="id"   <%if(col.equals("id")) out.print("selected"); %>>아이디</option>
	      <option value="email"  <%if(col.equals("email")) out.print("selected"); %>>이메일</option>
	      <option value="total"  <%if(col.equals("total")) out.print("selected"); %>>전체출력</option>
	    </select>
	  </div>
	  <div class="form-group ml-2">
	    <input type="text" class="form-control" name="word"  value=<%=word %>>
      </div>
      <div class="form-group ">
	  	<button class="btn btn-primary ml-2">검색</button>
	  	<button type="button" class="btn btn-primary " onclick="location.href='createForm.jsp'">등록</button>
  	  </div>
  </div> 
</form>
<% for(int i=0; i<list.size(); i++){
	JoinDTO dto = list.get(i);
	%>

	<table class="table table-bordered mt-2">

		<tr>
			<td rowspan="5" style="width:16.66%">
			<img src ="<%=root %>/join/storage/<%=dto.getFname() %>" class = "img-rounded" width="200px" height="200px">
			</td>
			<th style="width:15%">아이디</th>
			<th class=""><a href="javascript:read('<%=dto.getId() %>')"> <%=dto.getId() %></a></th>
		</tr>
		<tr>
			<th >성명</th>
			<td><%=dto.getMname() %></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=dto.getTel() %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>(<%=dto.getZipcode() %>) <%=dto.getAddress1() %> <%=dto.getAddress2() %></td>
		</tr>	
	</table>
<%} %>
<%=paging %>
</div>
</body>
</html>