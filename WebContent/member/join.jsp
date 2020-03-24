<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
		$(document).ready(function(){
			$('input[name="MId"]').keyup(function(){
				var MId = $('input[name="MId"]').val();
				$.ajax({
					url : '${conPath}/idConfirm.do',
					type : 'get',
					dataType : 'html',
					data : "MId="+MId,
					success : function(data){
						$('#idConfirmResult').html(data);
					}
				});//ajax
			});
			$('form').submit(function(){
				var idConfirmResult = $('#idConfirmResult').text().trim();
				if(idConfirmResult!='사용가능한 ID입니다'){
					alert('사용가능한 ID인지 확인요망');
					$('input[name="MId"]').focus();
					return false;
				}
			});
		});
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
	  $( "#birth" ).datepicker({
	    	dateFormat : 'yy-mm-dd',
	    	monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	showMonthAfterYear : true,
	    	yearSuffix : '년', // "2020년 3월"
	    	showOtherMonths : true,
	    	dayNamesMin:['일','월','화','수','목','금','토']
	    });
  } );
  </script>
</head>
<body>
   <jsp:include page="../main/header.jsp" />
   <section class="login-form">
	<div class="logo" onclick="location.href='${conPath}/main.do'">
		<img src="${conPath}/img/로고1.png" style="width:200px; height: 100px; text-align: center; margin-bottom: 100px; margin-bottom: 100px;" alt="logo" />
	</div>
	<form action="${conPath }/join.do" method="post">
	    <div id="join_title"></div>
		<table>
			<tr><th>USER ID</th>
			        <td><input type="text" name="MId" id="MId" class="MId" size="50px" required="required">
		            <div id="idConfirmResult">&nbsp; </div></td>
		    </tr>
		    <tr><th>PASSWORD</th>
		            <td><input type="password" name="MPw" size="50px" required="required">
		            <div>&nbsp; &nbsp; &nbsp;</div></td>
		    </tr>
		    <tr><th>NAME</th>
		            <td><input type="text" name="MName" size="50px" required="required">
		            <div>&nbsp; &nbsp; &nbsp;</div></td>
		    </tr>
		    <tr><th>PHONE</th>
		            <td><input type="tel" name="MTel" size="50px" required="required">
		            <div>&nbsp; &nbsp; &nbsp;</div></td>
		    </tr>
		    <tr><th>BIRTH</th>
		            <td><input type="text" name="MBirth" size="50px" id="birth">
		            <div>&nbsp; &nbsp; &nbsp;</div></td>
		    </tr>
		    <tr><th>EMAIL</th>
		            <td><input type="email" name="MEmail" size="50px">
		            <div>&nbsp; &nbsp; &nbsp;</div></td>
		    </tr>
		    <tr><th>GENDER</th>
					<td><input type="radio" name="MGender" value="m"
						checked="checked" id="m"><label for="m">남자</label> <input
						type="radio" name="MGender" value="f" id="f"><label for="f">여자</label>
					<div>&nbsp; &nbsp; &nbsp;</div></td>
		    </tr>
		    <tr><th>ADDRESS</th><td><input type="text" name="MAddress" size="50px">
		            <div>&nbsp; &nbsp; &nbsp;</div></td>
		    </tr>
		    <tr><td colspan="2">
						<input type="submit" value="JOIN MEMBERSHIP"  class="btn">
						<input type="button" value="LOGIN"  class="btn" 
								onclick="location.href='${conPath}/loginView.do'">
		</table>
	</form>
   </section>
   <jsp:include page="../main/footer.jsp" />
</body>
</html>