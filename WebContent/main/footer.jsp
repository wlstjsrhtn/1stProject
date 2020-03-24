<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	footer {
	        height:200px;
	        background-color: white;
	        border-top: 1px solid #080808;
	        border-bottom: 1px dashed #080808;
	}
	footer #footer_conts{
	 border:1px solid lightgray;
	 width: 1100px;
	 margin: 0 auto;
	}
	footer #footer_conts p {
		color:black;
		font-weight: blod;
		font-size:0.9em;
		text-align: left;
	}
	
	#footer_conts div {
    overflow: hidden;
    float: left;
    margin-left: 50px;
}
    #footer_conts .logo{
    margin-top: 25px;
    }
    ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
    #footer_conts img{
    width: 150px;
    height: 75px;
    }
    .address{
    margin-top: 30px;
    }
    
</style>
</head>
<body>
	<footer>
		<div id="footer_conts">
		    <div class="logo">
              <img src="${conPath}/img/로고1.png">		    
		    </div>
		    <div class="address">
			  <p>서울특별시 강남구 강남로 50, 6층(강남동 1가, 쇼룸) ARS 1500-0000 | <b><a href="${conPath }/adminloginView.do">관리자 모드</a></b></p>
			  <p>대표자명 김진형 · 개인정보보호책임자 BP본부 본부장 홍길동 · 사업자등록번호 333-33-33333 · 통신판매업신고번호 제 555호</p>
			  <p>COPYRIGHT © ShowRoomJoongAng, Inc. All rights reserved</p>
			</div>
		</div>
	</footer>
</body>
</html>