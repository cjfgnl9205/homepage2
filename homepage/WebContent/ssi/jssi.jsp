<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="join.JoinDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>

<jsp:useBean id="dao" class="join.JoinDAO"/>
<% 
	String root = request.getContextPath();
	request.setCharacterEncoding("utf-8");
	List<JoinDTO> list = null;
	Iterator<JoinDTO> iter = null;
	boolean flag = false;
	//파일전송시 사용할 임시 파일 저장소
	String upDir = application.getRealPath("/join/storage");
	//최종파일 저장소
	String tempDir = application.getRealPath("/join/temp");
%> 
