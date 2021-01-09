<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList, cart.model.vo.Cart" %>    
<% 
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");

	int total = 0;
	for(Cart c : list) { 
		total += c.getCart_price() * c.getAmount(); 
		
	 }
	
	 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.outer{
		width: 1000px; min-height: 600px; border: 2px solid #589284;
		margin-left: auto; margin-right: auto; margin-top: 50px;
		
	}
	.emptyDiv{
		width: 400px; min-height: 200px; 
		margin-left: auto; margin-right: auto; margin-top: 50px;	
		text-align:center;	
	}
	th{border-bottom: 1px solid gray;}

	.tableArea{width:650px; min-height:350px; margin:auto;}
	#listArea{
		text-align: center;
		border-spacing : 10px;
	}
	#allPrice{
		width:600px; min-height: 100px; border : 1px solid #DDEFBB;
	}
	.Btn{
		background: #DDEFBB; color: gray; border: 1px solid gray; border-radius:20px;
	}
	.modifyBtn{background: #DDEFBB; color: gray; border: 1px solid gray; border-radius:20px;}

	
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<br><br><br><br>


	
	<div class="outer">
		<br><br>
		<h2 align="center"><%= loginUser.getMembername() %>님의 장바구니</h2>
		<br><br>
		
		<form action="<%= request.getContextPath() %>/purchaseCart.me" method="post" name="purchaseForm" id="purchaseForm">
			<% if(list.isEmpty()) { %>
			<div class="emptyDiv">
			
				<p><b>장바구니에 담긴 상품이 없습니다.</b></p>
				<p>원하는 상품을 장바구니에 담아보세요!</p>
				<button onclick="location.href='<%= request.getContextPath() %>'">쇼핑 계속하기</button>		
			
			</div>
				
			<% } else { %>
				<div class="tableArea">
				<table id="listArea" align="center">
					<tr>
						<td><input type="checkbox" id="all"></td>
						<td>번호</td>
						<td>상품 코드</td>
						<td>상품 이름</td>
						<td>상품 가격</td>
						<td>개수</td>		
						<td>옵션</td>
					</tr>		
					<% for(Cart c : list) { %>
						<tr>
							<td><input type="checkbox" class="chk" name="chk" value="<%= c.getCart_no()%>"></td>
							<%-- <input type="hidden" name = "cNo" value="<%= c.getCart_no()%>"> --%>
							<td><%= c.getCart_no()%></td>
							<td><%= c.getP_id() %></td>
							<td class="pro"><%= c.getP_name() %></td>
							<td><%= c.getCart_price() %></td>
							<td><%= c.getAmount() %></td>		
							<td><input type="button" class="modifyBtn" value="수량 변경"></td>
						</tr>
					<% } %>		
					
				</table>
				
				
				<br><br><br><br>
				
				<div id="allPrice" align="center">
					<!-- 체크된 값만 숫자 더하기 -->
					<p>장바구니 총액</p>
					<b><%= total %></b>
				</div>
				
				<br><br><br><br>		
				
				<div align="center">
						<button class="Btn" onclick="location.href='<%= request.getContextPath() %>'">쇼핑 계속하기</button>
						<!-- 상품ㅇ페이지 다 되면 쇼핑 계속하기에 상품 넣기 -->
						<button class="Btn" onclick="purchaseCart(); ">구매하기</button>				
						<button class="Btn" onclick="deleteCart(); ">삭제하기</button>				
				</div>
			<br><br><br><br>
			</div>			
			<% } %>
		</form>

	</div>
	
	
	
	<br><br><br><br>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
	
		$("#all").click(function(){
			if($('#all').is(":checked")){
				$(".chk").prop("checked", true);
			} else{
				$(".chk").prop("checked", false);
			}
		});

		$(".chk").click(function(){
			if($("input[name='chk']:checked").length == <%= list.size()%>){
				$("#all").prop("checked", true);
			} else {
				$('#all').prop("checked", false);
			}
		});
		
		
		$('.modifyBtn').click(function(){
			var cart_no = $(this).parent().parent().children().eq(1).text();
			/* window.open('modifyCartForm.me?cart_no='+cart_no, 'cartModify', 'width=400, height=400, left=400, top=500, resizable=yes'); */
			location.href='<%= request.getContextPath() %>/modifyCartForm.me?cart_no='+cart_no;
		}); 
			
		function deleteCart(){
			 
			var checkArr = [];
		    $("input[name='chk']:checked").each(function(i){
		        checkArr.push($(this).val());   
		    });

			location.href = '<%= request.getContextPath() %>/deleteCart.me?checkArr='+checkArr;
		
		}

<%-- 		 
		
		function purchaseCart(){
			var checkArr = [];
		    $("input[name='chk']:checked").each(function(i){
		        checkArr.push($(this).val());   
		    });

			location.href = '<%= request.getContextPath() %>/purchaseCart.me?checkArr='+checkArr;
					
		} --%>
		
		
		
		$(function(){
			$('.pro').mouseenter(function(){
				$(this).parent().children().eq(3).css({'background':'#DDEFBB','cursor':'pointer'});
			 }).mouseout(function(){
				 $(this).parent().children().eq(3).css('background','none');
			 }).click(function(){
				 var p_name = $(this).parent().children().eq(3).text();
				 var cart_no = $(this).parent().children().eq(1).text();
				 console.log(p_name);
				 console.log(cart_no);
				 location.href = '<%= request.getContextPath() %>/detail.no?cart_cart_no='+cart_no;			
			 });	

		 }); 
		
		
		
		

	</script>

	
</body>
</html>