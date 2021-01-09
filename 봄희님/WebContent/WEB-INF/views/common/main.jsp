<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.model.vo.*, java.util.ArrayList" %>
<%
	ArrayList<Banner> bList = (ArrayList<Banner>)request.getAttribute("bList");
	ArrayList<BAttachment> fList = (ArrayList<BAttachment>)request.getAttribute("fList");
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


/* 	section */
.section-area{
	margin-top: 20px;
	margin-bottom: 50px;
	align: center;
}

/* #main_slider{
	display: inline-block;
	width: 100%;
	height: 300px;
	background: #EAEAEA;
	margin-top: 20px;
} */

/* banner */
	.banner {position: relative; width: 1920px; height: 500px; top: 20px;  margin:0 auto; margin-botton: 20px; padding:0; overflow: hidden;}
	.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	.banner ul li {float: left; width: 1920px; height: 500px; margin:0; padding:0;}

#product_name1{font-family: "나눔고딕"; font-weight: bold; font-size: 20px; margin: 50px;}
	
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

 
 </style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script language="JavaScript">

	$(document).ready(function() {
		var $banner = $(".banner").find("ul");

		var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $length = $banner.children().length;//이미지의 갯수
		var rollingId;

		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}
	}); 
 
</script>
</head>
<body>
	<%@ include file="menubar.jsp" %>
	
 	<section>
		<div>
		<div id="main_slider">
		<div class="banner">
			<ul>
				<% for(int i = 0; i < fList.size(); i++){ %>
				<%	BAttachment a = fList.get(i); %>
				<li><img src="<%= request.getContextPath()%>/main_uploadFiles/<%= a.getChangeName() %>" width="1920px" height="500px"></li>
				<% } %>
			</ul>
		</div>
		
			<div>

				
			</div>
		</div>
	</div>
					
			<p id="topRecipeList">
	 		<div class="section-area">
	
	 		<!-- 레팩 레시피 갤러리 -->
	 		<div id="product_name1" align="center">도전! 오늘의 레팩 레시피</div>
				<div class="thumbnailArea" align="center">
				등록된 사진이 없습니다.
				<div class="thumb-list" align="center">
					<div></div>
					<p></p>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>
	<script>
		function memberSignUp(){
		      location.href='<%=request.getContextPath() %>/signUpForm.me';
		}
	</script>
	
	<script>
		function memberLogin(){
			location.href="<%= request.getContextPath() %>/loginform.me";
		}
		
		function memberSignUp(){
		      location.href='<%=request.getContextPath() %>/signUpForm.me';
		}
		

	</script>
</body>
</html>