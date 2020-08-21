<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.Main.Weather" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>

   <title>재고관리프로그램</title>
   <!-- CSS -->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Main.css">
   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<body>

<%
   Calendar cr = Calendar.getInstance(); // java.util.*를 import했기때문에 사용가능
   int year = cr.get(Calendar.YEAR); //년
   int month = cr.get(Calendar.MONTH); //월
   int date = cr.get(Calendar.DATE);   //일
   String today = year + ":" +(month+1)+ ":"+date; // 오늘 날짜
 
 // 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
 cr.set(year, month, 1);

 // 셋팅한 날짜로 부터 아래 내용을 구함
 
 // 해당 월의 첫날를 구함
 int startDate = cr.getMinimum(Calendar.DATE);
 
 // 해당 월의 마지막 날을 구함
 int endDate = cr.getActualMaximum(Calendar.DATE);
 
 // 1일의 요일을 구함
 int startDay = cr.get(Calendar.DAY_OF_WEEK);
 int count = 0;
%>

 
     <!-- 메뉴 -->
	<h1 id="title">재고관리프로그램</h1>
	<!-- 네이버 아이디 영역 -->
<% if (session.getAttribute("email") == null){
	out.println("<a href= '/InventorySystem/Main/main'>로그인을 다시하세요.</a></br>");
}else{
	String email = (String)session.getAttribute("email");
	out.println(email+"님 반갑습니다.");%>
	<button type="button" onclick="location.href='/InventorySystem/logout'">로그아웃</button></br></br>
<%} %>
	 <!-- 날씨 --> 
	<div id="weather">
    <%
     Weather weather=new Weather();
     out.print(weather.parsing());
    %>
    </div>
	<div class="topnav">
		<a href="GoodsManage/goodslist">물품 관리</a>
		<a href="TradeGoodsManage/tradelist">물류 관리</a>
		<a href="Imformation/goods">정보 조회</a>
		<a href="CustomersManage/selList">고객 관리</a>
		<a href="Statistics/customers'">통계정보</a>
	</div>
  <!-- 메모장 -->
   <form>
   <div id="wrap">
     <div class="Main">
      <h1>메모장</h1>  
      <button type="button" id="write" onclick="location.href='/InventorySystem/Main/write'">작성</button>
      <hr/>
      <table>
        <thead>
        <tr>
          <th width="70">번호</th>
          <th width="500">제목</th>
          <th width="100">날짜</th>
        </tr>
        
       </thead>
              
       <tbody>   
       <c:forEach items="${NoteList}" var="list" varStatus="status">
       <tr>
        <td width="70">${status.count}</td>
        <td width="500"><a href="/InventorySystem/Main/view?num=${list.num}"><c:out value="${list.title}"/></a></td>
        <td width="100">${list.time}</td>
       </tr>
       </c:forEach>  
      </tbody>    
    </table>
   </div>

   
  <!-- 달력 -->
<table id="Calendar">
 <tr height="30">
  <td><font size="2">일</font></td>
  <td><font size="2">월</font></td>
  <td><font size="2">화</font></td>
  <td><font size="2">수</font></td>
  <td><font size="2">목</font></td>
  <td><font size="2">금</font></td>
  <td><font size="2">토</font></td>
 </tr>
 <tr height="30">
 <%
   for (int i=1;i<startDay;i++){
 count++;
 %>
        <td>&nbsp;</td>
 <%
  }
  for (int i=startDate;i<=endDate;i++){
  String bgcolor = (today.equals(year+":"+(month+1)+":"+i))? "#CCCCCC" : "#FFFFFF";
  String color = (count%7 == 0 || count%7 == 6)? "red" : "black";
  count++;
 %>
  <td bgcolor="<%=bgcolor %>"><font size="2" color=<%=color %>><%=i %></font></td>
 <%
 if(count%7 == 0 && i < endDate){
 %>
 
 </tr>
 <tr height="30">
 <%
  }
  }
  while(count%7 != 0){
  %>
       <td>&nbsp;</td>
  <%
  count++;
   }
  %>
 </tr>
 </table>
</div>
  </form>  
 
 
   
 <br/><br/><br/><br/><br/><br/><br/><br/>

 <footer id="footer">
       <div class="foo_div1"> 
        <h3>재고관리프로그램</h3> 
          <p>재고관리프로그램 was created by <span>비트교육 3조</span> / Designed by <span>비트교육 3조</span></p> 
     </div>
   </footer>


</body>
</html>