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
		<table class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일자</th>
					<th>수정일자</th>
				</tr>
			</thead>
			<tbody id="boardList">
			
			</tbody>
		</table>
		<a href="/board/register"><input type="button" class="btn btn-primary float-right" value="글쓰기"></a>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$.getJSON("/board/list", function(data){
				
				var str = "";
				
				$(data).each(function(){
					
					str += "<tr><td>" + this.bno + "</td><td>" + this.title
						+ "</td><td>" + this.writer + "</td><td>" + this.regdate
						+ "</td><td>" + this.updatedate + "</td></tr>";
					
				});
				$("#boardList").html(str);
				
				
			});
			
		});
	</script>
	
</body>
</html>
















