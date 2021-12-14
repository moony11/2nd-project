<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


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
		font-size: 40px;
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
<meta charset="UTF-8">
<title>메인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script>
	
	
	function orderBy() {
		$("#orderBy").attr("method", "post").attr("action","tpcontroller?type=main").submit();
		
	}

	function tpWriter() {
		location.href = "mainView.jsp?contentPage=tvProgram/TPwrite.jsp";
	}
	
	
	
</script>
</head>
<hr>
<div class="title">
      <p>TV 프로그램 리뷰</p>
      <hr>
   </div>
   
   <div style="float:right; ">
   <input type="button" value="글쓰기" onclick="tpWriter();" >   
   </div>
   <div style="float:right">
   <form action="" id="orderBy" method="post">
   <input type="hidden" name="${vo.tp_boardid}">
      <select name="idx" onchange="orderBy()">
         <option value="0">정렬기준</option>
         <option value="1">조회순</option>
         <option value="2">날짜정렬(최신순)</option>
         <option value="3">날짜정렬(오래된순)</option>
      </select>
   </form>
   </div>
   <br>
   <br>
	<div class="listimg">
		<ul>
			<c:forEach var="vo" items="${list }" >
			<c:if test="${vo.open == null }">
			<li>
				<a href="tpcontroller?type=view&tp_boardid=${vo.tp_boardid}">
					<div class="image">
						<img src="resources/upload/${vo.f_name}" >
					</div>
					<div class="thumbtitle">
						${vo.title}
					</div>
					<div class="thumbcomment">
						${vo.tp_name}
					</div>
					<div class="thumbcomment">
						By. ${vo.writer}  / 조회수 ${vo.hit}
					</div>
					<div class="thumbcomment">
						${vo.b_regdate}
					</div>
				</a>
				<br>
			</li>
			</c:if>
			</c:forEach>
		</ul>
	</div>
</body>

</html>