<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 만들기</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/login.css">
<style>
.outer{
		width: 430px; height: 400px;  background-color: rgba(255, 255, 255, 0.4);  /* border: 5px solid #DDEFBB; */ 
		color: black; margin-left: auto; margin-right: auto; margin-top: 50px;
	} 
	
.int-id input{ /* ID입력단 */
	width: 430px;
	height: 70px;
	background: #EAEAEA;
	text-align: center; 
	border: none;
	font-size:25px; color:#838383;
	
}
.int-pw input{ /* PW입력단 */
	width: 430px;
	height: 70px;
	background: #EAEAEA;
	text-align: center; 
	border: none;
	font-size:25px; color:#838383;
}

 
/* ===================================================================================================== */
.login_search {
   left: 400px;
   padding-top: 20px;
   padding-bottom: 20px;
   text-indent: 155px;
   float: right;
  
}

/* ============================================================= 아래부터 로그인 버튼 */

.btn_type1 {
	width:430px;
    height: 80px;
	font-size: 25px; color:#fff;
    border: 1px solid  #589284;
    background-color:  #589284;

}
.btn_type2{

	width:430px;
    height: 80px;
	font-size: 25px; color:#589284;
    border: 1px solid  #589284;
    background-color:  #ffff;
    
}
	/*  #myForm td {text-align: center;}
	#myForm>table{margin: auto; height:200px;}	
	#btn_type1 {background: #DDEFBB; color: white; border: 1px solid gray; border-radius:20px;}
	#btn_type2 {background: #DDEFBB; color: white; border: 1px solid gray; border-radius:20px;}	  */

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="outer">

		<form action="<%=request.getContextPath()%>/login.me" method="post"
			id="myForm">
			<h1 align="center">로그인</h1>
			<table class="login-box">
				<tr>
					<!-- <td width="200px">아이디 </td> -->
					<td width="200px"><div class="int-id">
							<input type="text" name="userId" size="20" tabindex="1"
								placeholder="6자 이상의 영문">
						</div></td>
				</tr>

				<tr>
					<!-- <td>비밀번호</td> -->
					<td><div class="int-pw"><br>
							<input type="password" name="userPwd" size="20" tabindex="2"
								placeholder="비밀번호를 입력해주세요">
						</div></td>
				</tr>

				<tr>
					<td><div class="login_search">
							<!-- <input type = "button" value="아이디 찾기" onclick="searchId();"class="link">
							<input type = "button" value="비밀번호 찾기" onclick="searchPwd();"class="link"> -->
							<a class="link" onclick="searchId();">아이디 찾기</a> <span
								class="bar">/</span> <a class="link" onclick="searchPwd();">비밀번호
								찾기</a>
						</div></td>
				</tr>
				<tr>
					<td>
						<button id="btn_type1" type="submit" class="btn_type1">
							<span class="txt_type">로그인</span>
						</button> <!-- <input id="btn_type1" type="submit" value="로그인"> --> <br>
						<br>
						<button type="button" class="btn_type2" id="btn_type2"
							onclick="memberSignUp();">
							<span class="txt_type">회원가입</span>
						</button> <!-- <input id="btn_type2" type="button"  onclick="location.href='javascript:history.back();'" value="취소하기"> -->
					</td>
				</tr>
			</table>

		</form>
	</div>
	<br><br><br><br><br><br><br><br><br>
	
	

	<%@ include file="../common/footer.jsp" %>
	<script>
		function memberSignUp(){
		      location.href='<%=request.getContextPath() %>/signUpForm.me';
		}
		
		function searchId(){
			window.open("searchIdForm.me", "searchIdForm", 'width=400 , height=300');
		}
		
		function searchPwd(){
			window.open("searchPwdForm.me", "searchPwdForm",'width=300 , height=300');
		}
	</script>
</body>
</html>