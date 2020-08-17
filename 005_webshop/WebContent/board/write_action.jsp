<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인코딩
	request.setCharacterEncoding("utf-8");
%>
<!-- bean객체 생성 -->
<jsp:useBean id="bean" class="board.BoardBean"/>
<!-- bean객체에 데이터삽입 -->
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="boardManager" class="board.BoardManager"/>

<%
	//작성자의 ip 삽입
	bean.setWrite_ip(request.getRemoteAddr()); 

	//작성날짜 계산 삽입
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String write_date = formatter.format(new Date());
	bean.setWrite_date(write_date);
	
	//게시물을 삽입할 번호 구하기
	int insert_num = boardManager.getCurrentNum()+1;
	bean.setNum(insert_num);
	bean.setGroup_num(insert_num);

	//데이터 삽입 작업
	boardManager.insertData(bean);
	
	//데이터 삽입 후 목록으로 돌아가기
	response.sendRedirect("boardlist.jsp?page=1");

%>