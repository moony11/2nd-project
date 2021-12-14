<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="com.br.model.member.memberDTO" %>
<%@ page import="com.br.model.member.memberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정화면</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
	

	<style type="text/css">
		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px solid skyblue;
		}
		
		td{
			border:1px solid skyblue
		}
		
		#title{
			background-color:skyblue
		}
	</style>
	<script type="text/javascript">
		// 비밀번호 입력여부 체크
		function checkValue() {
			if(!document.userInfo.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}else if(!document.userInfo.email.value){
				alert("이메일을 입력해주세요.");
				return false;
			}else if(!document.userInfo.phone.value){
				alert("휴대전화를 입력해주세요.");
				return false;
			}
		}
		
		function changeView(value){
			if(value == "-1"){
				location.href="memberController?type=memberInfo";
			}
		}
		
	</script>
</head>
<body>
<!-- 
		<br><br>
		<b><font size="6" color="gray">회원정보 수정</font></b>
		<br><br><br>
		<c:set var="member" value="${requestScope.memberInfo}" />
		<form method="post" action="memberController?type=memberModify" 
				name="userInfo" onsubmit="return checkValue()">
				
			<table>
				<tr>
					<td id="title">아이디</td>
					<td id="title">${member.login_id}</td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td>
						<input type="password" name="password" maxlength="50" 
							value="${member.login_pw}">
					</td>
				</tr>
			</table>	
			<br><br>	
			<table>

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
					<td>
						${member.birth}
					</td>
				</tr>
					
				<tr>
					<td id="title">이메일</td>
					<td>
						<input type="text" name="email" value="${member.email}"/>
					</td>
				</tr>
				<tr>
					<td id="title">휴대전화</td>
					<td>
						<input type="text" name="phone" value="${member.phone}"/>
					</td>
				</tr>
			</table>
			<br><br>
			<input type="button" value="취소" onclick="changeView(-1)">
			<input type="submit" value="수정"/>  
		</form>
 -->
 
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
			<input type="button" value="회원정보 변경" onclick="changeForm(0)">
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