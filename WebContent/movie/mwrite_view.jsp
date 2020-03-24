<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath}/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
  <div id="content">
  <form action="${conPath }/mwrite.do" method="post" enctype="multipart/form-data">
    <table>
			<caption>영화등록하기</caption>
			<tr><td>제목</td><td><input type="text" name="MTitle"
							required="required" size="30"></td></tr>
			<tr><td>영화이미지</td><td><input type="file" name="MPhoto"></td></tr>
			<tr><td>줄거리</td><td><textarea name="MStory" rows="3" 
							cols="32"></textarea></td></tr>
			<tr><td>감독</td><td><input type="text" name="MDName" required="required" size="30"></td></tr>
			<tr><td>출연</td><td><input type="text" name="MActor" required="required" size="30"></td></tr>
			<tr><td>개봉여부</td><td><input type="text" name="MW" size="30"></td></tr>
			<tr><td>예매순위</td><td><input type="text" name="MBRank" required="required" size="30"></td></tr>
			<tr><td>개봉일자</td><td><input type="text" name="MRdate" required="required" size="30"></td></tr>				
			<tr><td colspan="2">
						<input type="submit" value="등록" class="btn">
						<input type="reset" value="취소" class="btn">
						<input type="button" value="목록" class="btn"
							onclick="location.href='${conPath}/list.do'">
		</table>
  </form>
  </div>
  <jsp:include page="../main/footer.jsp"/>
</body>
</html>