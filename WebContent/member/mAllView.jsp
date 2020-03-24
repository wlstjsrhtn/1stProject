<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	width: 700px;
	height: 900px;
	margin: 0 auto;
	overflow: hidden;
	background-image: url('${conPath}/img/11.PNG'); 
	border-radius: 20px;
	border: 2px solid white;
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
    width:600px;
	height: 700px;
	margin: 0 auto;
}

.paging {
	height: 50px;
    color: red;
    line-height: 50px;
    background-color: lightgray;
    width: 600px;
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

table td {
	border-bottom: 1px solid white;
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
			<table>
				<tr>
					<th>회원 아이디</th>
					<th>회원 이름</th>
					<th>전화번호</th>
					<th>가입일</th>
				</tr>
				<c:if test="${totCnt==0 }">
					<tr>
						<td colspan="4">회원이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${totCnt!=0 }">
					<c:forEach items="${mAllView }" var="dto">
						<tr>
							<td>${dto.MId }</td>
							<td>${dto.MName }</td>
							<td>${dto.MTel }</td>
							<td><fmt:formatDate value="${dto.MRdate }" type="date"
									dateStyle="short" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		<div class="paging">
			<a href="${conPath }/allView.do?pageNum=1">&lt;&lt;</a> &nbsp; &nbsp;
			&nbsp;
			<c:if test="${startPage>BLOCKSIZE }">
				<a href="${conPath }/allView.do?pageNum=${startPage-1}">&lt;</a>
			</c:if>
			<c:if test="${startPage<=BLOCKSIZE }">
			&lt;
		</c:if>
			&nbsp; &nbsp; &nbsp;
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
				[ <b>${i }</b> ]
			</c:if>
				<c:if test="${i != pageNum }">
				[ <a href="${conPath }/allView.do?pageNum=${i}">${i }</a> ]
			</c:if>
			</c:forEach>
			&nbsp; &nbsp; &nbsp;
			<c:if test="${endPage < pageCnt }">
				<a href="${conPath }/allView.do?pageNum=${endPage+1}">&gt;</a>
			</c:if>
			<c:if test="${endPage == pageCnt }">
			&gt;
		</c:if>
			&nbsp; &nbsp; &nbsp; <a
				href="${conPath }/allView.do?pageNum=${pageCnt}">&gt;&gt;</a>
		</div>
	</div>
	<div class="clean"></div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>