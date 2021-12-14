<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Review book</title>
<link rel="stylesheet" href="css/category.css">
<link rel="stylesheet" href="css/listimg.css">
<link rel="stylesheet" href="css/thumbnail_title.css">
<link rel="stylesheet" href="css/thumbnail_comment.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.title{ 
		margin-top: 10px;
		margin-bottom: 10px;
		margin-left: 20%;
		margin-right: 20%;
		font-weight: bold;
		font-size: 20px;
		font-family: "Malgun Gothic";
		width: 100%;
		max-width: 60%;
	}
	
	hr {
		margin-left: 20%;
		margin-right: 20%;
		width: 100%;
		max-width: 60%;
	}
	
	ul {
		padding-inline-start: 0px;
	}
	
	a {
		text-decoration: none;
		color: black;
	}

</style>
<script>
	//location.href = "bookmain";
</script>
</head>
<body>
	<!-- 선택한 카테고리 타이틀 -->
	<c:forEach var="vo" items="${selectcate_crrank}" varStatus="status">
	<c:if test="${status.count eq 1}">
	<div class="title">
		<p>${vo.b_category }</p>
	</div>
	<hr>
	</c:if>
	</c:forEach>
	<!-- 선택한 카테고리 평론가 순위 -->
	<c:forEach var="vo" items="${selectcate_crrank}" varStatus="status">
	<c:if test="${status.count eq 1}">
	<div class="title">
		<p>${vo.b_category } 장르 평론가평점 순위</p>
	</div>
	</c:if>
	</c:forEach>
	<div class="listimg">
		<ul>
			<c:forEach var="vo" items="${selectcate_crrank }" varStatus="status">
			<c:if test="${status.count <= 4}">
			<li>
				<a href="Bcontroller?type=onclick&bookid=${vo.b_id }">
					<div class="image">
						<img src="img/${vo.b_name }.jpg">
					</div>
					<div class="thumbtitle">
						${vo.b_name }
					</div>
					<div class="thumbcomment">
						${selectcate_crrank_wrname[status.index].b_writer }
					</div>
				</a>
			</li>
			</c:if>
			</c:forEach>
		</ul>
	</div>
	<hr>
	<c:forEach var="vo1" items="${selectcate_userrank}" varStatus="status">
	<c:if test="${status.count eq 1}">
	<div class="title">
		<p>${vo1.b_category } 장르 일반사용자평점 순위</p>
	</div>
	</c:if>
	</c:forEach>
	<div class="listimg">
		<ul>
			<c:forEach var="vo1" items="${selectcate_crrank }" varStatus="status">
			<c:if test="${status.count <= 4}">
			<li>
				<a href="Bcontroller?type=onclick&bookid=${vo1.b_id }">
					<div class="image">
						<img src="img/${vo1.b_name }.jpg">
					</div>
					<div class="thumbtitle">
						${vo1.b_name }
					</div>
					<div class="thumbcomment">
						${selectcate_userrank_wrname[status.index].b_writer }
					</div>
				</a>
			</li>
			</c:if>
			</c:forEach>
		</ul>
	</div>
</body>
</html>