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
	<script src="${ path }/resources/assets/js/jquery-3.6.1.min.js"></script>
	<script>	
	let json = { 
			apiKey : 'LESNG48LEW5BGAPGSJSS'
    		, accountNo : '41209465170991'
    	}
	
	$.ajax({

		url : 'http://13.209.81.235/HanaBank/account',
		method : 'post',
		data : JSON.stringify(json),
		contentType: "application/json",
		success : function(res) {
			console.log('성공');
			console.log(res);
		},
		error : function() {
			alert('실패');
		}
	})
	</script>
</body>
</html>

