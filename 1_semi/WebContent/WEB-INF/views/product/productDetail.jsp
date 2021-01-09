<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.model.vo.*, java.util.*"%>
<%
	Product p = (Product)request.getAttribute("product");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	Attachment titleImg = fileList.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width:1000px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}
	.detail{text-align:center;}
	.detail th, .detail td{width: 1000px; padding: 10px; background: rgba(255, 255, 255, 0.4);}
	.detail th{background: white;}
	#titleImgArea{width:500px; height:300px; margin-left:auto; margin-right:auto;}
	#contentArea{height:30px;}
	.detailImgArea{width:900px; margin-left:auto; margin-right:auto;}
	#titleImg{width:500px; height:300px;}
	.detailImg{width:900px;}
	.downBtn{background: #D1B2FF;}
	#thumbTable{margin: auto;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<table class="detail" id="thumbTable">
			<tr>
				<td rowspan="5">
					<div id="titldImgArea" align="center">
						<img id="titleImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= titleImg.getChangeName() %>">
					</div>
				</td>
			</tr>
			<tr><td><%= p.getpName() %></td></tr>
			<tr><td><%= p.getpOrigin() %></td></tr>
			<tr><td><%= p.getpCapacity() %></td></tr>
			<tr><td><%= p.getpPrice() %>원</td></tr>
			<tr>
				<td colspan="2">
					<p id="contentArea">
						<%= p.getpDescription() %>
					</p>
				</td>
			</tr>
		</table>
		<table class="tab" id="tab_detail">
			<tr>
				<td><a href="#tab_detail">상세페이지</a></td>
				<td><a href="#tab_review">구매후기</a></td>
				<td><a href="#tab_qna">상품질문</a></td>
			</tr>
		</table>
		<table class="detail">
			<% for(int i = 1; i < fileList.size(); i++){ %>
				<tr>
					<td>
						<div class="detailImgArea">
							<img id="detailImg<%= i %>" class="detailImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(i).getChangeName() %>">
						</div>
					</td>
				</tr>
			<% } %>
		</table>
		<table class="tab" id="tab_review">
			<tr>
				<td><a href="#tab_detail">상세페이지</a></td>
				<td><a href="#tab_review">구매후기</a></td>
				<td><a href="#tab_qna">상품질문</a></td>
			</tr>
		</table>
		<div class="review_area">
			
		</div>
		<table class="tab" id="tab_qna">
			<tr>
				<td><a href="#tab_detail">상세페이지</a></td>
				<td><a href="#tab_review">구매후기</a></td>
				<td><a href="#tab_qna">상품질문</a></td>
			</tr>
		</table>
		<div class="qna_area">
			
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>