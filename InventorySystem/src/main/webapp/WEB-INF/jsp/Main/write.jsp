<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>작성페이지</title>
</head>

<body>
   <form method="post" autocomplete="off">
         <h1>작성</h1>
          <div>
             <!-- 제목 -->
              <label id="title"><b>제목</b></label>
              <input type="text" id="title" name="title" maxlength="30" autofocus required/>

              <!-- 내용 -->
              <label id="content"><b>글내용</b></label>
              <textarea cols="30" rows="5" id="content" name="content" required></textarea>
      
             <!-- 버튼들 -->
             <button type="submit" id="submit">작성</button>
             <input type="reset" value="취소" onclick="location.href='/InventorySystem/mainCallback'">
        </div>
     </form>       
</body>
</html>