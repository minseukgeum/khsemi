<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 html, body {height: 100%; margin: 0; padding: 0;}

.frame{
	width: 1000px;
	margin: auto;
}


/* 	section */
.section-area{
	margin-top: 20px;
	margin-bottom: 50px;
	align: center;
}

#main_slider{
	display: inline-block;
	width: 100%;
	height: 450px;
	background: #EAEAEA;
	margin-top: 20px;
}

#product_name1{font-family: "나눔고딕"; font-weight: bold; font-size: 20px; margin: 10px;}
	
.thumbnailArea {width:760px; height:550px; margin-left:auto; margin-right:auto;}	
	

/* 	footer */
footer{
	width: 100%;
	height: 250px;
	background-color: #589284; color: white;
	padding-top: 30px;
}
#bottom_logo{
	display: inline-block;
	width: 346px;
	height: 77px;
}

#notice{
	display: inline-block;
	width: 800px;
	color: white;
	font-family: NanumGothic;
	font-size: 12px;
	line-height: 18px;
	letter-spacing: 1px;
}
.bottom_button{
	float: right;
}
.sq{
	width: 150px; height: 50px;
	border: 1px solid white;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	color: white;
}

#sq_notice{
	font-family: NanumGothic;
	font-size: 13px;
	letter-spacing: 1px;
}

#sq_qna{
	font-family: NanumGothic;
	font-size: 13px;
	letter-spacing: 1px;
}

#sq_de_qna{
	font-family: NanumGothic;
	font-size: 13px;
	letter-spacing: 1px;
}

.managerRecipeArea{
			width: 48%; height: 900px;
			margin-left: 300px; margin-right: 100px; margin-top: 150px; margin-bottom: 50px;
			font-size: 12px;
		}


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="write" align="center">
		<br><br><br><br>
		<h2 align="center">레펙 레시피 만들기 보글보글</h2>
		
		<form action="<%= request.getContextPath() %>/insertMemberRecipe.th" method="post" encType="multipart/form-data">
			<div class="insertArea">
				<table id="insertManagerRecipe">
				<br><br>
					<tr>
						<th width="200px">레시피 제목</th>
						<td colspan="3"><input type="text" size="45" name="title"></td>
					</tr>
					<tr>
						<th>레시피 설명<br>(이미지 첨부)</th>
						<th>
							<div id="fileArea">
								<input type="file" id="mangerRecipeImg" multiple="multiple" name="mangerRecipeImg" onchange="LoadImg(this,1)">
								<script>
									function LoadImg(value, num){
										if(value.files && value.files[0]){
											var reader = new FileReader();
											
											reader.onload = function(e){
												switch(num){
												case 1:
													$("recipeImg").attr("src", e.target.result);
													break;
												}
											}
											reader.readAsDateUrl(value.files[0]);
										}
									}
								</script>
							</div>
						</th>
					</tr>
					<tr>
						<th>레시피 용량</th>
						<td><input type="text" size="10" name="cap"></td>
					</tr>
					<tr>
						<th>레시피 가격</th>
						<td><input type="text" size="10" name="cap">원</td>
					</tr>
					<tr>
						<th>레시피 원산지</th>
						<td><input type="text" size="10" name="cap"></td>
					</tr>
					<tr>
						<th>미리보기</th>
						<th colspan="3">
							<div id="recipeImgArea">
								<img id="recipeImg" width="350" height="350">
							</div>
						</th>
					</tr>
				</table>
			</div>
			
			<br><br><br>
			
			<div class="btnArea">
				<input type="submit" id="insertBtn" value="작성완료">
				<input type="button" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.managerR'" value="취소하기">
			</div>
			<br><br><br>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	

</body>
</html>