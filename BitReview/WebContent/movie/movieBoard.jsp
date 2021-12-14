<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰목록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
</head>
<style>
	.container {
	  	display: flex;
	  	justify-content: center;

	}
	
	table {
		border-collapse: separate;
		border-spacing: 0 10px;
		width: 80% 
	}
	.title {
		font-size: 26px; 
	}
	
	.btn {
	 	border: none; /* Remove borders */
		color: white; /* Add a text color */
		padding: 11px 16px; /* Add some padding */
	    cursor: pointer; /* Add a pointer cursor on mouse-over */
		border-radius: 5px;
	}

	.info {background-color: #2196F3;} /* Blue */
	.info:hover {background: #0b7dda;}


	.subject {
		width:60%;
	}

	th, td {
 	  text-align: center;
 	  padding: 16px;
	}
	
	.subject{
		border-top-left-radius:10px;
		border-bottom-left-radius:10px;
	}
	
	.hit {
		border-top-right-radius:10px;
		border-bottom-right-radius:10px;
	}
	
	.con {
		background-color: #E0E0E0;
		cursor: pointer;
	}
	
	.header{
		font-style: italic;
		font-weight: bold;
		background-color: lightsteelblue;
	}
	
	th:first-child, td:first-child {
	  text-align: left;
	}
	
	.disabled {
		border: 1px solid #dee2e6;
		padding: .5rem .75rem;
		margin-left: -1px;
   		line-height: 1.25;
   		color: silver;
	}
	.active {
		border: 1px solid #dee2e6;
		padding: .5rem .75rem;
		margin-left: -1px;
   		line-height: 1.25;
   		color: white;
   		background-color: #2196F3;
	}
	
</style>
<body>
<br><br><br>
<div class="container">
	<table>
		<thead>
		<tr>
			<th class="title" colspan="3" style="width:90%">${mvo.title }</th>
			<th><input class="btn info" type="button" value="글쓰기"
					onclick="location.href='movieWrite?type=${mvo.movie_id}&cPage=${cPage}'"></th>
		</tr>
	</thead>
	<tbody class="body">
		<tr>
			<td class="subject header">제목</td>
			<td class="nickname header">닉네임</td>
			<td class="date header">등록날짜</td>
			<td class="hit header">조회수</td>
		</tr>
	<c:choose>
	<c:when test="${empty list }">
		<tr>
			<td colspan="5">
				<h2>현재 등록된 게시글이 없습니다</h2>
			</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach var="vo" items="${list }">
		<tr class="selectOne" onclick="location.href='movieReview?type=${vo.board_id }&cPage=${pvo.nowPage}'">
			<td class="subject con">${vo.subject }</td>
			<td class="nickname con">${vo.nickname }</td>
			<td class="date con">${vo.board_date.substring(0,10) }</td>
			<td class="hit con">${vo.hit }</td>
		</tr>
		</c:forEach>
	</c:otherwise>
	</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">
				<ul class="pagination justify-content-center">
				<c:choose><%--[이전으로]에 대한 사용여부 처리 --%>
				<c:when test="${pvo.beginPage == 1 }">
					<li class="page-item disabled">이전으로</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="movieBoard?type=${mvo.movie_id }&cPage=${pvo.beginPage - 1 }">이전으로</a>
					</li>
				</c:otherwise>
				</c:choose>	
				
				<%--블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
				<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:choose>
				<c:when test="${pageNo == pvo.nowPage }">
					<li class="page-item active">${pageNo }</li>
				</c:when>
				<c:otherwise>
					<li class="page-item "><a class="page-link" href="movieBoard?type=${mvo.movie_id }&cPage=${pageNo }">${pageNo }</a></li>
				</c:otherwise>	
				</c:choose>
				</c:forEach>
				
				
				<%--[다음으로]에 대한 사용여부 처리 --%>	
				<c:if test="${pvo.endPage < pvo.totalPage }">	
					<li class="page-item"><a class="page-link" href="movieBoard?type=${mvo.movie_id  }&cPage=${pvo.endPage + 1 }">다음으로</a></li>
				</c:if>
				<c:if test="${pvo.endPage >= pvo.totalPage }">					
					<li class="page-item disabled">다음으로</li>
				</c:if>  
				</ul>
			</td>

		</tr>
	</tfoot>
	</table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>