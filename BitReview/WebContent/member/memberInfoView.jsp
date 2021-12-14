<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.br.model.member.memberDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 회원정보 화면</title>
	<style type="text/css">
		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px solid;
		}
		
		td{
			border:1px solid;
			text-align: left;
		}
		
		#title{
			background-color:gray
		}
	</style>
	
	<link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
	
		function changeForm(val){
			if(val == "-1"){
				location.href="memberController?type=main";
			}else if(val == "0"){
				//location.href="mainView.jsp?contentPage=member/modifyView.jsp";
				location.href="memberController?type=memberMoveModify"
			}else if(val == "1"){
				location.href="memberController?type=memberMoveDelete";
			}
		}
		
	</script>
</head>
<body>


	
<div class="modal modal-signin position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-5 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <!-- <h5 class="modal-title">Modal title</h5> -->
        <h2 class="fw-bold mb-0">회원 정보</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="changeForm(-1)"></button>
      </div>

      <div class="modal-body p-5 pt-0">
        <form class="">
			<!-- 회원정보를 가져와 member 변수에 담는다. -->
			<c:set var="member" value="${requestScope.memberInfo}" />
		
			<!-- 가져온 회원정보를 출력한다. -->
			<table>
				<tr>
					<td id="title">아이디</td>
					<td>${member.login_id}</td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td>${member.login_pw}</td>
				</tr>
				<tr>
					<td id="title">이름</td>
					<td>${member.name}</td>
				</tr>
				<tr>
					<td id="title">닉네임</td>
					<td>${member.nickName}</td>
				</tr>
				<tr>
					<td id="title">생일</td>
					<td>${member.birth}</td>
				</tr>
				<tr>
					<td id="title">이메일</td>
					<td>${member.email}</td>
				</tr>
				<tr>
					<td id="title">휴대전화</td>
					<td>${member.phone}</td>
				</tr>
			</table>
			<br><br>
			<input type="button" value="뒤로" onclick="changeForm(-1)">
			<!--  
			<input type="button" value="회원정보 변경" onclick="changeForm(0)">
			-->
			<input type="button" value="회원탈퇴" onclick="changeForm(1)">						
        </form>
      </div>
    </div>
  </div>
</div>

<div class="b-example-divider"></div>
<script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	
	

</body>
</html>