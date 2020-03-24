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
#content {
	width: 800px;
    height: 600px;
    margin: 0 auto 30px;
}

#subContentWrap {
	width: 650px;
	float: left;
}

div {
	display: block;
}

#subPage {
	width: 920px;
	margin: 0 auto;
	text-align: left;
	overflow: hidden;
}

#subPage {
	width: 860px;
	margin: 0 auto;
	text-align: left;
	overflow: hidden;
}

.conSoonOnTitleWrap {
	height: 58px;
	_height: 60px;
	position: relative;
	margin-bottom: 10px;
}

body {
	margin: 0 0 0 0;
	background-color: #FFFFFF;
	text-align: center;
	font-size: 12px;
	color: #333;
	font-family: Gulim, Verdana, AppleGothic, sans-serif;
}

.conNewsTitle {
	margin: 0;
	padding: 0;
	background-color: #f2f2f2;
	border-top: 1px dotted #dadada;
	border-bottom: 3px solid #333333;
	padding: 10px;
	margin-top: 3px;
}

.conMovieInfo {
	width: 650px;
	padding: 0;
	margin: 20px 0 20px 0;
	position: relative;
	overflow: hidden;
}

.conMovieInfo .conMovieImg {
	width: 166px;
	padding: 0;
	margin: 0;
	overflow: hidden;
	float: left;
}

#content .mContent img {
	width: 236px;
	height: 340px;
}
#content .head{
    height: 100px;
    text-align: left;

}
#content .head .htitle, #content .head .htitle2 {
    float: left;
}
#content .head .htitle h2{
	margin: 30px 0 0 30px;
    text-align: center;
    border-bottom: 1px solid black;
}
#content .sb1Content, #content .sb2Content{
	float: left;
	margin-bottom: 10px;
}
#content .sb1Content .mContent img{
    margin-left: 50px;
    margin-right: 30px;
    margin-bottom: 10px; 
}
#content .sb1Content .MTitle{
	width:235.99px;
    margin-left: 50px;
}
#content .sb2Content{
    height: 360px;
}
#content .sb2Content ul{
    list-style: none;
    overflow: hidden;
    border-bottom: 1px dashed lightgray;
    padding-inline-start: 20px;
}
#content .sb2Content ul li{
	float: left;
	margin-right: 10px;
	margin-bottom: 4px;
}
#content .sb2Content ul .title{
	width: 80px;
	text-align: left;
	font-size: 1.2em;
}
#content .sb2Content ul .content{
    width: 300px;
    text-align: left;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<form action="${conPath}/movieModify_view.do?MTitle=${mcontent_view.MTitle }&pageNum=${param.pageNum }" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="MTitle" value="${mcontent_view.MTitle }">
			<div id="content_1">
				<div class="head">
					<div class="htitle">
						<h2>영화 상세보기</h2>
					</div>
					<div class="title2"></div>
				</div>
				<div class="sb1Content">
				<div class="mContent">
					<img alt="영화포스터"
						src="${conPath }/moviePhotoUp/${mcontent_view.MPhoto}" id=img>
				</div>
				<div class="MTitle">${mcontent_view.MTitle }</div>
				</div>
				<div class="sb2Content">
					<ul class="MovieInfo">
						<li class="title"><b>감독</b></li>
						<li class="content">${mcontent_view.MDName }</li>
					</ul>
					<div class="floatclear"></div>
					<ul class="MovieInfo">
						<li class="title"><b>배우</b></li>
						<li class="content">${mcontent_view.MActor }</li>
					</ul>
					<div class="floatclear"></div>
					<ul class="MovieInfo">
						<li class="title"><b>예매순위</b></li>
						<li class="content">${mcontent_view.MBRank }</li>
					</ul>
					<div class="floatclear"></div>
					<ul class="MovieInfo">
						<li class="title"><b>개봉일자</b></li>
						<li class="content">${mcontent_view.MRdate }</li>
					</ul>
					<div class="floatclear"></div>
					<ul class="MovieInfo">
						<li class="title"><b>줄거리</b></li>
						<li class="content">${mcontent_view.MStory }</li>
					</ul>
					<div class="floatclear"></div>
					<div class="floatclear"></div>
				</div>
			</div>

			<table>
				<c:if test="${empty member and not empty admin }">
					<tr>
						<td colspan="2"><input type="submit" value="수정" class="btn">
							<input type="button" value="삭제" class="btn"
							onclick="location='${conPath}/mdelete.do?MTitle=${mcontent_view.MTitle }&pageNum=${param.pageNum }'">
							<input type="button" value="목록" class="btn"
							onclick="location='${conPath}/mList.do?pageNum=${param.pageNum }'">
						</td>
					</tr>
				</c:if>
				<c:if test="${empty admin }">
					<tr>
						<td colspan="3"><input type="button" value="목록" class="btn"
							onclick="location.href='${conPath}/mList.do'"></td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>

