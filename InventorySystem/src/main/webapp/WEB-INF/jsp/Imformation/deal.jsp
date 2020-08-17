<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "org.springframework.context.support.*" %> 
<%@ page import="com.example.goods.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.example.domain.*" %>

<!DOCTYPE html>
<html>
<head>
<title>거래내역조회</title>
</head>
<body>
		<input type="button" id="main" name="main" onclick="location.href='../Main/main'" value="메인"></input> 
		<input type="button" id="goods" name="goods" onclick="location.href='../GoodsManage/goodslist'" value="물품 관리"></input>
		<input type="button" id="tradegoods" name="tradegoods" onclick="location.href='../TradeGoodsManage/tradelist'" value="물류 관리"></input>
		<input type="button" id="information" name="info" onclick="location.href='../Imformation/goods'" value="정보 조회"></input>
		<input type="button" id="customer" name="customer" onclick="location.href='../CustomersManage/selList'" value="고객 관리"></input>
		<input type="button" id="statistics" name="statistics" onclick="location.href='../Statistics/customers'" value="통계 정보"></input>
<h1>거래내역조회</h1>
    <table>
       <tr>
       <th>NO</th>
       <th>물품번호</th>
       <th>수량</th>
       <th>거래일자</th>
       <th>물품명</th>
       <th>색상</th>
       <th>사이즈</th>
      </tr>
      
   <c:forEach items="${tradeList}" var="list">
   <tr>
    <td>${list.dealNumber}</td>
    <td>${list.goodsNo}</td>
    <td>${list.amount}</td>
    <td>${list.date}</td>  
    <td>${list.goodsColor }</td>
    <td>${list.size}</td>
   </tr>
     <c:set var="goodsNo" value="${list.goodsNo}"/>
     <input type="text" id="goodsno" value="${list.goodsNo}"></input>
   </c:forEach>
  </table>

</body>
</html>