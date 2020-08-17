<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> JSTL의 URL 태그</title>
</head>
<body>

<!-- http://www.flickr.com 에서 고양이 입력 후 그 주소를 복사  -->
<!-- 1. c:import는 URL의 결과를 삽입 -->
<%-- <c:import url="https://www.flickr.com/search/?text=%EA%B3%A0%EC%96%91%EC%9D%B4" /> --%>

<!-- 사진 사이트에서 고양이 검색 -->
<%-- <c:import url="https://www.flickr.com/search/"> --%>
<%-- <c:param name="text" value="고양이"></c:param> --%>
<%-- </c:import> --%>

<!-- 유투브에서 고양이 검색 -->
<!-- https://www.youtube.com/results?search_query=%EA%B3%A0%EC%96%91%EC%9D%B4 -->
<%-- <c:import url="https://www.youtube.com/results"> --%>
<%-- <c:param name="search_query" value="고양이"></c:param> --%>
<%-- </c:import> --%>

<!-- 다음에서 고양이 이미지  -->
<!-- http://search.daum.net/search?w=img&nil_search=btn&DA=NTB&enc=utf8&q=%EA%B3%A0%EC%96%91%EC%9D%B4 -->
<%-- <c:import url="http://search.daum.net/search"> --%>
<%-- <c:param name="nil_suggest" value="btn"></c:param> --%>
<%-- <c:param name="w" value="img"></c:param> --%>
<%-- <c:param name="q" value="고양이"></c:param> --%>
<%-- </c:import> --%>

<!-- ###############################################  -->
<!-- 2. c:url은 URL을 변수에  -->
<%-- <c:url value="https://www.flickr.com/search/?text=%EA%B3%A0%EC%96%91%EC%9D%B4" var="flickrBtn"/> --%>
<%-- <c:url value="http://search.daum.net/search?w=img&nil_search=btn&DA=NTB&enc=utf8&q=%EA%B3%A0%EC%96%91%EC%9D%B4" var="daumBtn"/> --%>
<%-- <c:url value="https://www.youtube.com/results?search_query=%EA%B3%A0%EC%96%91%EC%9D%B4" var="youtubeBtn"/> --%>
<%-- 내부파일도 가능 <c:url value="./1_basic.jsp"/>--%>
<!-- <ul> -->
<%-- 	<li><a href="${flickrBtn }">사진</a></li> --%>
<%-- 	<li><a href="${daumBtn }">다음</a></li> --%>
<%-- 	<li><a href="${youtubeBtn }">유투브</a></li> --%>
<!-- </ul> -->

<!-- ###############################################  -->
<!-- 3. c:redirect 는  페이지 리다리렉팅 -->
<%-- <c:redirect url="1_basic.jsp"/> --%>

<%-- <c:redirect url="http://search.daum.net/search"> --%>
<%-- <c:param name="nil_suggest" value="btn"></c:param> --%>
<%-- <c:param name="w" value="img"></c:param> --%>
<%-- <c:param name="q" value="고양이"></c:param> --%>
<%-- </c:redirect> --%>

<!-- import와 redirect의 차이는?  -->


<!-- 위에와 차이가 뭐징?  -->
<%-- <c:redirect url="/1_basic.jsp" context="/First/06_el/4_jstl" /> --%>

</body>
</html>