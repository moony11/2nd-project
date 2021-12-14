<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<script>
	function sendData() {
		//alert("sendData() 시작~~");
		var firstForm = document.forms[0];
		//alert(firstForm.elements.length);
		for (let i=0; i<firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 3) continue; //첨부파일은 제외
				//alert(firstForm.elements[i].title + " 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}

</script>
<style>
	.container {
		display: flex;
	  	justify-content: center;
	  	
	}
	.back {
		border-radius:10px;
		background-color: #E0E0E0;
	}
	
	.back table { 
	
	  	justify-content: center;
		margin: 20px 10px;
		padding: 30px 20px;
		border-collapse: separate;
		border-spacing: 0 12px;
		
	}
	.box{
		/* width: 100%; */
		border-radius:5px;
	}
	
	.head {
		font-size: 20px;
		font-weight: bold;
	}
	.in { font-weight: bold; }
	.title { 
		font-size: 26px;
		font-style: italic;
		font-weight: bold;
	}
	
	.btn {
	 	border: none; /* Remove borders */
		color: white; /* Add a text color */
 		padding: 9px 16px; /* Add some padding */
    	cursor: pointer; /* Add a pointer cursor on mouse-over */
		font-size: 16px;
		border-radius: 5px;
	}

	.info {background-color: #2196F3;} /* Blue */
	.info:hover {background: #0b7dda;}
	
	.click{ text-align: right; }
	.l { text-align: left; }
	
</style>
</head>
<body>
<br><br>

<div class="container">
	
	<form action="write?type=${vo.movie_id}&cPage=${cPage}" method="post">
	<div class="title l"><p>${vo.title} </p></div>
	<br>
	<div class="head l"><p>리뷰쓰기</p></div>
	<div class="back">
	<table>
		<tbody>
			<tr>
				<td class="head l" colspan="2">글제목</td>
			</tr>
			<tr>	
				<td colspan="2">
					<textarea class="box" name="subject" cols="100" title="제목"></textarea>
	
				</td>
			</tr>
		<tr>
			<td class="nickname in l" colspan="2"></td>
		</tr>
		<tr>
			<td class="content head l" colspan="2">리뷰내용</td>
		</tr>
		<tr>
			<td colspan="2">
			<textarea class="box" name="content" rows="20" cols="100" title="내용"></textarea>
			</td>
		</tr>
		</tbody>
		<tfoot>
			<tr>
				<td class="click" colspan="2">
					<input class="btn info" type="button" value="취소" onclick="location.href='movieBoard?type=${vo.movie_id }'">
					<input class="btn info" type="button" value="등록" onclick="sendData()">
				</td>
			</tr>
		</tfoot>
		
	</table>
	</div>
	</form>

</div>
</body>
</html>