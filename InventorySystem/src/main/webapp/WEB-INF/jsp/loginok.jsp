<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	request.setCharacterEncoding("euc-kr"); 
	String email = request.getParameter("email");
	String nickname = request.getParameter("nickname");
	String name = request.getParameter("name");
	if (email != null){
		session.setAttribute("email", email);
		session.setAttribute("nickname", nickname);
		session.setAttribute("name", name);
	}
	else{
		System.out.println("값이 없음.");
	}
	response.sendRedirect("mainCallback");
%>