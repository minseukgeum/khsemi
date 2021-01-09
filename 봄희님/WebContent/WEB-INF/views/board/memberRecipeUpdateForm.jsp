<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*" %>
<% 
	Board board = (Board)request.getAttribute("board"); 
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	Attachment titleImg = fileList.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#titleImg{background-color: lightgray;}
	#updateBtn, #cancelBtn{background: lightgray; border-radius: 10px; color: white; width: 80px; height: 25px; display: inline-block; margin-bottom: 20px;}
	#updateBtn:hover, #cancelBtn:hover{cursor: pointer;}
	#cancelBtn{background: gray;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer" align="center">
		<br>
		<h2>나만의 레시피를 소개해보세요!</h2>
		
		<!-- 파일업로드를 위해 enctype(인코딩타입)을 지정해줘야 된다. -->
		<form action="<%= request.getContextPath() %>/update.memberR" method="post" encType="multipart/form-data"><!-- 파일올리는 거기 때문에 -->
			<div class="insertArea">
				<table id="insertThumbTable">
					<tr>
						<th width="100px">레시피 이름<input type="hidden" name="bId" value="<%= board.getBoardId() %>"></th>
						<td><input type="text" size="50" name="title" value="<%= board.getBoardTitle() %>"></td>
					</tr>
					<tr>
						<th>대표 이미지</th>
						<td>
							<div id="titleImgArea">
								<img id="titleImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= titleImg.getChangeName() %>">
							</div>
							<input type="hidden" name="fId" value="<%= titleImg.getFileId()%>">
							<input type="hidden" name="oldFileName" value="<%= titleImg.getChangeName() %>">
						</td>
					</tr>
					<tr>
						<th>내용 사진</th>
						<td>
							<div id="contentImgArea">
								<img id="contentImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(1).getChangeName() %>"> 
							</div>
							<input type="hidden" name="fId" value="<%= fileList.get(1).getFileId() %>">
							<input type="hidden" name="oldFileName" value="<%= fileList.get(1).getChangeName() %>">
							
						</td>
					</tr>
					<tr>
						<th width="100px">사진 메모</th>
						<td colspan="3"><textarea name="content" rows="20" cols="108" style="resize:none;"><%= board.getBoardContent() %></textarea>
					</tr>
				</table>
				
				<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
				</div>
				<script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function(){
						$("#fileArea").hide();
						
						$("#titleImgArea").click(function(){
							$("#thumbnailImg1").click();
						});
						$("#contentImgArea").click(function(){
							$("#thumbnailImg2").click();
						});
					});
					
					// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								case 2:
									$("#contentImg").attr("src", e.target.result);
									break;
								}
							}
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
				
			</div>
			<br>
			<div class="btnArea" align="center">
				<input type="submit" id="updateBtn" value="작성완료">
				<input type="button" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.memberR'" value="취소하기">
			</div>
		</form>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	

</body>
</html>