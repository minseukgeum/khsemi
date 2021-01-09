<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "member.model.vo.Member"%>
<%
	Member myInfo = (Member)request.getAttribute("myInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width: 700px; height: 400px; background-color: rgba(255, 255, 255, 0.4); border: 3px solid #589284;
		margin-left: auto; margin-right: auto; margin-top: 5%;
	}
	#updateForm td {text-align: center;}
	#updateForm>table{margin: auto;}
	#updateBtn {background: #589284; color: white;}
	#cancleBtn {background: #589284; color: white;}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<br><br><br><br><br>
	<div class="outer">
	
		<form action="<%= request.getContextPath() %>/update.me" method="post" id="updateForm" name="updateForm">
			<table>
				<tr>
					<td width="200px" height="50px">아이디</td>
					<td width="200px"><input type="text" name="myId" style="background:lightgray;" readonly value="<%= myInfo.getMemberid() %>"></td>
				</tr>
				<tr>
					<td height="50px">이름</td>
					<td><input type="text" name="myName" value="<%= myInfo.getMembername() %>" required></td>
				</tr>	
				<tr>
					<td height="50px">휴대폰 번호</td>
					<td><input type="text" maxlength="11" name="myPhone" placeholder="(-없이)01012345678" value="<%= myInfo.getPhone() == null ? " - " : myInfo.getPhone() %>"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="myEmail" value="<%= myInfo.getEmail() == null ? "" : myInfo.getEmail() %>"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" id="userPostal" name="myPostal"  value="<%= myInfo.getPostal() %>"readonly></td>
					<td><div><input type="button" id="findPostal" onclick="ifindPostal();" value="검색"></div></td>
				</tr>
				<tr>
					<td><label class="must">*</label>주소</td>
					<td><input type="text" id="myAddress1" name="myAddress1"  value="<%= myInfo.getAddress1()%>" readonly></td>
					<td><span id="guide" style="color:#999;display:none"></span></td>
				</tr>
				<tr>
					<td><label class="must">*</label>상세주소</td>
					<td><input type="text" id="myAddress2" name="myAddress2"  value="<%= myInfo.getAddress2()%>"></td>
					<td></td>
			</table>
			
			<br>
			
			<div class="btns" align="center">
				<input id="updateBtn" type="submit" value="수정하기">
				<input id="cancleBtn" type="button" onclick="location.href='javascript:history.go(-1)'" value="취소하기">
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
                document.getElementById("myAddress1").value = roadAddr;
//                 document.getElementById("myAddress2").value = data.jibunAddress;
				document.getElementById("myAddress2").value = "";

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if (roadAddr !== '') {
                    document.getElementById("myAddress1").value += extraRoadAddr;
                } else {
                    document.getElementById("myAddress1").value += '';
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
	<br><br><br><br><br>	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>