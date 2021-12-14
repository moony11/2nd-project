<%@page import="com.br.model.dao.MovieDAO"%>
<%@page import="com.br.model.vo.MovieVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bit Review</title>
<!--  부트스트랩 js 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- 부트스트랩 css 사용 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<style>
	/* Removes the default 20px margin and creates some padding space for the indicators and controls */
		#wrap {
			width: 100%;
			margin: 0 auto 0 auto;
		}
	

.carousel {
    margin-bottom: 0;
	padding: 0 40px 30px 40px;
}
/* Reposition the controls slightly */
.carousel-control {
	left: -12px;
}
.carousel-control.right {
	right: -12px;
}
/* Changes the position of the indicators */
.carousel-indicators {
	right: 18%;
	top: auto;
	bottom: 0px;
	margin-right: -19px;
}
/* Changes the colour of the indicators */
.carousel-indicators li {
	background: #c0c0c0;
}
.carousel-indicators .active {
background: #333333;
}
.span3 {
float: left;
}
.info {
	margin: 10px;
}

</style>
<body>
<div id = wrap >
<div class="container">

<br><br>
<%-- <h2>평점 높은 영화순</h2>

	<div class="row">
		<div class="span12">
    	    <div class="well"> 
                <div id="myCarousel" class="carousel slide">
                 
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                </ol>
                 
                <!-- Carousel items -->
                <div class="carousel-inner">
                    
                <div class="item active">
                	<div class="row-fluid">
                	<c:forEach var="vo" items="${list }">
                	  <div class="span3"><a href="controller?type=${vo.movie_id }" class="thumbnail"><img src="img/${vo.title }.jpg" alt="Image" style="max-width:100%;" />
                	 		<div class="info">
							<h4><b>${vo.title }</b></h4>
							<p>평점 ★ ${vo.stt }</p>
							<p>보고싶어요 </p>
							</div>
							</a>
                	  </div>
                	  </c:forEach>
                	</div><!--/row-fluid-->
                </div><!--/item-->
                 
                <!-- <div class="item">
                	<div class="row-fluid">
                		<div class="span3"><a href="#x" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;" /></a></div>
                		<div class="span3"><a href="#x" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;" /></a></div>
                		<div class="span3"><a href="#x" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;" /></a></div>
                		<div class="span3"><a href="#x" class="thumbnail"><img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;" /></a></div>
                	</div>/row-fluid
                </div>/item -->
                 
                </div><!--/carousel-inner-->
                 
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
                </div><!--/myCarousel-->
                 
            </div><!--/well-->   
		</div>
	</div>
</div>
 --%>

<div class="container">
<h2>보고싶어요 많은 영화순</h2>
<br>
	<div class="row">
		<div class="span12">
    	    <div class="well"> 
                <div id="myCarousel" class="carousel slide">
                 
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                </ol>
                 
                <!-- Carousel items -->
                <div class="carousel-inner">
                <div class="item active">
                	<div class="row-fluid">
                	<c:forEach var="vo1" items="${list2 }">
                	  <div class="span3"><a href="controller?type=${vo1.movie_id }" class="thumbnail"><img src="img/${vo1.title }.jpg" alt="Image" style="max-width:100%;" />
                	 		<div class="info">
                	 		<dr>
							<h4><b>${vo1.title }</b></h4>
							<!-- <p>보고싶어요 </p> -->
							</div>
							</a>
                	  </div>
                	  </c:forEach>
                	</div><!--/row-fluid-->
                </div><!--/item-->
                </div><!--/carousel-inner-->
                 
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
                </div><!--/myCarousel-->
                 
            </div><!--/well-->   
		</div>
	</div>
</div>

<br><br><br><br><br>

<div class="container">
<h2>액션 영화</h2>
<br>
	<div class="row">
		<div class="span12">
    	    <div class="well"> 
                <div id="myCarousel" class="carousel slide">
                 
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                </ol>
                 
                <!-- Carousel items -->
                <div class="carousel-inner">
                    
                <div class="item active">
                	<div class="row-fluid">
                	<c:forEach var="vo2" items="${list3 }">
                	  <div class="span3"><a href="controller?type=${vo2.movie_id }" class="thumbnail"><img src="img/${vo2.title }.jpg" alt="Image" style="max-width:100%;" />
                	 		<div class="info">
                	 		<dr>
							<h4><b>${vo2.title }</b></h4>
							<!-- <p>보고싶어요 </p> -->
							</div>
							</a>
                	  </div>
                	  </c:forEach>
                	</div><!--/row-fluid-->
                </div><!--/item-->
                </div><!--/carousel-inner-->
                 
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
                </div><!--/myCarousel-->
                 
            </div><!--/well-->   
		</div>
	</div>
</div>
<br><br><br><br>
</div>
<!--  부트스트랩 js 사용 -->
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>