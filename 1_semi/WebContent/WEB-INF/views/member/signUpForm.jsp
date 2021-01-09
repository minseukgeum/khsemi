<!-- 회원가입 4. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 만들기</title>
<style>

/* 	section */
.section-area{
	margin-top: 20px;
	margin-bottom: 50px;
	align: center;
}

.joinArea{
			width: 700px; height: 900px;
			margin-left: auto; margin-right: auto; margin-top: 150px; margin-bottom: 50px;
			font-size: 12px;
		}
#idCheck, #findPostal, #emCheck, #signUpBtn{
				border-radius: 15px; color: white; background: #589284;
				width: 80px; font-size: 12px; padding-top: 5px; padding-bottom: 5px;
				border: none;
					}
#blabla{
		font-size:8px;
		}
#goMain {
		border-radius: 15px; background: #c0c0c0; color: white;
		width: 80px; font-size: 12px; padding-top: 5px; padding-bottom: 5px;
		border: none;
		}
#signUpBtns{text-align: center;}

th{align: center;}

textarea{width: 400px; height: 150px;}

</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="joinArea">
		<br>
		<h2 align="center">회원가입</h2>
		
		<form action="<%= request.getContextPath() %>/insert.me" method="post" id="joinForm" name="joinForm" onsubmit="return send(this);">
			<table>
				<tr>
					<td width="120px"></td>
					<td width="200px"><label class="must">*</label> 아이디</td>
					<td><input type="text" minlength="4" maxlength="13" id= "joinMemberid" name="joinMemberid" placeholder="6자 이상의 영문+숫자" required></td>
					<td width="200px">
<!-- 						<input type="button" id="idCheck" value="중복확인" onclick="checkId();"> -->
						<label id="idResult"></label>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><label class="must">*</label> 이름</td>
					<td><input type="text" name="joinMembername" required></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><label class="must">*</label> 비밀번호</td>
					<td><input type="password" class="joinPassword" id="joinPassword1" name="joinPassword1" required></td>
					<td rowspan="2"><label id="pwResult"></label></td>
				</tr>
				<tr>
					<td></td>
					<td><label class="must">*</label> 비밀번호 확인</td>
					<td><input type="password" class="joinPassword" id="joinPassword2" name="joinPassword2" required></td>
					<td><span id="equalsPwd"></span></td>
				</tr>
				<tr>
					<td></td>
					<td>연락처</td>
					<td><input type="tel" maxlength="11" name="joinPhone" placeholder="(-없이)01012345678"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>우편번호</td>
					<td><input type="text" id="userPostal" name="joinPostal" readonly></td>
					<td><div><input type="button" id="findPostal" onclick="ifindPostal();" value="검색"></div></td>
				</tr>
				<tr>
					<td></td>
					<td><label class="must">*</label>주소</td>
					<td><input type="text" id="joinAddress1" name="joinAddress1" readonly></td>
					<td><span id="guide" style="color:#999;display:none"></span></td>
				</tr>
				<tr>
					<td></td>
					<td><label class="must">*</label>상세주소</td>
					<td><input type="text" id="joinAddress2" name="joinAddress2"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>이메일</td>
					<td><input type="email" id="joinEmail" name="joinEmail"></td>
					<td width="200px">
<!-- 						<input type="button" id="emCheck" onclick="checkEmail();" value="중복확인"> -->
						<label id="emailResult"></label>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>성별</td>
					<td><input type="radio" id="male" name="gender" value="M">남자</td>
					<td><input type="radio" id="female" name="gender" value="F">여자</td>
				</tr>
				<tr>
					<td></td>
					<td>생년월일</td>
					<td><input type="date" name="joinMemberDate"></td>
					<td></td>
				</tr>
			</table>
			
			<hr>
			
			<table>
				<tr>
					<td width="120px"></td>
					<td width="200px"><label class="must">*</label>이용약관 동의</td>
					<td><input type="radio" id="consent" name="consent" value="consent">전체 동의 합니다.<br>
						<a id="blabla">선택 항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</a></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>
						<textarea name="message" rows="5" cols="30" readonly>
							여러분을 환영합니다.
							레시피 펙토리 서비스 및 제품(이하 '서비스')을 이용해 주셔서 감사합니다.
							본 약관은 다양한 레시피 펙토리 서비스의 이용과 관련하여 레시피 펙토리 서비스를 제공하는 레시피 펙토리 주식회사(이하 '레펙')와 이를 이용하는 레시피 펙토리 서비스 회원(이하 '회원') 또는 비회원과의 관계를 설명하며, 아울러 여러분의 레시피 펙토리 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
						</textarea>
					</td>
				</tr>	
				<tr>
					<td></td>
					<td></td>
					<td><input type="checkbox" id="all" name="receiveInform" value="전체선택" onclick="allcheck();">할인 쿠폰, 혜택 정보 수신 동의 (선택)</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><input type="checkbox" id="sms" name="receiveInform" value="sms" onclick="check();">SMS
					<input type="checkbox" id="email" name="receiveInform" value="email" onclick="check();">E-MAIL</td>
				</tr>
				<tr>
					<td height="50px"></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><input type="checkbox" id="adult" name="adult" value="adult">본인은 만 14세 입니다.(필수)</td>
				</tr>
				<tr>
					<td height="50px"></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			
			<br clear="all">
			
			<div class="btns" id="signUpBtns">
				<input id="signUpBtn" type="submit" value="가입하기">
				<input type="button" id="goMain" onclick="goMain();" value="메인으로">
			</div>
			
		</form>
		
	</div>
	
	
	<script>
	
	function ifindPostal() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('userPostal').value = data.zonecode;
                document.getElementById("joinAddress1").value = roadAddr;
