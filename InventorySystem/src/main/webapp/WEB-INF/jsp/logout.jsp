<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
session.removeAttribute("email");
response.sendRedirect("Main/main");
%>