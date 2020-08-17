<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl 사용을 위한 taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 데이터를 불러올 클래스 객체 생성 -->
<jsp:useBean id="boardmanager" class="board.BoardManager"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

//검색을 위한 스크립트
	window.onload = function(){
	document.getElementById("btnSearch").onclick=function(){
		if(frm.search_word.value==""){
			frm.search_word.focus();
			alert("검색어를 입력하세요");
			return;
		}
		frm.submit();
	}
}


</script>
</head>
<body>
	[<a href="../index.jsp">메인으로</a>]&nbsp;
	[<a href="boardlist.jsp?page=1">최근목록</a>]&nbsp;
	[<a href="write_form.html">새글작성</a>]&nbsp;
	[<a href="#" onclick="window.open('admin.jsp', '', 'width=300,height=150,top=200,left=300')">관리자용</a>]&nbsp;
	<table border="1" style="width: 100%">
		<tr><th>번호</th><th>작성자</th><th>제목</th><th>날짜</th><th>조회수</th>
		
		<!-- 페이지값이 안넘어올경우 페이지의 default값 -->
		<c:set var = "currentPage" value="${param.page}"/>
		<c:if test="${empty param.page}">
			<c:set var="currentPage" value="1"/>
		</c:if>
		
		<!-- 검색어 파라미터 -->
		<c:set var="searchType" value="${param.search_type}" />
		<c:set var="searchWord" value="${param.search_word}" />
		
		<!-- list 변수에 목록 데이터를 삽입 -->
		<c:set var="list" value="${boardmanager.getDataAll(currentPage,searchType,searchWord)}"/>
		
		<!-- list 변수로부터 한줄한줄 출력 -->
		<c:forEach var="data" items="${list }">
			<tr>
				<td>${data.num}</td>
				<td>${data.name}</td>
				<td>					
					<!-- 들여쓰기 처리 -->
					<c:if test="${empty data.nested|| data.nested ne 0}">
						<c:forEach begin="1" end="${data.nested}">
						&nbsp;</c:forEach>-
					</c:if>
					<a href="content.jsp?num=${data.num}&page=${currentPage}">
						${data.title}
					</a>
				</td>
				<td>${data.write_date}</td>
				<td>${data.readcnt}</td>
			</tr>
		</c:forEach>
		
		<!-- 페이징 처리 -->
		<tr>		
			<td colspan="5">
				<!-- 전체 데이터 개수 구하기 -->
				<c:set var='total' value="${boardmanager.getTot(searchType,searchWord)}"/>
				
				<!-- 전체 데이터로 전체 페이지 구하기 -->
				<c:set var='pageSu' value="${boardmanager.getPageSu() }"/>
				
				<!-- 페이지 처리 출력 -->
				<c:set var='i' value='1'/>
				<c:forEach begin="1" end="${pageSu}">
					<c:if test="${i eq currentPage}">
						[<c:out value="${i}"/>]
					</c:if>
					<c:if test="${i ne currentPage}">
						<a href='boardlist.jsp?page=${i}&search_type=${searchType}&search_word=${searchWord}'>[<c:out value="${i}"/>]</a>
					</c:if>
					<c:set var='i' value='${i+1}'/>
				</c:forEach>
				
				<!-- 검색 칸 -->
				<form action="boardlist.jsp" name="frm" method="post">
					<select name="search_type">
						<option value="title" selected="selected">제  목</option>
						<option value="name">작성자</option>				
					</select>
					<input type="text" name="search_word"/>
					<input type="button" value="검색" id="btnSearch"/>
				</form>
			</td>
		</tr>

	</table>
</body>
</html>