
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.Main.Weather" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("1iFSt9oeBx7ezbHyZO4Z", "http://localhost/InventorySystem/callback");
  // 접근 토큰 값 출력
  /* alert(naver_id_login.oauthParams.access_token); */
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	/* 
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age')); */
	var email = naver_id_login.getProfileData('email');
	document.form1.len.value = email; 
  }
  
</script>
<form name="form1" method="post" style="padding:0; margin:0; font-size: 13px;">
<input type="text" name="len" value="" style="border:none">님 환영합니다.</input>
<button type="button" onclick="location.href='/InventorySystem/Main/main'">로그아웃</button>
</form>
<button type="button" onclick="location.href='/InventorySystem/GoodsManage/goodslist'">물품관리</button>
   <button type="button" onclick="location.href='/InventorySystem/TradeGoodsManage/tradelist'">물류관리</button>
   <button type="button" onclick="location.href='/InventorySystem/Imformation/deal'">정보조회</button>
   <button type="button" onclick="location.href='/InventorySystem/CustomersManage/selList'">고객관리</button>
   <button type="button" onclick="location.href='/InventorySystem/Statistics/customers'">통계정보</button>

  <!-- 메모장 -->
   <form>
     <div class="Main">
      <h1>메모장</h1>  <td><input type="text" value = ""></td>
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
  </form>  
  
  
  <!-- 달력 -->
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
 
 
  <!-- 날씨 --> 
<%
     Weather weather=new Weather();
     out.print(weather.parsing());
     
%> 

</body>
</html>