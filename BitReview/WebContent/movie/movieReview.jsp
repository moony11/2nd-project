<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>  

	// 안되는거 - 댓글등록시 바로 수정, 삭제가 안뜸 새로고침 해줘야함
	//          - 댓글 삭제 1개 댓글만 있을때 삭제가 안됨 리스트에 값이 없어서
	//            json 문자열 오류
	
	
	// 리스트 불러오기
	function getReplyList (check) { 
	
		alert(check);
		alert(">> getRelpyList() 실행 ~~");
		$.ajax({  
			url : "getReply",
			type : "post",
			data : {"type": ${vo.board_id }, 
					"check": check
				},
			dataType : "json", //응답받을 데이터 타입 지정
			success : function(data){
				alert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
				console.log(data);
			
				let tbody = "";
				let alist = data.list;
				$.each(alist, function(index, reply){
					tbody += "<tr>";
					tbody += "<td class='nickname l'>" + this.nickname + "</td>";
					tbody += "<td class='b'>" + this.reply_date + "</td>";
					tbody += "</tr>";
					tbody += "<c:if test='${sessionScope.mid == commVO.member_id}'>";
					tbody += "<tr>";
					tbody += "<td class='b' colspan='2'>";
					tbody += "<button class='btn info' onclick='javascript:getReplyUp("+ this.reply_id +"'>수정</button></td>";
					tbody += "<button class='btn info' onclick='javascript:getReplyUpDel("+ this.reply_id +", " + 2 + ")'>삭제</button>";
					tbody += "</td>";
					tbody += "</tr>";
					tbody += "</c:if>";
					tbody += "<tr>";
					tbody += "<td class='rpContent l' colspan='2'>" + this.reply_content + "</td>";
					tbody += "</tr>";
				});
					tbody += "<tr id='remodify'></tr>"
				$("#rpTbody").html(tbody);
			},
			
			error : function(jqXHR, textStatus, errorThrown){
				alert("Ajax 처리 실패 : \n"
						+"jqXHR.readyState : " + jqXHR.readyState + "\n"
						+"textStatus : " + textStatus + "\n"
						+"errorThrown : " + errorThrown);
				
			}
			
		
		});
	
	} 
	
	// 댓글 등록
	function getReplyIn(check) { 
		
	 	alert(check);
		alert(">> getRelpy() 실행 ~~");
		alert(${sessionScope.mId }); 
		var content = $("#getContent").val();
		console.log(content);
		console.log(${sessionScope.mId });
		$.ajax({  
			url : "getReply",
			type : "post",
			data : {"type": ${vo.board_id },
					"member": ${sessionScope.mId },
					"check": check,
					"replyContent": content
				},
			dataType : "json", //응답받을 데이터 타입 지정
			success : function(data){
				alert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
				console.log(data);
			
				let tbody = "";
				let alist = data.list;
				$.each(alist, function(index, reply){
					tbody += "<tr>";
					tbody += "<td class='nickname l'>" + this.nickname + "</td>";
					tbody += "<td class='b'>" + this.reply_date + "</td>";
					tbody += "</tr>";
					tbody += "<tr>";
					tbody += "<td>";
					tbody += "세션값  ${sessionScope.mId }";
					tbody += "세션nklj값  ${commVO.member_id}";
					tbody += "</td>";
					tbody += "</tr>";
					tbody += "<c:if test='${sessionScope.mId == commVO.member_id}'>";
					tbody += "<tr>";
					tbody += "<td class='b' colspan='2'>";
					tbody += "<button class='btn info' onclick='javascript:getReplyUp("+ this.reply_id +"'>수정</button>";
					tbody += "<button class='btn info' onclick='javascript:getReplyUpDel("+ this.reply_id +", " + 2 + ")'>삭제</button>";
					tbody += "</td>";
					tbody += "</tr>";
					tbody += "</c:if>";
					tbody += "<tr>";
					tbody += "<td class='rpContent l' colspan='2'>" + this.reply_content + "</td>";
					tbody += "</tr>";
				});
					tbody += "<tr id='remodify'></tr>"
				$("#rpTbody").html(tbody);
				$("#getContent").val("");
			},
			
			error : function(jqXHR, textStatus, errorThrown){
				alert("Ajax 처리 실패 : \n"
						+"jqXHR.readyState : " + jqXHR.readyState + "\n"
						+"textStatus : " + textStatus + "\n"
						+"errorThrown : " + errorThrown);
				
			}
			
		
		});

	}
	
	 	// 수정폼 출력
		function getReplyUp(reply_id) { 
		
			alert(reply_id);
			alert(">> replyUp() 실행 ~~");
		
			$.ajax({  
				url : "replyUp",
				type : "post",
				data : {"type": reply_id
					},
				dataType : "json", //응답받을 데이터 타입 지정
				success : function(data){
					alert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
					console.log(data);
						let tbody = "";
						let alist = data.vo;
						$.each(alist, function(index, reply){
							tbody += "<tr>";
							tbody += "<td class='nickname l hid'>" + this.nickname + "</td>";
							tbody += "<td class='b hid'>" + this.reply_date + "</td>";
							tbody += "</tr>";
							tbody += "<c:if test='${sessionScope.mid == commVO.member_id}'>";
							tbody += "<tr>";
							tbody += "<td class='b hid' colspan='2'>";
							tbody += "<button class='btn info' onclick='javascript:getReplyUpDel("+ this.reply_id +", " + 1 + ")'>등록</button>";
							tbody += "<button class='btn info' onclick='javascript:getReplyUpDel("+ this.reply_id +", " + 3 + ")'>취소</button>";
							tbody += "</td>"; 
							tbody += "</tr>";
							tbody += "</c:if>";
							tbody += "<tr>";
							tbody += "<td class='rpContent l hid' colspan='2'><textarea id='getContent'  rows='4' cols='100'>"+ this.reply_content + "</textarea></td>";
							tbody += "</tr>";
							
						});
						$("#remodify").html(tbody);
						
						
				},
				
				error : function(jqXHR, textStatus, errorThrown){
					alert("Ajax 처리 실패 : \n"
							+"jqXHR.readyState : " + jqXHR.readyState + "\n"
							+"textStatus : " + textStatus + "\n"
							+"errorThrown : " + errorThrown);
					
				}
				
			
			});
	
		}
		// 댓글 수정, 삭제 등록 
		function getReplyUpDel (reply_id, check) { 
			
			alert(check);
			console.log(check);
			console.log(reply_id);
			alert(">> getReplyUpDel() 실행 ~~");
			var content = $("#getContent").val();
			$.ajax({  
				url : "replyUpOk",
				type : "post",
				data : {"type": ${vo.board_id }, 
						"replyId" : reply_id,
						"check" : check,
						"replyContent": content
					},
				dataType : "json", //응답받을 데이터 타입 지정
				success : function(data){
					alert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
					console.log(data);
					let tbody = "";
					let alist = data.list;
					$.each(alist, function(index, reply){
						tbody += "<tr>";
						tbody += "<td class='nickname l'>" + this.nickname + "</td>";
						tbody += "<td class='b'>" + this.reply_date + "</td>";
						tbody += "</tr>";
						tbody += "<c:if test='${sessionScope.mid == commVO.member_id}'>";
						tbody += "<tr>";
						tbody += "<td class='b' colspan='2'>";
						tbody += "<button class='btn info' onclick='javascript:getReplyUp("+ this.reply_id +")'>수정</button>";
						tbody += "<button class='btn info' onclick='javascript:getReplyUpDel("+ this.reply_id +", " + 2 + ")'>삭제</button>";
						tbody += "</td>";
						tbody += "</tr>";
						tbody += "</c:if>";
						tbody += "<tr>";
						tbody += "<td class='rpContent l'colspan='2'>" + this.reply_content + "</td>";
						tbody += "</tr>";
					});
					$("#rpTbody").html(tbody); 
					$(".hid").hide(tbody);
				},
				
				error : function(jqXHR, textStatus, errorThrown){
					alert("Ajax 처리 실패 : \n"
							+"jqXHR.readyState : " + jqXHR.readyState + "\n"
							+"textStatus : " + textStatus + "\n"
							+"errorThrown : " + errorThrown);
					
				}
				
			
			});

		}		
 

	function gologIn(){
		//alert("로그인이 필요합니다.");
		location.href = "member/loginView.jsp"; 
	}

