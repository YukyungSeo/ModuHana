<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${ path }/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<script>
	let json =  { 
			accountNo : 00000000000000
		}
	
	$.ajax({
		url : 'http://192.168.217.59:9990/HanaBank/account',
		method : 'post',
		data : JSON.stringify(json),
		contentType: "application/json",
		success : function(res) {
			console.log('성공');
		},
		error : function() {
			console.log('실패');
		}
	})
	</script>
</body>
</html>

