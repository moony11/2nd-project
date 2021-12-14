<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Review book</title>
<link rel="stylesheet" href="css/title.css">
<link rel="stylesheet" href="css/category.css">
<link rel="stylesheet" href="css/listimg.css">
<link rel="stylesheet" href="css/thumbnail_title.css">
<link rel="stylesheet" href="css/thumbnail_comment.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	
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

<div id=wrap>
<br>
	<div class="title">
		<p>장르별 카테고리</p>
	</div>
	<div class="category">
		<ul>
			<!--  <li><a href="Bcontroller?type=cate&category=1">소설</a></li> -->
			<li><a href="Bcontroller?type=cate&category=1">소설</a></li>
			<li><a href="Bcontroller?type=cate&category=2">인문학</a></li>
			<li><a href="Bcontroller?type=cate&category=3">에세이</a></li>
			<li><a href="Bcontroller?type=cate&category=4">경제/경영</a></li>
			<li><a href="Bcontroller?type=cate&category=5">역사</a></li>
			<li><a href="Bcontroller?type=cate&category=6">사회과학</a></li>
			<li><a href="Bcontroller?type=cate&category=7">만화</a></li>
		</ul>
	</div>
	<hr>
	<div class="title">
		<p>전체 장르 평론가평점 순위</p>
	</div>
	<div class="listimg">
		<ul>
			<c:forEach var="vo" items="${allcatecrrank }" varStatus="status">
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
						${allcatecrrank_wrname[status.index].b_writer }
					</div>
				</a>
			</li>
			</c:if>
			</c:forEach>
		</ul>
	</div>
	<hr>
	<div class="title">
		<p>전체 장르 일반사용자평점 순위</p>
	</div>
	<div class="listimg">
		<ul>
			<c:forEach var="vo2" items="${allcateuserrank }" varStatus="status">
			<c:if test="${status.count <= 4}">
			<li>
				<a href="Bcontroller?type=onclick&bookid=${vo2.b_id }">
					<div class="image">
						<img src="img/${vo2.b_name }.jpg">
					</div>
					<div class="thumbtitle">
						${vo2.b_name }
					</div>
					<div class="thumbcomment">
						${allcateuserrank_wrname[status.index].b_writer }
					</div>
				</a>
			</li>
			</c:if>
			</c:forEach>
		</ul>
	</div>
</div>
</body>
</html>