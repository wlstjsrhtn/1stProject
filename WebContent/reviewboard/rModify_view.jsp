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
	<style>
		#content_form {
			width: 800px; height:400px;
			margin: 100px auto 0px;
		}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	<form action="${conPath }/rBoradModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="RNum" value="${rModify_view.RNum }">
		<input type="hidden" name="dbFileName" value="${rModify_view.RFileName }">
		<table>
			<caption>${rModify_view.RNum }번 글 수정(page:${param.pageNum })</caption>
			<tr><th>작성자</th>
					<td><input type="text" required="required" size="30"
								value="${rModify_view.MName }(${rModify_view.MId })" readonly="readonly"></td>
			</tr>
			<tr><th>제목</th>
					<td><input type="text" name="RTitle" required="required" size="30"
								value="${rModify_view.RTitle }"></td>
			</tr>
			<tr><th>본문</th>
					<td><textarea rows="5" cols="32" 
							name="RContent">${rModify_view.RContent }</textarea></td>
			</tr>
			<tr><th>첨부파일</th>
					<td><input type="file" name="RFileName" class="btn"> 원첨부파일:
							<c:if test="${not empty rModify_view.RFileName }">
						 		<a href="${conPath }/reviewUp/${rModify_view.RFileName}" target="_blank">${rModify_view.RFileName}</a>
						 	</c:if>
						 	<c:if test="${empty rModify_view.RFileName }">
						 		첨부파일없음
						 	</c:if>
					</td>
			</tr>
			<tr><td colspan="2">
						<input type="submit" value="수정" class="btn">
						<input type="button" value="목록"  class="btn"
							onclick="location='${conPath}/rList.do?pageNum=${param.pageNum }'">
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