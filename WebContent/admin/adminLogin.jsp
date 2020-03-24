<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  @import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');


  *{margin:0; padding:0; box-sizing: border-box;
  }
  body{
     font-family: 'Noto Sans KR', sans-serif;
     display: flex;
     justify-content: center;
     align-items: center;
     height: 100vh;
     background: url("${conPath}/img/로그인배경.jpg") no-repeat center;
     background-size: cover;
  }
  body::before{
  	content:"";
  	position: absolute; z-index: 1;
  	top: 0; right: 0; bottom: 0; left: 0;
  	background-color: rgba(0,0,0,.7);
  }
  .login-form {position: relative; z-index: 2;}
  .login-form h1 {
    font-size: 32px;
    color: #fff;
    text-align: center;
    margin-bottom: 60px;
}
  .int-area{
    width: 400px; position: relative;
    margin-top: 20px;
  }
  .int-area:first-child {margin-top: 0;
    
  }
  .int-area input{
    width: 100%;
    padding: 20px 10px 10px;
    background-color: transparent;
    border: none;
    border-bottom: 1px solid #999;
    font-size: 18px; color: #fff;
    ontline: none;
  }
  .int-area label{
    position: absolute; left: 10px; top: 15px;
    font-size: 18px; color: #999;
    transition: top .5s ease;
  }
  .int-area input:focus + label,
  .int-area input:valid + label {
    top: -2px;
    font-size: 13px; color: #166cea;
  }
  
  .btn-area{margin-top: 30px;}
  .btn-area button{
    width: 100%; height: 50px;
    background: #166cea;
    color: #fff;
    font-size: 20px;
    border: none;
    border-radius: 25px;
    cursor: pointer;
  }
  .caption{
    margin-top: 20px;
    text-align: center;
  }
  .caption a{
  font-size: 15px; color: #999;
  text-decoration: none;
  }
  
  
</style>
<script src="jquery-3.4.1.js"></script>

</head>
<body>
    <c:if test="${not empty admin }">
		<script>location.href='${conPath }/allView.do';</script>
	</c:if>
	<c:if test="${not empty member }">
		<script>alert('관리자만 접근 가능합니다.'); history.back();</script>
	</c:if>
	<section class="login-form">
	   <div class="logo" onclick="location.href='${conPath}/main.do'">
			<img src="${conPath}/img/로고1.png" style="width:200px; height: 100px; margin: 0 auto;" alt="logo" />
		</div>
		<h1></h1>
	  <form action="${conPath }/adminLogin.do" method="post">
	    <div class="int-area">
	      <input type="text" name="AId" id="AId"
	      autocomplete="off" required="required">
	      <label for="id">Admin ID</label>
	    </div>
	    <div class="int-area">
	      <input type="password" name="APw" id="APw"
	      autocomplete="off" required="required">
	      <label for="pw">PASSWORD</label>
	    </div>
	    <div class="btn-area">
	      <button type="submit">LOGIN</button>
	    </div>
	  </form>
	  <div class="caption">
	      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">아이디/비밀번호 찾기</a>
	  </div>
	</section>

</body>
</html>