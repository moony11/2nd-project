<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<style>
	#bbs table {
		width: 1100px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bbs th, #bbs td {
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
	}
	#bbs .align-left { text-align: left; }
	
	
	
	.name { width: 30%; background-color: lightsteelblue; }
	.content { width: 70%; }
	
</style>
<meta charset="UTF-8">
<title>영화정보</title>
</head>
<body>

<table>
		<thead>
		
		<tr class="title">
			<th class="name">프로그램명</th>
			<th class="content">${tpone.tp_name}</th>
		</tr>
		<tr class="title">
			
			<th class="name">장르</th>
			<th class="content">${tpone.tp_genre}</th>
		</tr>
		<tr class="title">
			
			<th class="name">방송사</th>
			<th class="content">${tpone.tp_brdcs}</th>
		</tr>
		<tr class="title">
			
			<th class="name">출연진</th>
			<th class="content">${tpone.tp_member}</th>
		</tr>
		<tr class="title">
			<th class="name">내용</th>
			<th class="content">${tpone.tp_content}</th>
		</tr>

		</thead>
		
	</table>		

</body>
</html>