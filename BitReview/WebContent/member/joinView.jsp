<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
  
	<style type="text/css">
		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px solid;
		}
		
		td{
			text-align: left;
		}
		
		#title{
			background-color:gray;
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
	
		function checkValue(){
			var form = document.userInfo;
		
			if(!form.id.value){
				
				alert("아이디를 입력해주세요.");
				return false;
			}
			
			if(form.idDuplication.value != "idCheck"){
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if(!form.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			if(form.password.value != form.passwordcheck.value ){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}	
			
			if(!form.name.value){
				alert("이름을 입력하세요.");
				return false;
			}
			
			if(!form.birthyy.value){
				alert("년도를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.birthyy.value)){
				alert("년도는 숫자만 입력가능합니다.");
				return false;
			}
			
			if(form.birthmm.value == "00"){
				alert("월을 선택하세요.");
				return false;
			}
			
			if(!form.birthdd.value){
				alert("날짜를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.birthdd.value)){
				alert("날짜는 숫자만 입력가능합니다.");
				return false;
			}
			
			if(!form.mail1.value){
				alert("메일 주소를 입력하세요.");
				return false;
			}
			
			if(!form.phone.value){
				alert("전화번호를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.phone.value)){
				alert("전화번호는 - 제외한 숫자만 입력해주세요.");
				return false;
			}
			
		}
		
		// 취소 버튼 클릭시 첫화면으로 이동
		function goFirstForm(){
			location.href="memberController?type=main";
		}	
		
		// 아이디 중복체크 화면open
		function openIdChk(){
		
			window.name = "parentForm";
			window.open("member/idCheckView.jsp",
					"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
		}

		function inputIdChk(){
			document.userInfo.idDuplication.value ="idUncheck";
		}
		
	</script>
</head>
<body>
<div class="modal modal-signin position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-5 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <!-- <h5 class="modal-title">Modal title</h5> -->
		<h2 class="fw-bold mb-0">회원가입</h2>
	  </div>
	  <div class="modal-body p-5 pt-0">		
		<form method="post" action="memberController?type=join" 
				name="userInfo" onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td>
						<input type="text" name="id" maxlength="50" onkeydown="inputIdChk()">
						<input type="button" value="중복확인" onclick="openIdChk()">
						<input type="hidden" name="idDuplication" value="idUncheck" >
					</td>
				</tr>	
				<tr>
					<td id="title">비밀번호</td>
					<td>
						<input type="password" name="password" maxlength="50">
					</td>
				</tr>
				
				<tr>
					<td id="title">비밀번호 확인</td>
					<td>
						<input type="password" name="passwordcheck" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">이름</td>
					<td>
						<input type="text" name="name" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">닉네임</td>
					<td>
						<input type="text" name="nickName" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">생일</td>
					<td>
						<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6">
						<select name="birthmm">
							<option value="00">월</option>
							<option value="01" >1</option>
							<option value="02" >2</option>
							<option value="03" >3</option>
							<option value="04" >4</option>
							<option value="05" >5</option>
							<option value="06" >6</option>
							<option value="07" >7</option>
							<option value="08" >8</option>
							<option value="09" >9</option>
							<option value="10" >10</option>
							<option value="11" >11</option>
							<option value="12" >12</option>
						</select>
						<input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
					</td>
				</tr>
					
				<tr>
					<td id="title">이메일</td>
					<td>
						<input type="text" name="mail1" maxlength="50">@
						<select name="mail2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>						
						</select>
					</td>
				</tr>
					
				<tr>
					<td id="title">휴대전화</td>
					<td>
						<input type="text" name="phone"/>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="가입"/>  
			<input type="button" value="취소" onclick="goFirstForm()">
		</form>
		</div>	  			
      </div>
    </div>
</div>

<div class="b-example-divider"></div>
    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


		
</body>
</html>