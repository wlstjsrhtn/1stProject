<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
  body{
  width:100%;
  height: 100%;
  
  }
  .login-form{
  width: 600px;
  height: 800px;
  text-align: center;
  margin: 0 auto;
  border-left: 1px solid lightgray;
  border-right: 1px solid lightgray;
  margin-bottom: 30px; 
  }
  table{
  width: 600px;
  text-align: center;
  margin: 0 auto;
  }
  table td input .btn{
  text-align: center;
  }
</style>
</head>
<body>
    <jsp:include page="../main/header.jsp"/>
    <section class="login-form">
    <div class="logo" onclick="location.href='${conPath}/main.do'">
		<img src="${conPath}/img/로고1.png" style="width:200px; height: 100px; text-align: center; margin-bottom: 100px; margin-bottom: 100px;" alt="logo" />
	</div>
	<form action="${conPath }/modify.do" method="post">
	    <div id="join_title"></div>
		<table>
		   <tr><th>USER ID</th>
					<td><input type="text" name="MId" id="MId" class="MId" size="50px" value="${member.MId }" readonly="readonly"
									required="required">
					<div></div>&nbsp; &nbsp; &nbsp;</td>
					
			</tr>
			<tr><th>PASSWORD</th>
					<td><input type="password" name="MPw" size="50px"
									required="required">
					<div></div>&nbsp; &nbsp; &nbsp;</td>
			</tr>
			<tr><th>NAME</th>
					<td><input type="text" name="MName" size="50px" value="${member.MName }"
									required="required">
					<div>&nbsp; &nbsp; &nbsp;</div></td>
			</tr>
			<tr><th>PHONE</th>
					<td><input type="tel" name="MTel" size="50px" value="${member.MTel }">
					<div>&nbsp; &nbsp; &nbsp;</div></td>
			</tr>
			<tr><th>BIRTH</th>
					<td colspan="2">
						<input type="date" name="MBirth" size="50px" value="${member.MBirth }">
					<div>&nbsp; &nbsp; &nbsp;</div></td>
			</tr>
			<tr><th>EMAIL</th>
					<td><input type="email" name="MEmail" size="50px" value="${member.MEmail }">
					<div>&nbsp; &nbsp; &nbsp;</div></td>
			</tr>
			<tr><th>GENDER</th>
					<td><input type="radio" name="MGender" value="${member.MGender }" checked="checked" id="m"><label for="m">남자</label> <input
						type="radio" name="MGender" value="f" id="f"><label for="f">여자</label>
					<div>&nbsp; &nbsp; &nbsp;</div></td>
			</tr>
			<tr><th>ADDRESS</th>
					<td colspan="2">
						<input type="text" name="MAddress" size="50px" value="${member.MAddress }">
					<div>&nbsp; &nbsp; &nbsp;</div></td>
			<tr><th></th>
			<td>
					<div>&nbsp; &nbsp; &nbsp;</div>
					<div>&nbsp; &nbsp; &nbsp;</div>
					<div>&nbsp; &nbsp; &nbsp;</div></td>
			</tr>
			<tr><td colspan="3">
						<input type="submit" value="정보수정"  class="btn">
						<input type="reset" value="취소"  class="btn">
						<input type="reset" value="이전"  class="btn" onclick="history.go(-1)">	
					</td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>