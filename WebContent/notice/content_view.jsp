<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
body {
	height: 1500px;
	background-color: #f2f4f7;
}

#content {
	width: 1000px;
	height: 900px;
	margin: 0 auto;
	overflow: hidden;
	background-image: url('${conPath}/img/11.PNG');
	border-radius: 20px;
	border: 2px solid white;
	margin-bottom: 30px;
}

.clean {
	height: 10px;
}

.a {
	height: 100px;
	overflow: hidden;
	width: 100%;
}

.b {
    width:900px;
	height: 700px;
	margin: 0 auto;
}

.paging {
	height: 50px;
    color: red;
    line-height: 50px;
    background-color: lightgray;
    width: 900px;
    margin: 0 auto;
}

.head {
	float: right;
	margin-right: 10px auto;
	overflow: hidden;
}

.a .head .write, .a .head .list {
	width: 50px;
	height: 40px;
	border: 1px solid black;
	border-radius: 5px;
	float: right;
	margin-top: 50px;
	text-align: center;
	line-height: 40px;
	margin-right: 50px;
	background-color: white;
}

.head .write {
	
}

table {
	border-collapse: collapse;
}

table th {
	background-color: gray;
}
#content table tr { 
    background-color: white; height:40px; 
}
table td {
	border-bottom: 1px solid white;
}
table b{
    color: orange;
    margin-left: 50px;
}
table a{
    margin-left: 50px;
}
table pre{
    margin-left: 50px;
}
#content td{
    text-align: left; padding:5px; 
}
#content table td {
    text-align: left; padding:5px; 
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<div class="a">
		</div>
		<br>
		<div class="b">
			<form
				action="${conPath}/noticeModify_view.do?NNum=${content_view.NNum }&pageNum=${param.pageNum }"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<input type="hidden" name="NNum" value="${content_view.NNum }">
				<table>
					<tr>
						<th nowrap width="60">${content_view.AId}님</th>
						<th nowrap width="400">${content_view.NDate}</th>
						<th nowrap width="80">조회수:${content_view.NHit}</th>
					</tr>
					<tr>
						<td colspan='3' height="200"><b>${content_view.NTitle }</b></td>
					</tr>
					<tr>
						<td colspan='3'><c:if test="${not empty content_view.NPhoto }">
								<img alt="인비저블맨"
									src="${conPath }/noticeUp/${content_view.NPhoto}">
							</c:if> <c:if test="${empty content_view.NPhoto }">
						 	</c:if></td>
					</tr>
					<tr>
						<td colspan='3' height="300" ><a>${content_view.NContent}</a></td>
					</tr>
					<tr>
						<td colspan="3"><c:if test="${admin.AId eq content_view.AId}">
								<input type="submit" value="수정" class="btn">
							</c:if> <c:if test="${admin.AId eq content_view.AId}">
								<input type="button" value="삭제" class="btn"
									onclick="location='${conPath}/delete.do?NNum=${content_view.NNum }&pageNum=${param.pageNum }'">
							</c:if> <input type="button" value="목록" class="btn"
							onclick="location='${conPath}/list.do?pageNum=${param.pageNum }'">
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

