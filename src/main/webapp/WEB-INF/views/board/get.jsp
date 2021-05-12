<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h1 class="text-primary text-center">상세보기</h1>
	<br><br>
		글번호 : <input class="form-control" type="text" id="bnoo" name="bno" readonly><br><hr>
		제목	 : <input class="form-control" type="text" id="title" name="title" readonly><br><hr>
		내용	 : <input class="form-control" type="text" name="content" id="content" readonly><br><hr>
		작성자 : <input class="form-control" type="text" name="writer" id="writer" readonly><br><hr>
		작성일자: <input class="form-control" type="text" name="regdate" id="regdate" readonly><br><hr>
		<div id="get"></div>
		
		
	<a href="/board/list">
	<input type="button" class="btn btn-primary float-right" id="listBack" value="목록">
	</a>
	<input type="button" class="btn btn-warning float-right" id="modifyBtn" value="수정">
	<input type="button" class="btn btn-danger float-right" id="deleteBtn" value="삭제">
	</div>

<script type="text/javascript">

	$(document).ready(function(){
		
		var para = document.location.href.split("="); 
		
		var bno = para[1]
		
		var str = "";
		
		$.ajax({
			
			type : 'get',
			url : '/board/get/' + bno,
			header : {
				
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "get"
			},
			
			dataType : 'json',
			data : 
				bno
			,
			success : function(board) {
				
				
				$("#bnoo").val(board.bno);
				$("#title").val(board.title);
				$("#content").val(board.content);
				$("#writer").val(board.writer);
				$("#regdate").val(board.regdate);
				
				if(board.updatedate != null){
					
				str += "<input class='form-control' type='text' name='updatedate' id='updatedate' value='"+ board.updatedate +"' readonly><br><hr>"
				
				
				$("#get").append(str);
				
				}
				
			}
			
		});
		
		
		$("#deleteBtn").on("click", function(){
			
			$.ajax({
				
				type : 'get',
				url : '/board/delete/' + bno,
				header : {
					
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "get"
				},
				
				dataType : 'text',
				data : 
					bno
				,
				success : function(result) {
					
					if(result == 'SUCCESS'){
						
						alert("게시글 삭제가 완료되었습니다.");
						location.href="/board/list"
					}
				}
				
				});		
			});	
		
		$("#modifyBtn").on("click", function(){
			
			location.href="/board/modify?bno=" + $("#bnoo").val();
			
		});
		
		
	});

</script>	
</body>
</html>














