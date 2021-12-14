<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>

<!--  
	<style type="text/css">
		table{
			padding: 60px 0px;
			margin-left:auto; 
			margin-right:auto;
			border:3px solid;
		}
		
		td{
			border:1px solid #eee
		}
		
		}
	</style>
-->
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
		function checkValue()
		{
			inputForm = eval("document.loginInfo");
			if(!inputForm.id.value)
			{
				alert("아이디를 입력하세요");	
				inputForm.id.focus();
				return false;
			}
			if(!inputForm.password.value)
			{
				alert("비밀번호를 입력하세요");	
				inputForm.password.focus();
				return false;
			}
		}
	
		// 취소 버튼 클릭시 첫화면으로 이동
		function goFirstForm() {
			location.href="memberController?type=main";
		}
	</script>
</head>
<body>
<!--  
	<div id="wrap_log">
		<br><br>
		<b><font size="6" color="gray">로그인</font></b>
		<br><br><br>
	
		<form name="loginInfo" method="post" action="memberController?type=login" 
				onsubmit="return checkValue()">
			<table>
				<tr>
					<td bgcolor="gray">아이디</td>
					<td><input type="text" name="id" maxlength="50"></td>
				</tr>
				<tr>
					<td bgcolor="gray">비밀번호</td>
					<td><input type="password" name="password" maxlength="50"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="로그인"/>
			<input type="button" value="취소" onclick="goFirstForm()">
			
			<c:set var="failMessage" value="${requestScope.fail}"/>
			<c:if test="${failMessage!=null}">	
			<c:choose>
				<c:when test="${failMessage=='0'}">
					<br><font color='red' size='5'>비밀번호를 확인해 주세요.</font>
				</c:when>
				<c:otherwise>
					<br><font color='red' size='5'>아이디를 확인해 주세요.</font>
				</c:otherwise>
			</c:choose>
			</c:if>
		</form>
	</div>	
-->
<div class="modal modal-signin position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-5 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <!-- <h5 class="modal-title">Modal title</h5> -->
        <h2 class="fw-bold mb-0">로그인</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="goFirstForm()"></button>
      </div>

      <div class="modal-body p-5 pt-0">
        <form class="" name="loginInfo" method="post" action="memberController?type=login" 
				onsubmit="return checkValue()">
          <div class="form-floating mb-3">
            <input type="text" name=id class="form-control rounded-4" id="floatingInput" placeholder="Id">
            <label for="floatingInput">ID</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" name="password" class="form-control rounded-4" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">Password</label>
          </div>
          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">로그인</button>
		<c:set var="failMessage" value="${requestScope.fail}"/>
			<c:if test="${failMessage!=null}">	
			<c:choose>
				<c:when test="${failMessage=='0'}">
					<br><font color='red' size='5'>비밀번호를 확인해 주세요.</font>
				</c:when>
				<c:otherwise>
					<br><font color='red' size='5'>아이디를 확인해 주세요.</font>
				</c:otherwise>
			</c:choose>
		</c:if>						
        </form>
      </div>
    </div>
  </div>
</div>

<div class="b-example-divider"></div>
<script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


</body>
</html>