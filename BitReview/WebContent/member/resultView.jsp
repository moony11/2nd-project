<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 화면</title>

	<!-- Bootstrap core CSS -->
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
		
	</script>
    
    
    
</head>
<body>

<div class="modal modal-tour position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalTour">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content rounded-6 shadow">
			      <div class="modal-body p-5">

	<c:set var="msg" value="${sessionScope.msg}" scope="session" />
	<c:choose>
		<c:when test="${msg!=null && msg=='0'}">
			<font size='6'>회원정보가 수정되었습니다.</font>
			<c:remove var="msg" scope="session"></c:remove>
		</c:when>
		<c:when test="${msg!=null && msg=='1'}">
			<font size='6'>회원가입을 축하드립니다.</font>
			<c:remove var="msg" scope="session"></c:remove>
		</c:when>
		<c:otherwise>
			<font size='6'>회원정보가 삭제되었습니다.</font>
		</c:otherwise>
	</c:choose>

	<br><br>
	<input type="button" value="확   인" onclick="javascript:window.location='memberController?type=main'"/>
	
</div>
</div>
</div>
</div>

<!--
<div class="modal modal-tour position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalTour">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content rounded-6 shadow">
			      <div class="modal-body p-5">
			      
<c:set var="msg" value="${sessionScope.msg}" scope="session" />
	<c:choose>	
		<c:when test="${msg!=null && msg=='0'}">
			
			<h2 class="fw-bold mb-0">회원수정 완료</h2>
			<button type="button" class="btn btn-lg btn-primary mt-5 w-100" data-bs-dismiss="modal" onclick="changeView(0)">Great, thanks!</button> 
		<c:remove var="msg" scope="session"></c:remove>
		</c:when>
		<c:when test="${msg!=null && msg=='1'}">    
			<h2 class="fw-bold mb-1">회원가입을 축하합니다.</h2>	
			<button type="button" class="btn btn-lg btn-primary mt-5 w-100" data-bs-dismiss="modal" onclick="changeView(0)">Great, thanks!</button>   
			<c:remove var="msg" scope="session"></c:remove>
		</c:when>
		<c:otherwise>
			<h2 class="fw-bold mb-2">회원정보가 삭제되었습니다.</h2>
			<button type="button" class="btn btn-lg btn-primary mt-5 w-100" data-bs-dismiss="modal" onclick="changeView(0)">Great, thanks!</button> 
		</c:otherwise>
		</c:choose>
		
	
	
</div>
</div>
</div>
</div>

<button type="button" class="btn btn-lg btn-primary mt-5 w-100" data-bs-dismiss="modal" onclick="changeView(0)">확  인</button> 
-->
</body>
</html>