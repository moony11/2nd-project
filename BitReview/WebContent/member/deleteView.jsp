<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 화면</title>
	<style type="text/css">
		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px solid gray;
		}
		
		td{
			border:1px solid gray;
		}
		
		#title{
			background-color:gray;
		}
	</style>
	<script type="text/javascript">
		// 비밀번호 미입력시 경고창
		function checkValue(){
			if(!document.deleteform.password.value){
				alert("비밀번호를 입력하지 않았습니다.");
				return false;
			}
		}
	</script>

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
	
</head>
<body>

<div class="modal modal-signin position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-5 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <!-- <h5 class="modal-title">Modal title</h5> -->
        <h2 class="fw-bold mb-0">회원 탈퇴</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="javascript:window.location='memberController?type=main'"></button>
      </div>

      <div class="modal-body p-5 pt-0">
        <form class="" name="deleteform" method="post" action="memberController?type=memberDelete"
		onsubmit="return checkValue()">
		<table>
			<tr>
				<td bgcolor="gray">비밀번호</td>
				<td><input type="password" name="password" maxlength="50"></td>
			</tr>
		</table>

		<br><input type="button" value="취소"
			onclick="javascript:window.location='memberController?type=memberInfo'"> <input
			type="submit" value="탈퇴" />          
          
          		
        </form>
      </div>
    </div>
  </div>
</div>

</body>
</html>