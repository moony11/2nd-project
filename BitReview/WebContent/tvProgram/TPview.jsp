<%@page import="com.br.model.dao.BoardDAO"%>
<%@page import="com.br.model.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<style>


#title{
   font-family: 'Nanum Myeongjo', serif;
   font-size: 5rem;
}

.media{
    border-top-style: none;
    border-right-style: none;
    border-bottom-style: solid;
    border-left-style: none;
    border-width: 1px;
    border-color: lightgray;
}

@media (min-width: 768px) {
  .container {
    width: 100%;
  }
}
img {
    opacity: 0.2;

	}
	
.img{
 
                                      
    height: 50vh;
    background-size: cover;
    
}
.img-cover{
   height: 100%;
   width: 100%;
   background-size: cover;
   background-color: rgba(0, 0, 0, 0.4);                                                                 
   z-index:1;
   height : 750px;
}
.img .content{
     position: absolute;
     top:60%;
     left:50%;
     transform: translate(-50%, -50%);     
     font-size : 6rem;                                                              
     color: white;
     z-index: 2;
     text-align: center;
     width:1500px;
}
#hit, #updown {
	pont-size : 1rem;
}
#info{
     position: absolute;
     top:90%;
     left:85%;
     transform: translate(-50%, -50%);                                                                   
     color: white;
     z-index: 2;
     text-align: center;
}
tr {
	font-size: 1rem;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	var member = "${sessionScope.nickName}";
    $(document).ready(function(){
    	getReplyList();
    });
  	
    function getReplyList() { 	
    	
    	$.ajax({
    		url: "replyList",
    		type: "get",
    		dataType:"json",
    		async:true,
    		data:{
    			tp_boardid:"${one.tp_boardid}"
    		}, success: function(data){
					var tbody ="";
					var alist = data.rlist;
					
					$.each(alist, function(index, reply){
						tbody += "<tr align='center' data-tp_replyid='" + this.tp_replyid+ "'data-tp_boardid='" + this.tp_boardid+"' ' >";
						tbody += "<td width=20%;>" + this.r_writer + "</td>";
						tbody += "<td width=50%;>" + this.r_content + "</td>";
						tbody += "<td width=30%;>" + this.r_regdate + "</td>";
						if(this.r_writer == member) {
						tbody += "<td><input type='button' class='modifyReply' id='modifyReply'  value='수정'></td>"
						tbody += "<td><input type='button' class='deleteBtn' id='deleteReply' value='삭제'></td>"
						}
						tbody += "</tr>";
						
					});
					$("#tbody").html(tbody);
					
    			}, 
    			error : function(jqXHR, textStatus, errorThrown){
    				
    			}
    	});
	}
  	
	 // Ajax 댓글작성
    	function writerReply() { 
    	$.ajax({
    		url: "reply",
    		type: "post",
    		dataType:"json",
    		async:true,
    		data:{
    			r_content:$("#replyContent").val(),
                tp_boardid:"${one.tp_boardid}"
    		}, success: function(data){
    			getReplyList(data);
    		}
    	});
	 }	
	
	 // 댓글 삭제
    $(document).on("click", ".deleteBtn", function() {
    	if(confirm("댓글을 삭제하시겠습니까?")) {
    		var tp_replyid = $(this).parent().parent().data("tp_replyid");
    		var tp_boardid = $(this).parent().parent().data("tp_boardid");
			console.log("replyno " + tp_replyid);
			console.log("tp_boardid " + tp_boardid);
			$.ajax({
	            url : 'delete?tp_replyid='+tp_replyid+'&tp_boardid='+tp_boardid,
	            type : 'GET',
	            dataType : 'json',
	            success : function(data) {       
	            	getReplyList(data);
	            }       
	      }); 
    	}
    });
   
	// 댓글 수정 버튼 클릭 -> 폼 변경 -> 데이터 담기
    $(document).on("click", ".modifyReply", function() {
	   if(confirm("댓글을 수정하시겠습니까?")) {
	   		var tp_replyid = $(this).parent().parent().data("tp_replyid");
   	   		//var tp_boardid = $(this).parent().parent().data("tp_boardid");
       $.ajax({
            url : 'modifyreply?tp_replyid='+tp_replyid, //+'&tp_boardid='+tp_boardid,
            type : 'GET',
            contentType : 'application/json;charset=UTF-8',
            dataType : 'json',
            success : function(data) {
               ModifyReplyForm(data);
            }  
      }); 
	 }
   });
	
	// 댓글 폼 만들기
	function ModifyReplyForm(reply) {
		
		var output = "";
	      output += '   <div class="media-body" id="modifyComplete123">';
	      output += '     <h6><b>' + reply.r_writer +'</b></h6>';
	      output += '     <div style="float:left" data-tp_replyid="' + reply.tp_replyid + '" data-tp_boardid="' + reply.tp_boardid + '">';
	      output += '        <textarea id="modifiedContent" rows="4" style="width:706px" placeholder="내용을 입력해주세요">' + reply.r_content +'</textarea>';      
	      output += '        <button id= "modifyComplete" >수정</button>';
	      output += '     </div>';
	      output += '   </div>';
	   $("#modi").append(output);   
	   
	}
	
	// 댓글 수정완료버튼
	
	 $(document).on("click", "#modifyComplete", function() {
	      var r_content = $("#modifiedContent").val();
	      var tp_boardid = $(this).parent().data("tp_boardid");
	      var tp_replyid  = $(this).parent().data("tp_replyid");

	       if(r_content.trim().length != 0) {
	         $.ajax({
	            url : 'modifyok?tp_replyid='+tp_replyid+'&tp_boardid='+tp_boardid+'&r_content='+r_content,
	            type : 'post',
	            contentType : 'application/json;charset=UTF-8',
	            dataType : 'json',
	            success : function() {
	            	alert("수정이 완료되었습니다.");
	      	       getReplyList();
	            }
	         });
	      } 
	      
	   });
	
	// 글 상세 - > 목록으로(메인페이지이동) 
 	function mainGo() {	
	 	location.href = "tpcontroller?type=main";	
 	};
 	
 	function modifyGo() {
 		location.href = "tpcontroller?type=modify&tp_boardid=${one.tp_boardid}";
 	};
 	
	function deleteGo() {
		 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			 location.href = "tpcontroller?type=delete&&tp_boardid=${one.tp_boardid}";
		 }else{
		     return false;
		 }
 	};
 	
 	function tpone() {
 		window.name ="TPoneview.jsp"
 			
 		window.open("tpcontroller?type=tponeview&tp_id=${one.tp_id}", "tponelist", "width = 450, height = 250, resizable = no, scrollbars = no, status = no");
 	}
    
