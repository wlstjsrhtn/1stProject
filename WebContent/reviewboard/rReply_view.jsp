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
<style>
#content {
	width: 1000px;
	height: 500px;
	margin: 0 auto;
}

#content table {
	width: 500px;
	height: 50px;
	margin: 0 auto;
}

#content table tr {
	height: 40px;
}

#content table tr:hover {
	cursor: pointer;
}

#content td, #content_form th {
	text-align: center;
	padding: 5px;
}

#content caption {
	font-size: 18px;
	padding: 10px;
}

#content h2, #content_form b {
	text-align: center;
	color: red;
}

#content a {
	text-decoration: none;
	color: black
}

#content .left {
	text-align: left;
}

#content .paging {
	text-align: center;
}

#content input:not (.btn ), #content_form textarea {
	width: 90%;
}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div id="content">
  <!-- 파라미터 : bid, pageNum -->
  <!-- request의 attribute : reply_view(원글의 dto) -->
  <form action="${conPath }/rReply.do?RNum=${rReply_view.RNum }&pageNum=${param.pageNum }" method="post" enctype="multipart/form-data">
    <input type="hidden" name="pageNum" value="${param.pageNum }">
    <input type="hidden" name="RGroup" value="${rReply_view.RGroup }">
    <input type="hidden" name="RStep" value="${rReply_view.RStep }">
    <input type="hidden" name="RIndent" value="${rReply_view.RIndent }">
    
    <div class="mid">
				<div class="head">
					<table>
						<tr>
							<td style="width: 86px; border-top:2px solid gray; border-bottom: 1px solid gray; background-color: lightgray;">제목</td>
							<td style= "border-top:2px solid gray; border-bottom: 1px solid gray; background-color: lightgray;"><input type="text" name="RTitle" required="required" value="[답]${rReply_view.RTitle.substring(0,3) }"
								size="30"></td>
						</tr>
					</table>
				</div>
				<div class="con">
					<table>
						<tr>
							<td style="width: 86px; height: 240px; border-top:2px solid gray; border-bottom: 1px solid gray; background-color: #F6F6F6;">본문</td>
							<td style= "border-top:2px solid gray; border-bottom: 1px solid gray; background-color: #F6F6F6;"><textarea name="RContent" rows="3" cols="32"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="file">
					<table>
						<tr>
							<td style="width: 86px; border-top:2px solid gray; border-bottom: 1px solid gray; background-color: #F6F6F6;">첨부파일</td>
							<td style= "border-top:2px solid gray; border-bottom: 1px solid gray; background-color: #F6F6F6;"><input type="file" name="RFileName"></td>
						</tr>
					</table>
				</div>
				<div class="buttom">
					<table>
						<tr>
							<td style= "border-top:1px solid gray; border-bottom: 2px solid gray;">
							    <input type="submit" value="글쓰기" class="btn">
								<input type="reset" value="취소" class="btn">
								<input type="button" value="목록" class="btn"
								onclick="loction.href='${conPath }/rList.do?pageNum=${param.pageNum }'" class="btn">
					</table>
				</div>
			</div>
		</form>
		</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>