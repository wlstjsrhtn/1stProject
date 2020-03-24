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
<style>
body {
	height: 1000px;
}

#content {
	width: 900px;
    height: 800px;
    margin: 10px auto 30px;
    overflow: hidden;
    background-color: lightgray;
    border-radius: 20px;
}

#content .Menu {
	border-bottom: 2px solid sky;
	width: 200px;
	color: darkred;
}

#content .Menu h2 {
	text-align: left;
    margin: 20px 0 5px 15px;
    border-bottom: 1px solid sky;
}
#content .movieContent{
    width: 900px;
    height: 550px;
    border-top: 5px solid gray;
    border-bottom: 5px solid gray;
    margin-top: 30px;
    margin-bottom: 50px;
}
#content .movieContent .movie {
	width: 130px;
    float: left;
    margin: 40px 10px auto;
}
#content .movieContent .movie .MTitle, #content .movieContent .movie .MRdate {
	text-align: center;
}
#content .movieContent img{
     width: 130px; 
     height: 170px;
}
#content .movieContent .movie {
.admin{
     text-align: center;
     margin: 0 auto;
}
#content .paging {
    text-align: center;
}
#content .admin input{
     text-align: center;
}
</style>
</head>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$('tr').click(function(){
			var MTitle = Number($(this).children(0).eq(0).text()); // 0번째 td안의 있는 text;
			if(!isNaN(MTitle)){
				location.href = '${conPath}/mcontent_view.do?MTitle='+MTitle+'&pageNum=${pageNum}';
			}
		});
	});
</script>
<c:if test="${not empty resultMsg }">
	<script>alert('${resultMsg}');</script>
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
<body>

	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<div class="Menu">
			<c:if test="${totCnt!=0}">
				<h2>영화정보</h2>
		    </c:if>
		</div>
		<c:if test="${totCnt==0 }">
	      개봉중인 영화가 없습니다.
	  </c:if>
		<div class="movieContent">
            <c:if test="${totCnt!=0}">
			<c:forEach items="${mList }" var="dto">
				<div class="movie">
					<div class="MPhoto">
						<a href="${conPath }/mcontent_view.do?MTitle=${dto.MTitle}">
						<img alt="영화포스터" src="${conPath }/moviePhotoUp/${dto.MPhoto}"
							id=img></a>
					</div>
					<div class="MTitle">${dto.MTitle }</div>
					<div class="MRdate">${dto.MRdate }</div>
				</div>
			</c:forEach>
			</c:if>
		</div>
		<div class="paging">
			<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/mList.do?pageNum=${startPage-1}"> 이전 </a> ]
		</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b> [ ${i } ] </b>
				</c:if>
				<c:if test="${i != pageNum }">
				[ <a href="${conPath }/mList.do?pageNum=${i}"> ${i } </a> ]
			</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/mList.do?pageNum=${endPage+1}"> 다음 </a> ]
		</c:if>
		</div>
		<br>
		<br>
		<c:if test="${empty member and not empty admin }">
			<div class="admin">
				<input type="button" value="영화등록"
					onclick="location.href='${conPath}/mwrite_view.do'">
			</div>
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
