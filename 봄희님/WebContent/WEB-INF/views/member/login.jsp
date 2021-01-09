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
	height: 60px;
	background: #EAEAEA;
	text-align: center; 
	border: none;
	font-size:25px; color:#838383;
}
.int-pw input{ /* PW입력단 */
	width: 430px;
	height: 60px;
	background: #EAEAEA;
	text-align: center; 
	border: none;
	font-size:25px; color:#838383;
}
	
 .checkbox_save {
    overflow: hidden;
    padding-bottom: 28px;
  
}
.label_checkbox {
    position: relative;
    padding: 0 0 3px 22px;
    font-size: 13px;
    line-height: 20px;
}

 .label_checkbox.checked:before {
    background: url(./images/ico_checkbox_on.png), no-repeat 50% 50%;
} 
 .label_checkbox:before {
    content: "";
    position: absolute;
    left: 0;
    top: 3px;
    width: 16px;
    height: 17px;
    background: url(./images/ico_checkbox_off.png) no-repeat 50% 50%;
} 
.label_checkbox [type=checkbox] {
    position: absolute;
    left: 0;
    top: 3px;
    opacity: 0;
}
.label_checkbox {
    position: relative;
    padding: 0 0 3px 22px;
    font-size: 13px;
    line-height: 20px;
}

.checkbox_save .label_checkbox {
    float: left;
    margin-top: 9px;
}
.label_checkbox {
    position: relative;
    padding: 0 0 3px 22px;
    font-size: 13px;
    line-height: 20px;
}
/* ===================================================================================================== */
.login_search {
   left: 600px;
   padding-top: 10px;
   text-indent: 155px;
}
a {
    background-color: transparent;
    text-decoration: none;
    color: inherit;
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
	/* #myForm td {text-align: center;}
	#myForm>table{margin: auto; height:200px;}	
	#btn_type1 {background: #DDEFBB; color: white; border: 1px solid gray; border-radius:20px;}
	#btn_type2 {background: #DDEFBB; color: white; border: 1px solid gray; border-radius:20px;}	 */
	
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

		<div class="outer">

			<form action="<%= request.getContextPath() %>/login.me" method="post" id="myForm">
			<h1 align="center">로그인</h1>
				<table class="login-box">
					<tr>
						<!-- <td width="200px">아이디 </td> -->
						<td width="200px"><div class="int-id"><input type="text" name="userId" size="20" tabindex="1" placeholder="6자 이상의 영문">
					</div>	</td>
					</tr>
					
					<tr>
						<!-- <td>비밀번호</td> -->
						<td><div class="int-pw">
							<input type="password" name="userPwd" size="20" tabindex="2"placeholder="비밀번호를 입력해주세요">
						</div></td>
					</tr>
					
					<!-- <div class="checkbox_save"></div>
					<label class="label_checkbox checked">
					<input type="checkbox" id="chk_security" 
					name="chk_security" value="y" checked="checked" 
					onchange="if( this.checked){$(this).parent().
					addClass('checked')}else{$(this).parent().removeClass('checked')} ">
					보안접속
					</label> -->
						
					
					<tr>
						
						<td><div class="login_search">
							<a href="/shop/member/find_id.php" class="link">아이디 찾기</a>
							<span class="bar">/</span>
							<a href="/shop/member/find_pwd.php" class="link">비밀번호 찾기</a>
							</div>
						</td>
					</tr>
					<tr>
						<td>
						<button id="btn_type1" type="submit" class="btn_type1"><span class="txt_type">로그인</span></button>
							<!-- <input id="btn_type1" type="submit" value="로그인"> -->
						<br>
						<br>
							<button
							
							 type="button" class="btn_type2" id="btn_type2"  onclick="memberSignUp();"
							 ><span class="txt_type">회원가입</span></button>	
								<!-- <input id="btn_type2" type="button"  onclick="location.href='javascript:history.back();'" value="취소하기"> -->	
						</td>
					</tr>	
				</table>
				
			</form>
		</div>
				<br><br><br><br>

	<%@ include file="../common/footer.jsp" %>
	<script>
		function memberSignUp(){
		      location.href='<%=request.getContextPath() %>/signUpForm.me';
		}
	</script>
</body>
</html>