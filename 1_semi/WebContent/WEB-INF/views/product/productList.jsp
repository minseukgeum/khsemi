<%@page import="product.model.vo.Attachment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, product.model.vo.Product, product.model.vo.PageInfo"%>
<%
	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("list");
	ArrayList<Attachment> fList = (ArrayList<Attachment>)request.getAttribute("fList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.outer{
		width: 800px; height: 500px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	#listArea{text-align: center;}
	.tableArea{width:650px;	height:350px; margin-left:auto;	margin-right:auto;}
	th{border-bottom: 1px solid grey;}
	.pagingArea button{border-radius: 15px; background: #D5D5D5;}
	.buttonArea{margin-right: 50px;}
	.buttonArea button{background: #D1B2FF; border-radius: 5px; color: white; width: 80px; heigth: 25px; text-align: center;}
	button:hover{cursor: pointer;}
	#numBtn{background: #B2CCFF;}
	#choosen{background: #FFD8D8;}
	#listArea{margin: auto;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">상품</h2>
		<div class="thumbnailArea">
			<% if(pList.isEmpty() || fList.isEmpty()){ %>
				상품이 없습니다.
			<% }else{ %>
				<% for(int i = 0; i < pList.size(); i++){ %>
					<% Product p = pList.get(i); %>
					<div class="thumb-list" align="center">
						<div>
							<input type="hidden" value="<%= p.getpId() %>">
							<% for(int j = 0; j < fList.size(); j++){ %>
								<% Attachment a = fList.get(j); %>
								<% if(p.getpId() == a.getpId()){ %>
									<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= a.getChangeName() %>" width="200px" height="150px">
								<% } %>
							<% } %>
						</div>
						<p>
							<%= p.getpName() %> <%= p.getpCapacity() %><br>
							<%= p.getpPrice() %>원
						</p>
					</div>
				<% } %>
			<% } %>
		</div>
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/list.pr?currentPage=1'">&lt;&lt;</button>
			<button onclick="location.href='<%= request.getContextPath() %>/list.pr?currentPage=<%= currentPage - 1 %>'" id="beforeBtn">&lt;</button>
			<script>
				if(<%= currentPage %> <= 1){
					var before = $('#beforeBtn');
					before.attr('disabled', 'true');
				}
			</script>
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button id="choosen" disabled><%= p %></button>
				<% }else{ %>
					<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.pr?currentPage=<%= p %>'"><%= p %></button>
				<% } %>
			<% } %>
			
			<button onclick="location.href='<%= request.getContextPath() %>/list.pr?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
			<script>
				if(<%= currentPage %> >= <%= maxPage %>){
					var after = $('#afterBtn');
					after.attr('disabled', 'true');
				}
			</script>
			<button onclick="location.href='<%= request.getContextPath() %>/list.pr?currentPage=<%= maxPage %>'">&gt;&gt;</button>
		</div>
		
		<div class="buttonArea" align="right">
			<% if(loginUser != null){ %>
			<button onclick="location.href='writeProductForm.pr'">작성하기</button>
			<% } %>		
		</div>
	</div>
	<script>
		$(function(){
			$('.thumb-list').click(function(){
				var pId = $(this).children().children().eq(0).val();
				location.href='<%= request.getContextPath() %>/detail.pr?pId='+ pId;
			});
		});
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>