<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.*"%>
<%
   Board b = (Board)request.getAttribute("board");
   ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
   Attachment titleImg = fileList.get(0);
   ArrayList<Reply> list = (ArrayList)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer {
      width: 100%; min-height:auto; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
      margin-left:auto; margin-right:auto; margin-top:50px; align: center;
   }
   .detail{text-align:left;}
   .detail td{width: 600px; background: rgba(255, 255, 255, 0.4); font-family: "나눔스퀘어"; font-size: 15px;}
   .detail th{width: 100px; background: rgba(255, 255, 255, 0.4); font-family: "나눔스퀘어"; font-size: 15px; color:gray;}
   .detail th{background: white;}
   #titleImgArea{width:400px; height:500px; margin-left:auto; margin-right:auto;}
   #titleImg{width:350px; height:450px;}
   #contentArea{width: 300px; height:200px; border: none; font-family: "나눔스퀘어"; font-size: 15px; color:gray; resize: none; text-align: left;}
   .detailImgArea{width:833px; height:auto; margin-left:auto; margin-right:auto; margin-top: 50px; margin-bottom: 50px;}
   .detailImg{width:833px; height:auto; align:center;}
   .downBtn{background: #D1B2FF;}
   #thumbTable{margin: auto;}
   #title{font-family: "나눔스퀘어"; font-size: 25px; color: #3c3c3c; font-weight: bold;}
   hr {width: 833px; align: center; margin-top:50px;}
   .replyArea{margin-bottom: 20px;}
</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
   <div class="outer">
   <form action="<%= request.getContextPath() %>/boardUpdateForm.memberR" id="detailForm" method="post">
      <table class="detail" id="thumbTable">
         <tr>
            <td rowspan="5">
               <div id="titldImgArea" align="center">
                  <img id="titleImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= titleImg.getChangeName() %>">
               </div>
            </td>
            <th colspan="2" id="title">[<%= b.getBoardTitle() %>]</th>
         </tr>
         <tr>
            <th>작성자</th>
            <td>
            	<%= b.getBoardWriter() %>
            	<input type="hidden" name="bId" value="<%= b.getBoardId() %>">
            </td>
         </tr>
         <tr>
            <th>작성일</th>
            <td><%= b.getCreateDate() %></td>
         </tr>
         <tr>
            <th>레시피<br>소　개</th>
            <td colspan="6">
               <textarea id="contentArea" readonly>
                  <%= b.getBoardContent() %>
               </textarea>
            </td>
         </tr>
      </table>
      <br><br>
      <div align="center">
            <%-- 글 쓴 사람만 볼 수 있도록~! --%>
            <% if(loginUser != null && loginUser.getMemberid().equals(b.getBoardWriter())) { %>
               <input type="submit" id="updateBtn" value="수정">
               <input type="button" onclick="deleteBoard();" id="deleteBtn" value="삭제" >
            <% } %>   
            
               <input type="button" onclick="location.href='<%= request.getContextPath() %>/list.memberR'" id="menuBtn" value="메뉴로">
            </div>
         </form>
      <hr>
         <% for(int i = 1; i < fileList.size(); i++){ %>
               <div class="detailImgArea">
                  <img id="detailImg" class="detailImg" 
                     src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(i).getChangeName() %>">
               </div>
         <% }  %>
      </div>
      
      <div class="replyArea" align="center">
         <div class="replyWriterArea">
            <table>
               <tr>
                  <td>댓글작성</td>
                  <td><textarea rows="3" cols="80" id="replyContent" style="resize: none;"></textarea></td>
                  <td><button id="addReply">댓글등록</button></td>
               </tr>
            </table>
         </div>
         <div id="replySelectArea">
            <table id="replySelectTable">
               <% if(list.isEmpty()) { %>
                  <tr><td colspan="3">댓글이 없습니다.</td></tr>
               <% } else { %>
                  <% for(int i = 0; i < list.size(); i++) { %>
                     <tr>
                        <td width="100px"><%= list.get(i).getReplyWriter() %></td>
                        <td width="400px"><%= list.get(i).getReplyContent() %></td>
                        <td width="200px"><%= list.get(i).getCreateDate() %></td>
                        <td>
                        <% if(loginUser != null && loginUser.getMemberid().equals(list.get(i).getReplyWriter())) { %>
            			   <!-- <input type="button" onclick="replyUpdate();" id="replyUpdateBtn" value="수정"> -->
              			   <input type="button" onclick="replyDelete(<%= list.get(i).getrId() %>);" id="replyDeleteBtn" value="삭제">
              			   <input type="hidden" name="rId" value="<%= list.get(i).getrId() %>">
          			    <% } %>
          			    </td> 
                     </tr>
                  <% } %>
               <% } %>
            </table>
         </div>
      </div>
      </p>
      
      <%@ include file="../common/footer.jsp" %>
      
      <script>
      	function deleteBoard(){
      		var bool = confirm('정말 삭제하시겠습니까?');
      		
      		if(bool){
      			location.href='deleteBoard.memberR?bId=<%= b.getBoardId() %>';
      		}
      	}
      	
      	function replyDelete(rId){
      		var bool = confirm('정말 삭제하시겠습니까?');
      		
      		if(bool){
      			location.href='deleteReply.memberR?rId=' + rId;
      		}
      	}
      	
      	$('#addReply').click(function(){
      		var writer = '<%= loginUser.getMemberid() %>';
      		var bId = <%= b.getBoardId() %>;
      		var content = $('#replyContent').val();
      		
      		$.ajax({
      			url: 'insertReply.bo',
      			data: {writer:writer, bId:bId, content:content},
      			success: function(data){
      				console.log(data);
      				
      				$replyTable = $('#replySelectTable');
      				$replyTable.html('');
      				
      				for(var key in data){
      					var $tr = $('<tr>');
      					var $writerTd = $("<td>").text(data[key].replyWriter).css('width', '100px');
      					var $contentTd = $("<td>").text(data[key].replyContent).css('width', '400px');
      					var $dateTd = $("<td>").text(data[key].createDate).css('width', '200px');
      					
      					$tr.append($writerTd);
      					$tr.append($contentTd);
      					$tr.append($dateTd);
      					$replyTable.append($tr);
      				}
      				
      				$('#replyContent').val('');
      			}
      		});
      	});
      </script>
         
   
</body>
</html>