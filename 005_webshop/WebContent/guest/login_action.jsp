<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="membermanager" class="member.MemberManager"/>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("passwd");
	String name = membermanager.login(id, pass);
	
	if(name == null || name == ""){
		response.sendRedirect("login_fail.jsp");
	} else { 
		session.setAttribute("idKey", id);
		response.sendRedirect("login.jsp");
} %>