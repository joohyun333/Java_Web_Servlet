<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
 int total = 0;

 Object sess = session.getAttribute("total");
 if( sess != null )
  total = (Integer)sess;

 String temp = request.getParameter("radioBtn");
 if( temp != null ){
  if( temp.equals("�����")) total += 500;
  else if( temp.equals("«��")) total += 700;
  else if( temp.equals("�ʱ�ȭ")) total = 0;
 }
 

 session.setAttribute("total", total);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> �����̿� ����</title>
</head>
<body>

<form action="total.jsp">
 �� �հ� : <%= total %> <br/>
 <input type="radio" name="radioBtn" value="�����" /> �����(500��)<br/>
 <input type="radio" name="radioBtn" value="«��" /> «�� (700��)<br/>
 <input type="radio" name="radioBtn" value="�ʱ�ȭ" /> �ʱ�ȭ <br/>
 <input type="submit" />
</form>
</body>
</html>
