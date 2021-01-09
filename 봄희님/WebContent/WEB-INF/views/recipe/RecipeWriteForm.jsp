<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/recipe.css">
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<section>
		<div class="frame section-area">
			<form>
				<div class="input-area">
					<div class="input-file">
						<button class="input-file-button">사진</button>
						<button class="input-file-button">동영상</button>
					</div>
					<input type="text" placeholder="제목" class="title"><br>
					<input type="text" placeholder="분류" class="category">
					<input type="text" placeholder="용량" class="title"><br>
					<div class="note-editing-area">
						<textarea class="note-codable" role="textbox" aria-multiline="true"></textarea>
						<div class="note-editable" contenteditable="true" role="textbox"
							aria-multiline="true" spellcheck="true">
							<p>
								<br>
							</p>
						</div>
					</div>
					<div class="button-area">
						<input type="button" value="취소" class="button" id="cancel">
						<input type="submit" value="레시피 만들기" class="button" id="submit">
					</div>
				</div>
			</form>
		</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>