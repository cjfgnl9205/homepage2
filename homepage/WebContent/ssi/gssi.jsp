<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="guest.GuestDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.Utility" %>

<jsp:useBean id="dao" class="guest.GuestDAO"/>
<% 
	String root = request.getContextPath();
	request.setCharacterEncoding("utf-8");
	List<GuestDTO> list = null;
	Iterator<GuestDTO> iter = null;
	boolean flag = false;
%> 
