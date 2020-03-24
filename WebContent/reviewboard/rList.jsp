<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
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
	margin-bottom: 20px;
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
	width: 900px;
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

table td {
	border-bottom: 1px solid white;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('tr')
								.click(
										function() {
											var fId = Number($(this)
													.children(0).eq(0).text()); // 0번째 td안의 있는 text;
											if (!isNaN(RNum)) {
												location.href = '${conPath}/rContent_view.do?RNum='
														+ RNum
														+ '&pageNum=${pageNum}';
											}
										});
					});
</script>
<body>
	<c:if test="${not empty resultMsg }">
		<script>
			alert('${resultMsg}');
		</script>
	</c:if>
	<c:if test="${not empty loginErrorMsg}">
		<script>
			alert('${loginErrorMsg}');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty errorMsg}">
		<script>
			alert('${errorMsg}');
			history.back();
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<div class="a">
			<c:if test="${not empty member }">
				<div class="head">
					<div class="write">
						<a href="${conPath }/rWrite_view.do">글쓰기</a>
					</div>
					<div class="list">
						<a href="${conPath }/rList.do">목록</a>
					</div>
					</div>
			</c:if>
			<c:if test="${empty member }">
				<a href="${conPath }/loginView.do">글쓰기는 사용자 로그인 이후에만 가능합니다</a>
			</c:if>
			</div>
			<br>
			<div class="b">
				<table>
					<tr>
						<th align="center" nowrap width="60">글번호</th>
						<th nowrap width="60">작성자</th>
						<th nowrap width="400">글제목</th>
						<th nowrap width="120">조회수</th>
						<th nowrap width="80">날짜</th>
						<th nowrap width="50">ip</th>
					</tr>
					<c:if test="${totCnt==0 }">
						<tr>
							<td colspan="6">글이 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${totCnt!=0 }">
						<c:forEach items="${list }" var="dto">
							<tr>
								<td align="center" nowrap width="40">${dto.RNum }</td>
								<td nowrap width="50">${dto.MName }</td>
								<td class="left"><c:forEach var="i" begin="1"
										end="${dto.RIndent }">
										<c:if test="${i==dto.RIndent }"><img src="${conPath }/img/re.gif"></c:if>
										<c:if test="${i!=dto.RIndent }"> &nbsp; &nbsp; </c:if>
									</c:forEach> 
								<c:if test="${dto.RHit > 10 }"><img src="${conPath }/img/hot.gif"></c:if>
									<a href="${conPath }/rContent_view.do?RNum=${dto.RNum}&pageNum=${pageNum}">${dto.RTitle }</a>
								</td>
								<td nowrap width="50">${dto.RHit }</td>
								<td><fmt:formatDate value="${dto.RRdate }" type="date"
										dateStyle="short" /></td>
								<td nowrap width="50">${dto.RIp }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<div class="paging">
				<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/rList.do?pageNum=${startPage-1}"> 이전 </a> ]
		</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i == pageNum }">
						<b> [ ${i } ] </b>
					</c:if>
					<c:if test="${i != pageNum }">
				[ <a href="${conPath }/rList.do?pageNum=${i}"> ${i } </a> ]
			</c:if>
				</c:forEach>
				<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/rList.do?pageNum=${endPage+1}"> 다음 </a> ]
		</c:if>
			</div>
		</div>
		<jsp:include page="../main/footer.jsp" />
</body>
</html>
