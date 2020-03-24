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
	<form action="${conPath }/movieModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<table>
			<caption>${mmodify_view.MTitle } 영화 수정</caption>
			<tr><th>제목</th>
					<td><input type="text" name="MTitle" required="required" size="30" readonly="readonly"
								value="${mmodify_view.MTitle }"></td>
			</tr>
			<tr><th>영화포스터</th>
					<td><input type="file" name="MPhoto" class="btn"> 원첨부파일:
							<c:if test="${not empty mmodify_view.MPhoto }">
						 		<a href="${conPath }/moivePhotoUp/${mmodify_view.MPhoto}" target="_blank">${mmodify_view.MPhoto}</a>
						 	</c:if>
						 	<c:if test="${empty mmodify_view.MPhoto }">
						 		첨부파일없음
						 	</c:if>
					</td>
			</tr>
			<tr><th>줄거리</th>
					<td><textarea rows="5" cols="32" 
							name="MStory">${mmodify_view.MStory }</textarea></td>
			</tr>
			<tr><th>감독명</th>
					<td><input type="text" name="MDName" required="required" size="30"
								value="${mmodify_view.MDName }"></td>
			</tr>
			<tr><th>출연</th>
					<td><input type="text" name="MActor" required="required" size="30"
								value="${mmodify_view.MActor }"></td>
			</tr>
			<tr><th>개봉여부</th>
					<td><select name="MW" id="MW">
                        <option>Y</option>
                        <option>M</option>
                    </select></td>
			</tr>
			<tr><th>예매순위</th>
					<td><input type="text" name="MBRank" required="required" size="30"
								value="${mmodify_view.MBRank }"></td>
			</tr>
			<tr><th>개봉일</th>
					<td><input type="text" name="MRdate" required="required" size="30"
								value="${mmodify_view.MRdate }"></td>
								

                   </select>					
								
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