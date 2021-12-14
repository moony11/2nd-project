<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>
<meta charset="UTF-8">
	<title>상단 영역</title>
	
<!-- 
	<style>
		html {
		  height: 150%;
		}
		body { margin: 0; }
		.navbar {
		  background: gray;
		  margin: 0; padding: 0;
		  list-style: none;
		  position: fixed;
		  width: 100%;
		}
		.navbar>li {
		  display: inline-block;
		}
		.navbar>li>a {
		  display: block;
		  text-decoration: none;
		  padding: 10px 20px;
		  color: white;
		}
		.navbar>li>a:hover {
		  background: #eee;
		}
	</style>
-->
	<!--  부트스트랩 코어 -->
	<link href="css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>	
    
	<script type="text/javascript">
		function changeView(value){
			if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동
			{
				location.href="mainView.jsp?contentPage=book/connectionBook.jsp";
			}
			else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
			{	
				location.href="mainView.jsp?contentPage=member/loginView.jsp";
			}
			else if(value == "2") // 회원가입 버튼 클릭시 회원가입 화면으로 이동
			{	
				location.href="mainView.jsp?contentPage=member/joinView.jsp";
			}
			else if(value == "3") // 로그아웃 버튼 클릭시 로그아웃 처리
			{
				
				location.href="memberController?type=logout";
			}
			else if(value == "4") // 내정보 버튼 클릭시 회원정보 보여주는 화면으로 이동
			{
				location.href="memberController?type=memberInfo";
			}
			else if(value == "5")
			{
				location.href="mainList";
			}
			else if(value == "6")
			{
				location.href="tpcontroller?type=main";
			}
			else if(value == "7")
			{	
				location.href="mainView.jsp?contentPage=book/connectionBook.jsp";
			}
		}
		
	</script>
	
</head>
<body>

<!-- 
	<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#" onclick="changeView(0)">BitReview</a>
		  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
		   		<span class="navbar-toggler-icon"></span>
		  	</button>
		
		  	<div class="collapse navbar-collapse" id="navbarsExampleDefault">
				<ul class="navbar-nav mr-auto">
		      		<li class="nav-item">
		        		<a class="nav-link" href="#" onclick="changeView(5)">MOVIE</a>
		      		</li>
		      		<li class="nav-item">
		        		<a class="nav-link" href="#" onclick="changeView(6)">TV</a>
		      		</li>
		      		<li class="nav-item">
		        		<a class="nav-link" href="#" onclick="changeView(7)">BOOK</a>
		      		</li>
		      		<li class="nav-item">
		        		<a class="nav-link" href="#">FOOD</a>
		      		</li>
		    	</ul>



			    <form class="form-inline my-2 my-lg-0">
			      <input class="form-control mr-sm-2" type="text" placeholder="영화, TV, 책, 음식" aria-label="Search">
			        
			      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
			     
			    </form>
			
				<c:if test="${sessionScope.sessionID==null}"> 
				    <button type='button' id="modal_btn">로그인</button>
					<div class="black_bg"></div>
					<div class="modal_wrap">
					    <div class="modal_close"><a href="#">close</a></div>
					    <div id="logIn" style="border: solid;width:500px; height:500px;"></div>
					</div>
				</c:if>
				<c:if test="${sessionScope.sessionID==null}"> 
					<button type='button' id="modal_btn_join">회원가입</button>
					<div class="black_bg"></div>
					<div class="modal_wrap_join">
					    <div class="modal_close_join"><a href="#">close</a></div>
					    <div id="join" style="border: solid;width:500px; height:500px; "></div>
					</div>
				</c:if>
				
				<c:if test="${sessionScope.sessionID==null}"> 
					<button id="logoutBtn" class="btn btn-primary" onclick="changeView(1)">로그인</button>
					<button id="updateBtn" class="btn btn-primary" onclick="changeView(2)">회원가입</button>
				</c:if>
				
				<c:if test="${sessionScope.sessionID!=null}">
					<button id="logoutBtn" class="btn btn-primary" onclick="changeView(3)">로그아웃</button>
					<button id="updateBtn" class="btn btn-primary" onclick="changeView(4)">내정보</button>
				</c:if>	
		</div>		
	</div>
</nav>
-->



<!-- 
<ul class="navbar" style="font-family: "Malgun Gothic";">
	  <li style="float: left;"><a href="#" onclick="changeView(7)">BitReview</a></li>
	  <li style="float: left;"><a href="#" onclick="changeView(7)">BOOK</a></li>
	  <li style="float: left;"><a href="#" onclick="changeView(6)">TV</a></li> 
	  <li style="float: left;"><a href="#" onclick="changeView(5)">MOVIE</a></li> 
	<c:if test="${sessionScope.sessionID==null}">  
	  <li style="float: right;"><a href="#" onclick="changeView(1)">로그인</a></li> 
	  <li style="float: right;"><a href="#" onclick="changeView(2)">회원가입</a></li> 
	</c:if>
	<c:if test="${sessionScope.sessionID!=null}">  
	  <li style="float: right;"><a href="#" onclick="changeView(3)">로그아웃</a></li> 
	  <li style="float: right;"><a href="#" onclick="changeView(4)">회원정보</a></li> 
	</c:if>
</ul>
 -->
   <nav class="navbar navbar-expand-sm navbar-dark bg-dark" aria-label="Third navbar example">
    <div class="container-fluid">
      <a class="navbar-brand" href="#" onclick="changeView(0)">BitReview</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExample03">
        <ul class="navbar-nav me-auto mb-2 mb-sm-0">

          <li class="nav-item">
            <a class="nav-link" href="#" onclick="changeView(7)">BOOK</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="changeView(6)">TV</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="changeView(5)">MOVIE</a>
          </li>
        </ul>
        <div class="text-end">
			<c:if test="${sessionScope.sessionID==null}">         	
        		<button type="button" class="btn btn-outline-light me-2" onclick="changeView(1)">Login</button>
        		<button type="button" class="btn btn-warning" onclick="changeView(2)">Sign-up</button>
        	</c:if>
			<c:if test="${sessionScope.sessionID!=null}">         	
        		<button type="button" class="btn btn-outline-light me-2" onclick="changeView(3)">Logout</button>
        		<button type="button" class="btn btn-outline-light me-2" onclick="changeView(4)">Info</button>
        	</c:if>
        </div>
      </div>
    </div>
  </nav>
  
</body>
</html>