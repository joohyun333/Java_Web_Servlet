<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
 int total = 0;

 Object sess = session.getAttribute("total");
 if( sess != null )
  total = (Integer)sess;

 String temp = request.getParameter("radioBtn");
 if( temp != null ){
  if( temp.equals("자장면")) total += 500;
  else if( temp.equals("짬봉")) total += 700;
  else if( temp.equals("초기화")) total = 0;
 }
 

 session.setAttribute("total", total);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 세션이용 예문</title>
</head>
<body>

<form action="total.jsp">
 총 합계 : <%= total %> <br/>
 <input type="radio" name="radioBtn" value="자장면" /> 자장면(500원)<br/>
 <input type="radio" name="radioBtn" value="짬봉" /> 짬봉 (700원)<br/>
 <input type="radio" name="radioBtn" value="초기화" /> 초기화 <br/>
 <input type="submit" />
</form>
</body>
</html>
