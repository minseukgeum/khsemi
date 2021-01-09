<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, board.model.vo.Manager_recipe, board.model.vo.PageInfo" %>
<%
	ArrayList<Manager_recipe> manaRList = (ArrayList<Manager_recipe>)request.getAttribute("manaRList");
	
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
<title>레시피 만들기</title>
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
	
	<div class="managerRecipeArea">
	
		<div class="topRecipe">
			<h2>인기 레시피</h2>
				<div class="reipe-list" align="center">
				
				</div>
		</div>
		
		<br><br><br>
		
		<div class="refacRecipe">
			<h2>레펙 레시피</h2>
			<% if(manaRList.isEmpty()) { %>
				등록된 레시피가 없습니다.
			<% } else { %>
				<% for (int i = 0; i < manaRList.size(); i++) { %>
					<% Manager_recipe mRList = manaRList.get(i); %>
					<div class="recipe-list" align="center">
						<div>
							<input type="hidden" value="<%= mRList.getM_R_No() %>">
							<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= mRList.getM_R_Exp() %>" width="200px" height="150px">
					
						</div>
					<p>
							No. <%= mRList.getM_R_No() %> <%= mRList.getM_R_Title() %>
					</p>
				<% } %>
				</div>	
			<% } %>	
		</div>
	
		<div class="buttonArea">
			<%-- <% if(loginUser != null && loginUser.getMemberid().equals("admin")) { %> --%>
				<input type="button" onclick="location.href='writManagerRecipeForm.th'" id="insertBtn" value="작성하기">
			<%-- <% } %> --%>
		</div>
	
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>