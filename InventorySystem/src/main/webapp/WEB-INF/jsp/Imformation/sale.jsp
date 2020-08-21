<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>판매조회</title>
</head>
<body>
<% if (session.getAttribute("email") == null){
	out.println("<a href= '/InventorySystem/Main/main'>로그인이 안되었습니다.</a></br>");
}else{
	String email = (String)session.getAttribute("email");
	out.println(email+"님 반갑습니다.</br></br>");
} %>
		<input type="button" id="main" name="main" onclick="location.href='../mainCallback'" value="메인"></input> 
		<input type="button" id="goods" name="goods" onclick="location.href='../GoodsManage/goodslist'" value="물품 관리"></input>
		<input type="button" id="tradegoods" name="tradegoods" onclick="location.href='../TradeGoodsManage/tradelist'" value="물류 관리"></input>
		<input type="button" id="information" name="info" onclick="location.href='../Imformation/goods'" value="정보 조회"></input>
		<input type="button" id="customer" name="customer" onclick="location.href='../CustomersManage/selList'" value="고객 관리"></input>
		<input type="button" id="statistics" name="statistics" onclick="location.href='../Statistics/customers'" value="통계 정보"></input>
   <h1>판매조회</h1>
<table>
   <tr>
     <th>NO</th>
     <th>날짜</th>
     <th>물품번호</th>
     <th>수량</th>
     <th>금액</th>
   </tr>
   
   
   <c:forEach items="${GoodsList}" var="list">
   <tr>
    <td>${list.goodsNo}</td>
    <td>${list.goodsName}</td>
    <td>${list.goodsColor}</td>
    <td>${list.manufacturer}</td>
    <td>${list.brandName}</td>
    <td>${list.goodsPrice}</td>
    <td>${list.size}</td>
    <td>${list.totalAmount}</td> 
   </tr>
   </c:forEach>  
  </table>
</body>
</html>