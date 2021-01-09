<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/html" href="<%= request.getContextPath() %>/css/frame.css">
<style>
 html, body {height: 100%; margin: 0; padding: 0;}

.frame{
	width: 1000px;
	margin: auto;
}

/* 	header */
.top_banner{
	display: inline-block;
	vertical-align: middle;
	width: 100%; height: 45px;
	background-color: #589284; color: white;
	border: none;
	font-family: "나눔고딕";
	text-align: center;
}

.top_logo_area{
	display: inline-block;
	width: 158px;
	height: 77px;
	margin-left: 421px;
	margin-top: 10px;
}

#top_logo{
	width: 158px;
	height: 77px;
}

a{
	color: gray;
	text-decoration: none;
}

.top_menu{
	margin-top: 10px;
	float: right;
	width: 300px;
	height: 12px;
	top: 70px;
	font-family: "나눔고딕"; 
	font-size: 12px;
	font-weight: bold;
	word-spacing: 10px;
}

.top_menu_btn{
	padding: 1px;
	border: 0;
	font-family: "나눔고딕"; 
	font-size: 11.5px;
	font-weight: bold;
	color: gray; background-color: white;
}

/* nav */
#category{
	display: inline-block;
	width: 650px;
	height: 18px;
	
	font-family: "나눔고딕";
	font-weight: bold;
	font-size: 17px;
}

li{
	list-style: none;
	float: left;
	margin-left: 0px;
	margin-right:50px;
}

#search{
	float: right;
	width: 301px;
	height: 44px;
	background-color: #F5F5F5;
	border-radius: 22px
}
</style>
</head>
<body>
	<header>
		<div class="top_banner">상단배너영역</div>
		<div class="frame top_area">
			<div class="top_logo_area">
				<a href="<%= request.getContextPath() %>">
					<img id="top_logo" src="./images/logo1.png">
				</a>
			</div>
			<div class="top_menu">
				<% if(loginUser == null) { %>
					<input type="button" class="top_menu_btn" id="loginBtn" value="로그인" onclick="memberLogin();">
					<input type="button" class="top_menu_btn" id="signBtn" value="회원가입" onclick="memberSignUp();">
					<input type="button" class="top_menu_btn" id="cartBtn" value="장바구니" onclick="onlyMember();">
					<input type="button" class="top_menu_btn" id="orderBtn" value="주문조회" onclick="onlyMember();">
				<% }else{ %>
					<input type="button" class="top_menu_btn" id="logoutBtn" value="로그아웃" onclick="logout()">
					<input type="button" class="top_menu_btn" id="myPageBtn" value="마이페이지" onclick="location.href='<%= request.getContextPath() %>/myPage.me'">
					<input type="button" class="top_menu_btn" id="cartBtn" value="장바구니" onclick="memberCart();">
					<input type="button" class="top_menu_btn" id="orderBtn" value="주문조회" onclick="location.href='<%= request.getContextPath() %>/orderList.me'">
				<% } %>
		    </div>
		</div>
	</header>
	<nav>
		<div class="frame nav-area">
			<div id="category">
	        	<ul>
	            	<li><a href="<%= request.getContextPath() %>">전체 카테고리</a></li>
	                <li><a href="<%= request.getContextPath() %>">레팩 레시피</a></li>
	                <li><a href="<%= request.getContextPath() %>">식재료 마켓</a></li>
	                <li><a href="<%= request.getContextPath() %>">회원 레시피</a></li>
	               
	               
	            </ul>
			</div>
			<!-- 검색창 -->
			<div id="search"></div>
		</div>
	</nav>
	<script>
		function memberLogin(){
			location.href="<%= request.getContextPath() %>/loginform.me";
		}
		
		function memberSignUp(){
		      location.href='<%=request.getContextPath() %>/signUpForm.me';
		}
		function logout(){
		      location.href='<%=request.getContextPath() %>/logout.me';
		}
		
		function onlyMember(){
			alert('회원만 이용이 가능합니다. 로그인 후 이용해주세요');
		}
		
		function memberCart(){
			 location.href='<%=request.getContextPath() %>/cart.me';
		}
	</script>
</body>
</html>