//                 document.getElementById("joinAddress2").value = data.jibunAddress;
				document.getElementById("joinAddress2").value = "";

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if (roadAddr !== '') {
                    document.getElementById("joinAddress1").value += extraRoadAddr;
                } else {
                    document.getElementById("joinAddress1").value += '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
	
	</script>
	
	<script>
	//회원가입 11.아이디 확인
// 	function checkId(){
// 		window.open('checkIdForm.me', 'idCheckForm', 'width=300, height=200');
// 	}
	var isIdUsable = false;// id 중복 시 fals, 사용 가능 시 true
	var isIdChecked = false;// id 중복 확인을 했는지 확인
	
	var isPwChecked = false;// pw 유효성 확인을 했는지 확인
	var isPwEquals = false;// pw 유효성 확인을 했는지 확인
	
	var isEmailUsable = false;// id 중복 시 fals, 사용 가능 시 true
	var isEmailChecked = false;// id 중복 확인을 했는지 확인
	
	$('#joinMemberid').on('change paste keyup', function(){
		isIdChecked = false;
	});
	$('#joinMemberid').change(function(){
		var userId = $('#joinMemberid');
		
		if(userId.val().length < 6){
			$('#idResult').text('아이디는 6자리 이상이어야 합니다.');
			$('#idResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
			isIdUsable = false;
			isIdChecked = false;
		}else{
			$.ajax({
				url: '<%= request.getContextPath() %>/checkId.me',
				data: {userId:userId.val()},
				success: function(data){
					console.log(data);
					if(data == 'success'){
						$('#idResult').text('사용가능합니다.');
						$('#idResult').css({'color':'green', 'float':'left', 'display':'inline-block'});
						isIdUsable = true;
						isIdChecked = true;
					}else{
						$('#idResult').text('이미 사용중인 아이디 입니다.');
						$('#idResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
						isIdUsable = false;
						isIdChecked = false;
					}
				}
			});
		}
	});
	
	$('#joinPassword1').keyup(function(){
		var joinPassword1 = $("#joinPassword1").val();
		var joinPassword2 = $("#joinPassword2").val();
			
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		
		if(joinPassword2.length == 0 || !isPwChecked){
			if(false === reg.test(joinPassword1)) {
				$('#pwResult').text('비밀번호는 8자 이상이어야 하며, 대문자/소문자/숫자/특수문자 모두 포함해야 합니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			}else if(/(\w)\1\1\1/.test(joinPassword1)){
				$('#pwResult').text('같은 문자를 4번 이상 사용하실 수 없습니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			 }else if(joinPassword1.search(/\s/) != -1){
				$('#pwResult').text('비밀번호는 공백 없이 입력해주세요.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			 }else if(hangulcheck.test(joinPassword1)){
				$('#pwResult').text('비밀번호에 한글을 사용할 수 없습니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			 }else {
				$('#pwResult').text('비밀번호가 동일하지 않습니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = true;
			 }
		}else{
			if(false === reg.test(joinPassword2)) {
				$('#pwResult').text('비밀번호는 8자 이상이어야 하며, 대문자/소문자/숫자/특수문자 모두 포함해야 합니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			}else if(/(\w)\1\1\1/.test(joinPassword2)){
				$('#pwResult').text('같은 문자를 4번 이상 사용하실 수 없습니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			 }else if(joinPassword2.search(/\s/) != -1){
				$('#pwResult').text('비밀번호는 공백 없이 입력해주세요.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			 }else if(hangulcheck.test(joinPassword2)){
				$('#pwResult').text('비밀번호에 한글을 사용할 수 없습니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			}else if(joinPassword1 != joinPassword2){
				$('#pwResult').text('비밀번호가 동일하지 않습니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = true;
				isPwEquals = false;
			}else{
				$('#pwResult').text('비밀번호가 사용가능합니다.');
				$('#pwResult').css({'color':'green', 'float':'left', 'display':'inline-block'});
				isPwChecked = true;
				isPwEquals = true;
			}
		}
	});
	$('#joinPassword2').keyup(function(){
		var joinPassword1 = $("#joinPassword1").val();
		var joinPassword2 = $("#joinPassword2").val();
			
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if(joinPassword1.length == 0 || !isPwChecked){
			if(false === reg.test(joinPassword2)) {
				$('#pwResult').text('비밀번호는 8자 이상이어야 하며, 대문자/소문자/숫자/특수문자 모두 포함해야 합니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			}else if(/(\w)\1\1\1/.test(joinPassword2)){
				$('#pwResult').text('같은 문자를 4번 이상 사용하실 수 없습니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			 }else if(joinPassword2.search(/\s/) != -1){
				$('#pwResult').text('비밀번호는 공백 없이 입력해주세요.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			 }else if(hangulcheck.test(joinPassword2)){
				$('#pwResult').text('비밀번호에 한글을 사용할 수 없습니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			 }else {
				$('#pwResult').text('비밀번호가 동일하지 않습니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = true;
			 }
		}else{
			if(false === reg.test(joinPassword1)) {
				$('#pwResult').text('비밀번호는 8자 이상이어야 하며, 대문자/소문자/숫자/특수문자 모두 포함해야 합니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			}else if(/(\w)\1\1\1/.test(joinPassword1)){
				$('#pwResult').text('같은 문자를 4번 이상 사용하실 수 없습니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			}else if(joinPassword1.search(/\s/) != -1){
				$('#pwResult').text('비밀번호는 공백 없이 입력해주세요.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			}else if(hangulcheck.test(joinPassword1)){
				$('#pwResult').text('비밀번호에 한글을 사용할 수 없습니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = false;
			}else if(joinPassword1 != joinPassword2){
				$('#pwResult').text('비밀번호가 동일하지 않습니다.');
				$('#pwResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
				isPwChecked = true;
				isPwEquals = false;
			}else{
				$('#pwResult').text('비밀번호가 사용가능합니다.');
				$('#pwResult').css({'color':'green', 'float':'left', 'display':'inline-block'});
				isPwChecked = true;
				isPwEquals = true;
			}
		}
	});
	
	//회원가입 22.이메일 체크
// 	function checkEmail(){
// 		window.open('checkEmailForm.me', 'emCheckForm', 'width=300, height=200');
// 	}
	
	$('#joinEmail').on('change paste keyup', function(){
			isIdChecked = false;
		});
		$('#joinEmail').change(function(){
			var joinEmail = $('#joinEmail');
			
			$.ajax({
				url: '<%= request.getContextPath() %>/checkEmail.me',
				data: {inputEmail:joinEmail.val()},
				success: function(data){
					console.log(data);
					if(data == 'success'){
						$('#emailResult').text('사용가능합니다.');
						$('#emailResult').css({'color':'green', 'float':'left', 'display':'inline-block'});
						isEmailUsable = true;
						isEmailChecked = true;
					}else{
						$('#emailResult').text('사용 불가능합니다.');
						$('#emailResult').css({'color':'red', 'float':'left', 'display':'inline-block'});
						isEmailUsable = false;
						isEmailChecked = false;
					}
				}
			});
		});
	
	
	//가입하기 버튼 눌렀을 때 기능
// 	function membership() {
// 		var joinMemberid = document.getElementById("joinMemberid").value;
// 		var joinPassword1 = document.getElementById("joinPassword1").value;
// 		var joinPassword2 = document.getElementById("joinPassword2").value;
// 		var joinMembername = document.getElementById("joinMembername").value;
// 		var joinPhone = document.getElementById("joinPhone").value;
// 		var joinAddress1 = document.getElementById("joinAddress1").value;
		
// 		if(joinMemberid == "" || joinMemberid.length == 0){
// 			alert("아이디를 입력해주세요.");
// 			document.getElementById("joinMemberid").focus();
// 			return false;
// 		} else if(joinPassword1 == "" || joinPassword1.length == 0){
// 			alert("비밀번호를 입력해주세요.");
// 			document.getElementById("joinPassword1").focus();
// 			return false;
// 		} else if(joinPassword2 == "" || joinPassword2.length == 0){
// 			alert("비밀번호 확인을 입력해주세요.");
// 			document.getElementById("joinPassword2").focus();
// 			return false;
// 		} else if(joinMembername == "" || joinMembername.length == 0){
// 			alert("이름를 입력해주세요.");
// 			document.getElementById("joinMembername").focus();
// 			return false;
// 		} else if(joinPassword1 != joinPassword2){
// 			alert("비밀번호가 일치하지 않습니다.");
// 			document.getElementByID("joinPassword2").value = "";
// 			document.getElementById("joinPassword2").focus();
// 			return false;
// 		} else if(joinPhone == "" || joinPhone.length == 0){
// 			alert("휴대폰 번호를 입력해주세요.");
// 			document.getElementById("joinPhone").focus();
// 			return false;
// 		} else if(joinAddress1 == "" || joinAddress1.length == 0){
// 			alert("주소를 입력해주세요.");
// 			document.getElementById("joinAddress1").focus();
// 			return false;
// 		} else {
// 			alert(joinMemberid + "님, 회원가입이 성공적으로 완료되었습니다. ^^");
// 		}
		
// 	}
	
// 	//전체 체크
// 	function allcheck(){
// 		var receiveInform = document.getElementsByName("receiveInform");
// 		var checkItem="";
// 		for(var i=0; i<receiveInform.length; i++){
// 			if(receiveInform[0].checked == true){
// 				receiveInform[i].checked = true;
// 			} else {
// 				receiveInform[i].checked = false;
// 			}
// 		}
// 	}
	function send(form) {
		var joinMemberid = document.getElementById("joinMemberid").value;
		var joinPassword1 = document.getElementById("joinPassword1").value;
		var joinPassword2 = document.getElementById("joinPassword2").value;
		var joinMembername = document.getElementById("joinMembername").value;
		var joinPhone = document.getElementById("joinPhone").value;
		var joinAddress1 = document.getElementById("joinAddress1").value;
		
		if(joinMemberid == "" || joinMemberid.length == 0){
			alert("아이디를 입력해주세요.");
			document.getElementById("joinMemberid").focus();
			return false;
		} else if(joinPassword1 == "" || joinPassword1.length == 0){
			alert("비밀번호를 입력해주세요.");
			document.getElementById("joinPassword1").focus();
			return false;
		} else if(joinPassword2 == "" || joinPassword2.length == 0){
			alert("비밀번호 확인을 입력해주세요.");
			document.getElementById("joinPassword2").focus();
			return false;
		} else if(joinMembername == "" || joinMembername.length == 0){
			alert("이름를 입력해주세요.");
			document.getElementById("joinMembername").focus();
			return false;
		} else if(joinPassword1 != joinPassword2){
			alert("비밀번호가 일치하지 않습니다.");
			document.getElementByID("joinPassword2").value = "";
			document.getElementById("joinPassword2").focus();
			return false;
		} else if(joinPhone == "" || joinPhone.length == 0){
			alert("휴대폰 번호를 입력해주세요.");
			document.getElementById("joinPhone").focus();
			return false;
		} else if(joinAddress1 == "" || joinAddress1.length == 0){
			alert("주소를 입력해주세요.");
			document.getElementById("joinAddress1").focus();
			return false;
		} else {
			if(isIdUsable && isIdChecked){
				if(isEmailUsable && isEmailChecked){
					if(isPwChecked){
						if(isPwEquals){
							return true;
						}else{
							alert("패스워트가 동일하진 않습니다.")
							return false;
						}
					}else{
						alert("패스워드가 유효하지 않습니다.")
						return false;
					}
				}else{
					alert("이메일 중복확인을 해주세요.")
					return false;
				}
			}else{
				alert('아이디 중복확인을 해주세요.');
				return false;
			}
		}
	}
	
	//체크 기능
	function check(){
		var receiveInform = document.getElementsByName("receiveInform");
		var checkItem=""
		for(var i = 0; i<receiveInform.length; i++){
			if(receiveInform[i].checked == false){
				checkItem = false;
			}
		}
		receiveInform[0].checked = checkItem;
	}
	
	function memberSignUp(){
		
	}
	
	</script>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>