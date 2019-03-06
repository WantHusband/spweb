<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap 4 Website Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

#hello {
	color: white;
	background-color: Black;
}

#ya {
	text-align: right;
}
</style>
</head>
<body>

	<div class="jumbotron text-center" style="margin-bottom: 0" id="hello">
		<div id="ya">
			<h1 style="font-size: 70px; font-family: Forte;">Spring Test</h1>
			<p style="font-size: 30px; font-family: Century Gothic;">It's
				will be okay</p>
		</div>
	</div>

	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-black w3-card">
			<a
				class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right"
				href="javascript:void(0)" onclick="myFunction()"
				title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> <a
				href="#" class="w3-bar-item w3-button w3-padding-large">HOME</a>
				<c:url value="/test/yamma" var="yamma"/>
				<a href="${yamma}"	class="w3-bar-item w3-button w3-padding-large w3-hide-small" >Menu1</a>
		</div>
		
	</div>
	<div class="jumbotron text-center" style="margin-bottom:0px; background-color: black; color:white; " id="hello">
ALL RIGHTS RESERVED.&copy;  GSS
</div>
</body>
</html>