</script>
<script type="text/javascript">


</script>
<style type="text/css">

	.container {
		display: flex;
	  	justify-content: center;
	  	
	}
	.back {
		border-radius:10px;
		background-color: #E0E0E0;
		width : 800px;
	}
	
	.tb { 
	  	/* justify-content: center;
		margin: 20px 10px; */
		padding: 40px 20px;

		
	}
	
	.view { 
		justify-content: center;
	  	width: 98%;
		margin: 20px 10px;
		padding: 30px 20px 20px 20px;
		border-collapse: separate;
		border-spacing: 0 11px;
		
	}
	
	.reply {
		justify-content: center;
		width: 98%;
		padding: 30px 10px 20px 20px;
		border-collapse: separate;
		border-spacing: 0 8px;
	}
	
	.rpContent {
		border-bottom: 1px solid black; 
		opacity: 0.43;
	}
	
	.head {
		font-size: 23px;
		font-weight: bold;
		font-style: italic; 
	}
	
	.b { text-align: right; }
	.l { text-align: left; }
	
	.btnB {
	 	border: none; /* Remove borders */
		color: white; /* Add a text color */
 		padding: 5px 10px; /* Add some padding */
    	cursor: pointer; /* Add a pointer cursor on mouse-over */
		font-size: 16px;
		border-radius: 5px;
	}
	
	.btn {
	 	border: none; /* Remove borders */
		color: white; /* Add a text color */
 		padding: 3px 7px; /* Add some padding */
    	cursor: pointer; /* Add a pointer cursor on mouse-over */
		font-size: 14px;
		border-radius: 5px;
	}

	.info {
		text-align: right;
		background-color: #2196F3; } /* Blue */
		
	.info:hover {background: #0b7dda;}
	
	.nickname { 
		font-style: italic;
		
	}
	
	.line { 
		height: auto; 
		width: 100%; 
		border-top:1px solid #808080;
	}
	
</style>

</head>
<body>
<br><br>
	<div class="container">
		<div>
		<div class="head l"><p>리뷰</p></div>
		<div class="back">
		<table class="view tb">
			<tbody>
				<tr>
					<td class="head a l" colspan="2">${vo.subject }</td>
				</tr>
				<tr>
					<td class="nickname l">${vo.nickname }</td>
					<td class="date b">${vo.board_date }</td>
				</tr>
				<tr>
					<td class="hit b" colspan="2">조회수 ${vo.hit}</td>
				</tr>
				<tr>
					<td class="content l" colspan="2">${vo.board_content }</td>
				</tr>
			</tbody>
			<tfoot>
			<c:if test="${sessionScope.mId == vo.member_id}">
				<tr>
					<td class="b" colspan="2">
					<input class="btnB info" type="button" value="수정" onclick="location.href='modify?type=${vo.movie_id}&board=${vo.board_id }&cPage=${cPage}'"> 
					<input class="btnB info" type="button" value="삭제" onclick="location.href='delete?type=${vo.movie_id}&board=${vo.board_id }&cPage=${cPage}'"> 
				</tr>
			</c:if>
			</tfoot>

		</table>
		
		<div class="line"></div>
		
		<%-- 게시글에 작성된 댓글 표시 영역 --%>
		
			<div class="reply">
			<div class="l">댓글</div>
				<table class="reply tb">
					<tbody id="rpTbody">
					<c:forEach var="commVO" items="${list }">
						<tr id="replyNN">
							<td class="nickname l">${commVO.nickname }</td>
							<td class="b" >${commVO.reply_date }</td>
						</tr>
						<c:if test="${sessionScope.mId == commVO.member_id}">
							<tr>
								<td class="b" colspan="2">
									<button class="btn info mini"  onclick="javascript:getReplyUp(${commVO.reply_id })">수정</button>
									<button class="btn info mini"  onclick='javascript:getReplyUpDel(${commVO.reply_id }, 2)'>삭제</button>
								</td>
							</tr>
						</c:if>
						<tr>
							<td class="rpContent l" colspan="2">${commVO.reply_content }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<table>
					<tr id='remodify' class="modify tb"></tr>
				</table>
			</div>
		
	
	<div class="line"></div>
	
	<div class="reWrite tb" >
		<form name="relpyform">
			<div class="l">댓글쓰기</div>
			<br>
			<p class="l">
				<textarea id="getContent" rows="4" cols="100"></textarea>
			</p>
			<div class="b">
			<c:if test="${sessionScope.mId == null}">
		   		 <input class="btnB info" type="button" value="댓글등록" onclick="gologIn()">
			</c:if>
			<c:if test="${sessionScope.mId != null}">
		   		 <input class="btnB info" type="button" value="댓글등록" onclick="javascript:getReplyIn(1)">
			</c:if>
			</div>
			

		</form>
		</div>
		</div>
		<br>
		<div class="list b"><input class="btnB info" type="button" value="목록" onclick="location.href='movieBoard?type=${vo.movie_id }'"></div>
		</div>
	</div>

</body>
</html>