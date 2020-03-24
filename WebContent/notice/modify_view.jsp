<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<form action="${conPath }/noticeModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="NNum" value="${modify_view.NNum }">
		<input type="hidden" name="dbPhoto" value="${modify_view.NPhoto }">
		<table>
			<caption>${modify_view.NNum }번 글 수정(page:${param.pageNum })</caption>
			<tr><th>제목</th>
					<td><input type="text" name="NTitle" required="required" size="30"
								value="${modify_view.NTitle }"></td>
			</tr>
			<tr><th>첨부파일</th>
					<td><input type="file" name="NPhoto" class="btn"> 원첨부파일:
							<c:if test="${not empty modify_view.NPhoto }">
							   <img alt="인비저블맨" src="${conPath }/noticeUp/${modify_view.NPhoto}">
						 	</c:if>
						 	<c:if test="${empty modify_view.NPhoto }">
						 		첨부파일없음
						 	</c:if>
					</td>
			</tr>
			<tr><th>본문</th>
					<td><textarea rows="5" cols="32" 
							name="NContent">${modify_view.NContent }</textarea></td>
			</tr>
			<tr><td colspan="2">
						<input type="submit" value="수정" class="btn">
						<input type="button" value="목록"  class="btn"
							onclick="location='${conPath}/list.do?pageNum=${param.pageNum }'">
						<input type="reset" value="취소" class="btn"
						  onclick="history.back()">
					</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>