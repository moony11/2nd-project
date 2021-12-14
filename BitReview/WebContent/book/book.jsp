<%@page import="com.br.book.vo.bookVO"%>
<%@page import="com.br.book.vo.bookReviewVO"%>
<%@page import="com.br.book.vo.bookScoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//System.out.println("book.jsp로 넘어온 값 확인 : " + request.getAttribute("selectone_book"));
	//System.out.println("book.jsp로 넘어온 값 확인 : " + request.getAttribute("selectone_bookwriter"));
	//System.out.println("book.jsp로 넘어온 값 확인 : " + request.getAttribute("selectone_bookcritic"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세정보</title>
<link rel="stylesheet" href="css/side.css">
<link rel="stylesheet" href="css/thumbnail_title.css">
<link rel="stylesheet" href="css/thumbnail_comment.css">
<style>
	.bookinfo {
		margin-left: 390px;
		margin-right: 20%;
		background-color: #dcdcdc;
	}
	
	
	
	.thumbtitle {
		text-align: center;
		font-weight: bold;
	}
	
	.thumbcomment {
		text-align: center;
	}
	
	.storeimg img {
		width: 150px;
		height: 80px;
	}
	
	.bookintro {
		height: 300px;
		overflow: hidden;
	}
	
	.bookintro div:nth-child(1) {
		padding-top: 20px;
		padding-left: 30px;
		padding-bottom: 20px;
		font-size: 20px;
		font-weight: bold;
	}
	
	.bookintro .info {
		padding-top: 20px;
		padding-left: 30px;
		padding-bottom: 20px;
		padding-right: 30px;
		height: 150px;
		overflow: hidden;
	}
	
	.bookintro .otherbook {
		padding-top: 20px;
		padding-left: 20px;
		padding-bottom: 20px;
		height: 250px;
		float: left;
		overflow: hidden;
	}
	
	.bookintro .otherbook img{
		width: 150px;
		height: 200px;
	}
	
	hr {
		margin-left: 20%;
		margin-right: 20%;
		width: 100%;
		max-width: 60%;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
<%--
	$().ready(function () {
		$("#writereview").click(function() {
			var bookid = window.location.search.slice(-1)
			var newScore = document.getElementById("reviewscore")
			var newReview = document.getElementById("review");
			alert("입력한 점수 : " + newScore.value);
			alert("입력한 리뷰 : " + newReview.value);
			alert("현재 페이지 : " + bookid);
	--%>		
			<%--
			bookid.submit();
			newScore.submit();
			newReview.submit();
			
			
			var newScore = document.getElementById("reviewscore")
			var newReview = document.getElementById("review");
			alert("입력한 점수 : " + newScore.value);
			alert("입력한 리뷰 : " + newReview.value);
			alert("현재 책 번호 : " + bookid);
			
			//review 테이블
			bookReviewVO rvo = new bookReviewVO();
			rvo.setSp_comm(newReview);
			
			//score 테이블
			bookScoreVO bscore = new bookScoreVO();
			bscore.setBook_score(newScore);
			
		})
	})
	--%>
</script>
</head>
<body>

	<!-- 사이드바 -->
	<section class="sidearea" name="book" style="margin-top: 3%;">
		<c:forEach var="vo" items="${selectone_book}">
		<div class="sidebar">
			<div>
				<img src="img/${vo.b_name }.jpg">
			</div>
			<hr>
			<div class="thumbtitle">
				${vo.b_name }
			</div>
			<div class="thumbcomment">
				${vo.b_category } / ${selectone_bookwriter[0].b_writer}
			</div>
			<hr>
			<div class="thumbtitle">
				전체 평균 평점
			</div>
			<div class="thumbcomment">
				★ ${ (selectone_bookcritic[0].b_c_point + selectone_bookscore[0].book_score) / 2} / ★ 5.0
			</div>
			<hr>
			<div class="thumbtitle">
				평론가 평균 평점
			</div>
			<div class="thumbcomment">
				★ ${selectone_bookcritic[0].b_c_point /1} / ★ 5.0
			</div>
			<hr>
			<div class="thumbtitle">
				유저 평균 평점
			</div>
			<div class="thumbcomment">
				★ ${selectone_bookscore[0].book_score / 1} / ★ 5.0
			</div>
			<br>
		</div>
		</c:forEach>
		<br>
		<div class="sidebar">
			<br>
			<div class="thumbtitle">
				판매처
			</div>
			<c:forEach var="vo1" items="${selectone_bookstore}">
			<c:if test="${vo1.b_store_id eq 1 }">
			<div class="storeimg">
				<img src="img/${vo1.b_store }.jpg">
			</div>
			<div class="thumbtitle">
				${vo1.b_store }
			</div>
			<div class="thumbcomment">
				${vo1.b_price }원
			</div>
			<br>
			</c:if>
			<c:if test="${vo1.b_store_id eq 2 }">
			<div class="storeimg">
				<img src="img/${vo1.b_store }.jpg">
			</div>
			<div class="thumbtitle">
				${vo1.b_store }
			</div>
			<div class="thumbcomment">
				${vo1.b_price }원
			</div>
			<br>
			</c:if>
			</c:forEach>
		</div>
	</section>
	
	<!-- 책 소개 -->
	<section class="bookinfo">
		<c:forEach var="vo" items="${selectone_book}">
		<div class="bookintro" style="margin-top: 5%;">
			<div>책 소개</div>
			<div class="info">${vo.b_info }</div>
		</div>
		</c:forEach>
	</section>
	<hr>
	
	<!-- 목차 -->
	<section class="bookinfo">
		<c:forEach var="vo" items="${selectone_book}">
		
		<!-- 목차가 비어있을 경우 -->
		<c:if test="${empty vo.b_index }">
		
		</c:if>
		
		<!-- 목차가 있을 경우 -->
		<c:if test="${not empty vo.b_index }">
		<div class="bookintro">
			<div>목차</div>
			<div class="info">${vo.b_index }</div>
		</div>
		</c:if>
		
		</c:forEach>
	</section>
	
	<c:forEach var="vo" items="${selectone_book}">
	<!-- 목차가 있을 경우 -->
	<c:if test="${not empty vo.b_index }">
	<hr>
	</c:if>
	</c:forEach>
	
	<!-- 저자소개 -->
	<section class="bookinfo">
		<c:forEach var="vo1" items="${selectone_bookwriter}">
		<div class="bookintro">
			<div>저자 소개</div>
			<div class="info">${vo1.b_wr_info }</div>
		</div>
		</c:forEach>
	</section>
	<hr>
	
	<!-- 저자의 다른 도서 -->
	<section class="bookinfo">
		
		<div class="bookintro">
			<div>저자의 다른 도서</div>
			<c:forEach var="vo4" items="${selectone_writerid}" varStatus="status">
			<c:if test="${status.count <= 4 }">
			<div class="otherbook">
				<!-- 썸네일 이미지로 링크 -->
				<a href="Bcontroller?type=onclick&bookid=${vo4.b_id }">
				<img src="img/${vo4.b_name }.jpg">
				</a>
			</div>
			</c:if>
			</c:forEach>
		</div>
		
	</section>
	<hr>
	
	<!-- 평론가 리뷰 -->
	<section class="bookinfo">
		<c:forEach var="vo2" items="${selectone_bookcritic}">
		<div class="bookintro">
			<div>평론가 리뷰</div>
			<div style="padding-left: 30px;">${vo2.b_cr_name }</div>
			<div style="padding-left: 30px;">${vo2.b_c_comm }</div>
		</div>
		</c:forEach>
	</section>
	<hr>
	
	<!-- 일반 리뷰 -->
	<section class="bookinfo">
		<div class="bookintro">
			<div>리뷰</div>
			<c:forEach var="vo3" items="${selectone_bookreview}" varStatus="status">
				<c:if test="${status.count <= 5}">
				<div style="padding-left: 30px; float: left;">
				${status.count }.
				</div>
				<div style="padding-left: 30px; font-weight: bold; float: left;">${vo3.nickname }</div>
				<div style="padding-left: 30px; float: left;">${vo3.sp_comm }</div>
				<form action="delBookReview" method="get">
					<input name="bookid" style="display: none;" value="${vo3.b_id }">
					<button name="reviewid" style="margin-left: 30px; margin-right: 30px; padding-left: 0px; padding-right: 0px; float: right; color: black; width: 20px; height: 20px; line-height: 0px; border-style: none; background-color: #dcdcdc;" value="${vo3.r_id }">X</button>
				</form>
				<br>
				</c:if>
			</c:forEach>
		</div>
	</section>
	<br>
	<!-- 페이징 -->
	
	<!-- 리뷰 작성 -->
	<section class="bookinfo">
			<form action="getBookReview" method="get">
				<div style="padding-top: 20px; padding-left: 30px; padding-bottom: 20px; font-size: 20px; font-weight: bold;">
				평점 등록하기
				</div>
				<select name="score" style="margin-left: 30px;height: 30px; width: 100px;">
					<option value="1">★☆☆☆☆</option>
					<option value="2">★★☆☆☆</option>
					<option value="3">★★★☆☆</option>
					<option value="4">★★★★☆</option>
					<option value="5">★★★★★</option>
				</select>
			<div>
					<div style="padding-top: 20px; padding-left: 30px; padding-bottom: 20px; font-size: 20px; font-weight: bold;">
					리뷰 작성하기
					</div>
					<textarea  name="review" rows="10" cols="80" placeholder="내용을 입력해주세요" style="margin-left: 30px;"></textarea>
					<c:forEach var="vo" items="${selectone_book}">
					<button name="bookid" style="vertical-align: top; height: 246px; width: 156px; color: white; font: 20px bold; background-color: #64AAFF;" value="${vo.b_id }">리뷰 등록</button>
					</c:forEach>
			</div>
			</form>
	</section>

</body>
</html>