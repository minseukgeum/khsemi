<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cart.model.vo.Cart"%>

<% 
	Cart cart = (Cart)request.getAttribute("cart");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width: 300px; height: 300px; border: 5px solid #DDEFBB;
		margin-left: auto; margin-right: auto; margin-top: 50px;
		
	}
	.Btn{
		background: #DDEFBB; color: gray; border: 1px solid gray; border-radius:20px;	
	}	
	
</style>
</head>
<body>
	
	<form action="<%= request.getContextPath() %>/modify.ca" method="post">
	
		<div class="outer" align="center">
 			<h2>장바구니 상품 수량 수정</h2>
			<input type="hidden" name="cart_no" value="<%= cart.getCart_no() %>">
			현재수량 : <input type="number" size="15" name="amount" value="<%= cart.getAmount()%>"  min="1" max="100">
			
			
			
			<div align="center">
				<button class="Btn" type="submit" id="modifyBtn"  >수정</button>
				<button class="Btn" onclick="window.close();">취소</button>
			</div> 
		</div>
	</form>
	

	

</body>
</html>