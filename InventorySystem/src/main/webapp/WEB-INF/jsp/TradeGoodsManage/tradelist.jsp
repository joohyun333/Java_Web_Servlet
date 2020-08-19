<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>거래 내역</title>
<!-- CSS -->
<link href="${pageContext.request.contextPath}/CSS/tradelist.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<!-- 파일을 전송하기 위한 enctype -->
	<form name="inputlist" action="tradelist" enctype="multipart/form-data" method="post">
	<h1 id="title">재고관리프로그램</h1>
	<div class="topnav">
  <a href="../callback">메인</a>
  <a href="../GoodsManage/goodslist">물품 관리</a>
  <a href="../Imformation/goods">정보 조회</a>
  <a href="../CustomersManage/selList">고객 관리</a>
  <a href="../Statistics/customers'">통계정보</a>
</div>
	<div id="wrap">
      <h1>물류관리</h1>
          <button type="button" id="plus" onclick="location.href='../TradeGoodsManage/inputlist'">추가</button>
	<table style="width: 80%">
		<tr>
			<th>거래번호</th>
			<th>거래 구분</th>
			<th>물품번호</th>
			<th>물품명</th>
			<th>사이즈</th>
			<th>단가</th>
			<th>수량</th>
			<th>총가격</th>
			<th>색깔</th>
			<th>브랜드</th>
			<th>제조사</th>
			<th>거래일자</th>
		</tr>
		<c:forEach items="${TradeList}" var="tradeList">
			<tr>
				<th>${tradeList.dealNumber}</th>
				<th>${tradeList.classification}</th>
				<th>${tradeList.goodsNo}</th>
				<th>${tradeList.goodsName}</th>
				<th>${tradeList.size}</th>
				<th>${tradeList.goodsPrice}</th>
				<th>${tradeList.amount}</th>
				<th>${tradeList.totalprice}</th>
				<th>${tradeList.goodsColor}</th>
				<th>${tradeList.brandName}</th>
				<th>${tradeList.cusName}</th>
				<th>${tradeList.date}</th> 
				<td><input type="button" id="input" name="input" onclick="location.href='../TradeGoodsManage/tradeGoodsDelete?dealNumber=${tradelist.dealNumber}'" value="삭제"></input></td>
			</tr>
		</c:forEach>
	</table>
	</div>
	</form>
</body>
</html>