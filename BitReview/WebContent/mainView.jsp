<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
	<style>
		/*
		레이아웃 전체 가운데 정렬 태그  
		- margin:0 auto 0 auto;(시계방향으로 위, 오른쪽, 아래, 왼쪽)
		왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬이 된다. 
				전체를 감싸주는 태그 #wrap 
		*/
		#wrap {
			width: 100%;
			margin: 0 auto 0 auto;
		}
		
		#header {
			text-align: center;
			width: 100%;
			height: 50px;
		}

		#main {
			float: left;
			width: 100%;
			height: 1200px;
			background-color: white;
			text-align:center;
			vertical-align: middle;
			overflow:auto;	/* 자동 스크롤 */
		}
		#footer {
			width: 100%;
			height: 100px;
			clear: left;
			background-color: #F5F5F5;
		}
		
    }
	</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<div id="main">
		
			<!-- contentPage가 없을 경우 FirstView.jsp를 보여준다. -->
			<c:set var="contentPage" value="${param.contentPage}"/>
			<c:if test="${contentPage==null}">	
				<jsp:include page="book/connectionBook.jsp" />
			</c:if>
			<jsp:include page="${contentPage}" />
			
		</div>
		<div id="footer"> 
			<jsp:include page="footer.jsp" />
		</div>
	</div>
</body>
</html>