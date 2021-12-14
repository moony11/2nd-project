<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="com.br.model.member.memberDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트 - 관리자</title>
</head>
<body>
	<br><br>
	<b><font size="6" color="gray">전체 회원정보</font></b>
	<br><br>
	
	<table>	
		<tr align="center">
			<td id=title>아이디</td>
			<td id=title>비밀번호</td>
			<td id=title>닉네임</td>
			<td id=title>이름</td>
			<td id=title>생년월일</td>
			<td id=title>이메일</td>
			<td id=title>전화</td>
		</tr>
		
		<c:set var="memberList" value="${requestScope.memberList}"/>
		<c:forEach var="member" items="${memberList}">
			<tr>
				<td>${member.id}</td>
				<td>${member.password}</td>
				<td>${member.nickName}</td>
				<td>${member.name}</td>
				<td>${member.birth}</td>
				<td>${member.mail}</td>
				<td>${member.phone}</td>
			</tr>
		</c:forEach>	
	</table>
</body>
</html>