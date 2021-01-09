<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	Member member = (Member)request.getAttribute("member"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width: 48%; height: 450px; background-color: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 5%;
	}
	#myForm td {text-align: center;}
	#myForm>table{margin: auto;}	
	#updateBtn {background: #589284; color: white;}
	#updatePwdBtn {background: #589284; color: white;}
	#deleteBtn {background: #589284; color: white;}
	#goMain {background: #589284; color: white;}	
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	
	<div class="outer">
		<br>
		<h2 align="center"><%= member.getMembername() %>님의 정보</h2>
		
		<form action="<%= request.getContextPath() %>/updateForm.me" method="post" id="myForm">
			<table>
				<tr>
					<td width="200px" >아이디</td>
					<td width="200px"><%= member.getMemberid() %></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><%= member.getMembername() %></td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td><%= member.getPhone() %></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><%= member.getEmail() %></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><%= member.getPostal() %></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><%= member.getAddress1() %></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><%= member.getAddress2() %></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><%= member.getGender() %></td>
				</tr>
				<tr>
					<td>가입일</td>
					<td><%= member.getEnrolldate() %></td>
				</tr>
			</table>
			
			
			<br><br>
			
			<div id="myPageBtns" align="center">
				<input id="updateBtn" type="submit" value="정보 수정">
				<input id="updatePwdBtn" type="button" value="비밀번호 수정" onclick="location.href='updatePwdForm.me'">
				<input id="deleteBtn" type="button" value="탈퇴하기" onclick="deleteMember(); ">
				<input type="button" id="goMain" onclick="location.href='<%= request.getContextPath() %>'"  value="메인 이동">
			</div>
		</form>

	</div>

	
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		function deleteMember(){
			var bool = confirm("정말 삭제하시겠습니까?");
			
			if(bool){
				location.href="delete.me";
			}
		}
	</script>

</body>
</html>