<!-- 회원가입 24. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="inputValue();">
	<b>이메일 중복 검사</b>
	<br>
	<form action="<%= request.getContextPath() %>/checkEmail.me" id="emailCheckFrom">
		<input type="text" id="inputEmail" name="inputEmail">
		<input type="submit" value="중복확인">
	</form>
	
	<br>
	
	<!-- 회원가입 30. -->
	<% 
		if(request.getAttribute("result") != null){
			int result = (int)request.getAttribute("result");
			if(result > 0){
	%>
				이미 사용중인 이메일입니다.
	<% 		} else {%>
				사용 가능한 이메일입니다.
	<%		}
		}
	%>
	
	<input type="button" id="usedEmail" value="확인" onclick="usedEmail();">
	<input type="button" id="cancel" value="취소" onclick="window.close();">
	
	<br>
	<br>

	<script>
		function inputValue() {
			if('<%= request.getAttribute("checkedEmail") %>' == 'null'){
				document.getElementById('inputEmail').value
					= opener.document.joinForm.joinEmail.value;
			} else {
				document.getElementById('inputEmail').value = "<%= request.getAttribute("checkedEmail") %>";
			}
		}
		
		function usedEmail(){
			opener.document.joinForm.joinEmail.value
				=document.getElementById('inputEmail').value;
			
			self.close();
		}
	</script>

</body>
</html>