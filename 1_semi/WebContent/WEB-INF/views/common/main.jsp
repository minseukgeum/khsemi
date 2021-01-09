<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 만들기</title>
 <style>


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

 
 </style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
 	<section>
		<div id="main_slider"></div>
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
</body>
</html>