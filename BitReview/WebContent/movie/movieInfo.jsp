<%@page import="com.br.model.dao.MovieDAO"%>
<%@page import="com.br.model.vo.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화정보</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

/* 	$(document).ready(function(){
		$("#wish").click(getWish());
	}); */
	
    $(".star").on('click',function(){
    	   var idx = $(this).index();
    	   $(".star").removeClass("on");
    	     for(var i=0; i<=idx; i++){
    	        $(".star").eq(i).addClass("on");
    	   }
    	 });
	
	function getWish() {
		
		$.ajax({
			url : "getWish",
			type : "post",
			data : {"type" : ${vo.movie_id} }, // 나중에 로그인 성공하면 로그인정보도 같이 넘겨줌
			dataType : "json", //응답받을 데이터 타입 지정
			success : function(data){
				//alert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
				console.log(data);
				console.log(data.list);

				// 전달받은 json 데이터 처리 
				
				let p = "";
				let alist = data.svo; //JSON 객체의 속성명 "list"의 값 추출
				$.each(alist, function(index, member){
					console.log("this.wish : " + this.wish);
					p += "<p>";
					p += "보고싶어요 " + this.wish;
					p += "</p>";
				});
				$("#wishRe").html(p);
			},
			error : function(jqXHR, textStatus, errorThrown){
				//alert("Ajax 처리 실패 : \n"
						+"jqXHR.readyState : " + jqXHR.readyState + "\n"
						+"textStatus : " + textStatus + "\n"
						+"errorThrown : " + errorThrown);
				
			}
			
		});

	}
	
	

</script>
</head>
<style>

	.container {
	  	display: flex;
	  	justify-content: center;

	}
	.back {
		border-radius:10px;
		background-color: #E0E0E0;
	}
	
	.wrap { 
	  	justify-content: center;
		margin: 20px 10px;
		padding: 30px 40px;
		width : 900px;
	}
	.box {
		display: flex; 
	}
	.inner {
		margin: 20px 10px 0px 10px;
		padding: 150px 30px 0px 30px;

	}
	
	.review { 
		border-radius:10px;
		background-color: #F5F5F5;
		border : 1px solid #DCDCDC;
		
		margin: 10px 0px;
		padding: 0px 10px;
	}
	
	.di { padding: 60px 0px; }

	.l { text-align: left; }
	
	.title { 
		font-size: 20px;
		font-weight: bold;
		padding: 10px 0px; 
	}
	
	.tt {
		font-size: 28px;
		font-weight: bold;
	}
	.content{
		padding: 10px 10px; 
	}
	
	.nick { 
		font-size: 18px;
		font-style: italic;
		padding: 7px 5px; 
		
	}
	
	.btn {
	 	border: none; /* Remove borders */
		color: white; /* Add a text color */
 		padding: 9px 16px; /* Add some padding */
    	cursor: pointer; /* Add a pointer cursor on mouse-over */
		font-size: 16px;
		border-radius: 5px;
	}
	
	.btns {
	 	border: none; /* Remove borders */
		color: white; /* Add a text color */
 		padding: 3px 12px; /* Add some padding */
    	cursor: pointer; /* Add a pointer cursor on mouse-over */
		font-size: 14px;
		border-radius: 5px;
		
	}
	.bt {
		padding: 15px 0px 10px 10px;
	}

	.info {background-color: #2196F3;} /* Blue */
	.info:hover {background: #0b7dda;}
	
</style>
<body>
<br><br>
<div class="container">

	<div class="back">
		<div class="wrap">
		<div>
			<h2 class="l">영화정보</h2>
			<br>
			<c:set var="vo" value="${vo }"></c:set>
			<div class="box">
				<div class="img"><img alt="movie" src="img/${vo.title }.jpg" width="230" height="330"></div>
				<div class="inner">
				<div class="in l">	
					<div class="tt">${vo.title }</div>
					<p>${vo.year } / ${vo.genre } / ${vo.grade }</p>
					<%-- <p>평점★ ${vo.stt }</p> --%>
					<p id=wishRe class="wishCnt">누적 보고싶어요 ${wish }명</p>
					<button class="btn info"  id="wish" onclick="getWish()">보고싶어요</button>
				</div>
				</div>
			</div>
		</div>
			
		<div class="di text l">
			<div class="title">감독</div>
			<p class="l">${vo.director }</p>
			<div class="title">출연진</div>
			<p class="l">${vo.cast }</p>
			<div class="title">줄거리</div>
			<div>${vo.story }</div>
		</div>	
			
		<div class="di rev">
			<div class="box">
				<div class="title l">리뷰보기</div>
				<div class="bt">
				<button class="btns info "  onclick="location.href='movieBoard?type=${vo.movie_id }&cPage=1';">더보기</button>
				</div>
			</div>
			<c:forEach var="bvo" items="${list }">
				<div class="review l">
					<div class="content">
						<div class="nick">${bvo.nickname }</div>
						<div>${bvo.board_content }</div>
					</div>
				</div>
			</c:forEach>
		</div>	
		</div>
	</div>

</div>
<br><br><br>
</body>
</html>