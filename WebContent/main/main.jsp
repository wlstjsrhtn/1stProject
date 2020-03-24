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
    body{
        background-image: url('${conPath}/img/11.PNG');
        height: 650px;
    }
	#content {
    width: 1000px;
    height: 650px;
    margin: 0 auto;
    overflow: hidden;
}
    #content_2 {
    width: 1000px;
    height: 200px;
    margin: 0 auto;
    overflow: hidden;
}
    #content_3 {
    width: 1000px;
    height: 600px;
    margin: 0 auto;
    overflow: hidden;
}
    #content_2 .MOVE{
    float:left;
    }
    #content_2 h5{
    text-align: center;
    }
	#content #br_3 {
    width: 250px;
    float: left;
    margin: 0 30px auto;
    height: 600px;
}
    #content #br_1 {
    width: 250px;
    margin: 40px 30px auto;    
    float: left;
    height: 600px;
}
    #content #br_2 {
    float: left;
    width: 250px;
    margin: 0 30px auto;
    margin-left: 30px;
    height: 600px;
}
	#content #br_3 div:nth-child(1) {
    height: 50px;
    color: white;
    text-align: center;
    border-radius: 15px;
    line-height: 50px;
}
    #content #br_3 div:nth-child(2) {
    height: 355px;
    border-radius: 15px;
}
    #content #br_3 div:nth-child(3) {
    height: 160px;
    color: white;
    border-radius: 15px;
}
    #content #br_1 div:nth-child(1) {
    height: 50px;
    color: white;
    text-align: center;
    border-radius: 15px;
    line-height: 50px;
}
    #content #br_1 div:nth-child(2) {
    height: 355px;
    border-radius: 15px;
}
    #content #br_1 div:nth-child(3) {
    height: 160px;
    color: white;
    border-radius: 15px;
}
    #content #br_2 div:nth-child(1) {
    height: 50px;
    color: white;
    text-align: center;
    border-radius: 15px;
    line-height: 50px;
}
    #content #br_2 div:nth-child(2) {
    height: 355px;
    border-radius: 15px;
}
    #content #br_2 div:nth-child(3) {
    height: 160px;
    color: white;
    border-radius: 15px;
}
    #content .poster_1 img.poster, #content .poster_2 img.poster, #content .poster_3 img.poster {
    display: block;
    width: 245px;
    height: 352px;
    border-radius: 5px;
}
    #content #br_3{
    -webkit-transform: skewy(15deg);
    -moz-transform: skewy(15deg);
    -ms-transform: skewy(15deg);
    -o-transform: skewy(15deg);
    transform: skewy(15deg);
    }
    #content #br_2{
    -webkit-transform: skewy(165deg);
    -moz-transform: skewy(165deg);
    -ms-transform: skewy(165deg);
    -o-transform: skewy(165deg);
    transform: skewy(165deg);
    }
    #content_2 p{
    border-top: 1px solid lightgray;
    width: 100%;
    color: white;
    font-size: 1.2em;
    text-align: center;
    margin-bottom: 20px;
    }
    #content_2 .CGV {
    width: 200px;
    float: left;
    margin: 0 10px 0 100px;
    height: 50px;
    cursor: pointer;
}
    #content_2 .LOTTE {
    
    width: 200px;
    float: left;
    margin: 0 50px 0 50px;
    height: 50px;
    cursor: pointer;
}
    #content_2 .MEGA {
    width: 200px;
    float: left;
    margin: 0 10px 0 50px;
    height: 50px;
    cursor: pointer;
}
    #content_3{
    margin:0 auto;
    }
    #content_3 p{
    border-top: 1px solid lightgray;
    width: 100%;
    color: white;
    font-size: 1.5em;
    text-align: center;
    margin-bottom: 20px;
    }
    video {
    object-fit: contain;
}
</style>
</head>
<body>
	<c:if test="${not empty modifyResult }">
		<script>
			alert('${modifyResult}');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	  <div id="br_3">
	    <div>
	            예매순위 3
	    </div>
		<div class="poster_3" onclick="location.href='${conPath}/main.do'">
			<img src="${conPath}/img/인비저블맨.jpg" class="poster" alt="poster1" />
		</div>
		<div class="story_3">
		   <ul>
			<li>영화명 : 인비저블맨</li>
			<li>줄거리 : 모든 것을 통제하려는 소시오패스 남자에게서 도망친 세실리아 그의...</li>
			<li>감독 : 리 워넬 </li>
			<li>출연자 : 엘리자베스 모스,올리버 잭슨 코헨, 알디스 호지.. </li>
		   </ul>
		</div>
	    </div>
		<div id="br_1">
		<div>
	            예매순위 1
	    </div>
		<div class="poster_1" onclick="location.href='${conPath}/main.do'">
			<img src="${conPath}/img/다크워터스.jpg" class="poster" alt="poster2" />
	    </div>
	    <div class="story_1">
	       <ul>
			<li>영화명 : 다크 워터스</li>
			<li>줄거리 : 젖소 190마리의 떼죽음 메스꺼움과 고열에 시달리는 사람들 기형아...</li>
			<li>감독 : 토드 헤인즈 </li>
			<li>출연자 : 마크 러팔로, 앤 해서웨이, 팀 로빈스, 빌캠프.. </li>
		   </ul>	
		</div>
		</div>
		<div id="br_2">
		<div>
	            예매순위 2
	    </div>
		<div class="poster_2" onclick="location.href='${conPath}/main.do'">
			<img src="${conPath}/img/1917.jpg" class="poster" alt="poster3" />
	    </div>
	    <div class="story_2">
	      <ul>
			<li>영화명 : 1917</li>
			<li>줄거리 : 제1차 세계대전이 한창인 1917년. 독일군에 의해 모든 통신망이 ...</li>
			<li>감독 : 샘 멘데스 </li>
			<li>출연자 : 조지 맥케이, 딘-찰스 채프먼, 콜린 퍼스.. </li>
		  </ul>
		</div>
		</div>
		</div>
	    <div id="content_2">
	       <p><br>▽ 영화 예매하러 가기 ▽</p>
		<div class="CGV" onclick="location.href='http://www.cgv.co.kr/'" title="CGV페이지로 이동">
		    <img src="${conPath}/img/cgv.jpg" class="move" alt="cgv" />
		</div>
	    <div class="LOTTE" onclick="location.href='https://www.lottecinema.co.kr/NLCHS/''" title="LOTTE페이지로 이동">
	        <img src="${conPath}/img/롯데시네마.PNG" class="move" alt="lotte" /></div>
	    <div class="MEGA" onclick="location.href='https://www.megabox.co.kr/'" title="MEGA페이지로 이동">
	        <img src="${conPath}/img/메가박스.PNG" class="move" alt="mega" /></div>
	    </div>
	    <div id="content_3">
	        <p><br>블랙 위도우 / 2020년 5월 대개봉</p>
	     <video controls="controls" loop="loop" width="1000" height="500" autoplay="autoplay">
         <source src="${conPath}/vod/블랙위도우.mp4">
         </video>
 

	    </div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>