</script>


</head>
<body>
<br>
<header>
	   <div style ="float:right">
 	   <label id="hit">조회수 ${one.hit }</label>
   	   
   	   <input type="button" value="목록으로" id="mainList" onclick="mainGo();">
   	   </div>
  	<br>
  	<br>
 <div class="img">
   <div class="content">
       <label id="title" style="width:1000;">${one.title }</label><br>
     
   </div>
   <div class="img-cover">
   <img class ="img-cover" src="resources/upload/${one.f_name}" >
   <div id="info" style="float:right" >
      <h3 id="nickname">by ${one.writer }</h5>
         <h4>${one.b_regdate }</h6>
      </div>
   </div>
      
</div>
</header>

<div class="container" id="articleBody" data-post_no="#" data-post_id="#">
	<br><br><br><br><br><br>
   <main role="main">
         <div id="selectedBook">
         
       <br><br><br><br><br><br><br><br><br><br>
 
       <br><br>
      </div>
    
      <c:if test="${one.b_content ne null}">
         ${one.b_content}
      </c:if>
      
      <br><br><br><br><br><br><br>
 
         <hr>
      <div align="right">
        <c:if test="${one.writer == sessionScope.nickName}">

          <br>
           <button id="modifyBtn" class="btn btn-outline-secondary" data-post_no="${one.tp_boardid}"
           onclick="modifyGo();">글수정</button>
           <button id="deleteBtn" class="btn btn-outline-secondary" data-post_no="${one.tp_boardid}"
           onclick="deleteGo();">글삭제</button>
        <br><br>
        </c:if>
        </div>   
          <!--------------------- 글 작성자 프로필--------------------->  
         <div>       
             <div class="border p-4">
              <div align="center">
                <div>
                   <p style="width:100px">${one.tp_name}</p>
                </div>
                
      
                <button id="mvWriterPage" class="btn btn-outline-secondary" onclick="tpone()" style="height:40px;">Tv프로그램 정보</button>
                
         
                </div>  <!-- <div align="center"> -->
              </div> <!--<div class="border p-4">-->
         <br>
         <h3 align="left">댓글<h3>
     	 <ul id="replyList">
     	 </ul>
         	<table class='table table-striped table-bordered' >
			 	<tbody id="tbody">
			   		
			 	</tbody>
			 	<tfoot>
			 	<tfoot>
			 </table>	
      
         		<!-- 댓글 라인 -->
	         <div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">
    			<div id="showComment" style="text-align: center;"></div>
			</div>

				<!-- 댓글 작성창 -->
				<div id ="modi" class="modi">
				</div>
				
				<c:if test ="${sessionScope.nickName ne null}">        	
	    		<textarea class="form-control" rows="3" id="replyContent" placeholder="댓글을 입력하세요." style="width: 100%;" ></textarea>
				
	            <input type="button" class="btn btn-default" value="댓글 쓰기" id="replyWrite" onclick="writerReply()"
	            style ="background-color: #BBDEFB;float: right;">
	            </c:if>
				<br>
				<br>
				<br>
				
               
	    	</div>
		</div>
 
</main>
</div> <!-- /container -->
</body>
</html>