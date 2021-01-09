<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cart.model.vo.*"%>
<% 
	String chk = (String)request.getAttribute("chk"); 
	Address add = (Address)request.getAttribute("add");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width: 80%; min-height: 500px; border: 5px solid #DDEFBB;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	
	
	.loginUserTable{
		width: 40%; min-height: 300px; border: 1px solid #DDEFBB;
		margin-top: 50px; float:left; margin-left: 100px;  
	}
	.AddressTable{
		display : inline-block; width:40%; min-height: 300px; border: 1px solid #DDEFBB;
		margin-top: 50px; margin-left: 50px;   margin-rignt:auto;  
	}
	
	
	table {font-size: 10pt; text-align:center;}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<br><br><br><br>


	<div class="outer">
	
		
		<div>
			만약 새주소 입력한다면 그걸address 테이블에 저장한다. 아니면 그냥 기존 주소 사용하기 <br>
			체크된 cart_no <%= chk %>
		</div>
	
	
<%-- 			<form action="<%= request.getContextPath() %>/addressInsert.me" method="post" id="AddressUpdate" name="AddressUpdate"> --%>
	
		<p>배송지를 선택해주세요</p>
		<div class="loginUserTable">
		<h4 align="center">기본 배송지(회원 가입 시 입력한 주소)</h4>
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="myName" value="<%= loginUser.getMembername() %>" required></td>
				</tr>	
				<tr>
					<td>아이디</td>
					<td><input type="text" name="myId" style="background:lightgray;" readonly value="<%= loginUser.getMemberid() %>"></td>
				</tr>				
				<tr>
					<td>수령인</td>
					<td><input type="text" name="receiver" value="<%= loginUser.getMembername() %>" required></td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
				<td><input type="text" maxlength="11" name="myPhone" placeholder="(-없이)01012345678" value="<%= loginUser.getPhone() == null ? " - " : loginUser.getPhone() %>"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" id="userPostal" name="myPostal"  value="<%= loginUser.getPostal() %>"readonly></td>
					<td><input type="button" id="findPostal" onclick="ifindPostal();" value="검색"></td>
				</tr>
				<tr>
					<td>주소</td>
					<%-- <td><input type="text" size="40" id="myAddress1" name="myAddress1"  value="<%= loginUser.getAddress1()%>" readonly></td> --%>
					<td><textarea cols="20px" rows="3px" style="resize: none;" readonly><%= loginUser.getAddress1()%></textarea></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" id="myAddress2" name="myAddress2"  value="<%= loginUser.getAddress2()%>"></td>
					<td></td>
			</table>
			<br>
		</div>
		
		
		
		
		
		
		<div class="AddressTable">
			<h4 align="center">최근 사용한 배송지 (추가하는 배송지)</h4>
				<table>
					<tr>
						<td>이름</td>
						<td><input type="text" name="myName" value="<%= add.getAddress_name() %>" required></td>
					</tr>	
					<tr>
						<td>아이디</td>
						<td><input type="text" name="myId" style="background:lightgray;" readonly value="<%= add.getMemberid() %>"></td>
					</tr>				
					<tr>
						<td>수령인</td>
						<td><input type="text" name="receiver" value="<%= add.getReceiver() %>" required></td>
					</tr>
					<tr>
						<td>휴대폰 번호</td>
						<td><input type="text" maxlength="11" name="myPhone" placeholder="(-없이)01012345678" value="<%= add.getRe_phone() == null ? " - " : add.getRe_phone() %>"></td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td><input type="text" id="userPostal" name="myPostal"  value="<%= add.getPostal() %>"readonly></td>
						<td><input type="button" id="findPostal" onclick="ifindPostal();" value="검색"></td>
					</tr>
					<tr>
						<td>주소</td>
						<%-- <td><input type="text" size="40" id="myAddress1" name="myAddress1"  value="<%= add.getAddress1()%>" readonly></td> --%>
						<td><textarea cols="20px" rows="3px" style="resize: none;" readonly><%= add.getAddress1()%></textarea></td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td><input type="text" id="myAddress2" name="myAddress2"  value="<%= add.getAddress2()%>"></td>
						<td></td>
				</table>
		</div>
		
		
		
		
		
		
		
		
		
		
	</div><!-- outer마지맘ㄱ -->
	
	
	
	<br><br><br><br>
	<%@ include file="../common/footer.jsp" %>
	
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
	

</body>
</html>