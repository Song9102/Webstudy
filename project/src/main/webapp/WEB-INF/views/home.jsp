<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/bootstrap.css"> 
<title>Project name</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home.do">Team Project</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="home.do	">홈</a></li>
				<li><a href="board/list.do">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<!-- 로그인 안된상태 -->
						<c:if test="${ empty sessionScope.user }">
							<li>
								<a href="member/login_form.do?loc=0">로그인</a>
							</li>
							<li>
								<a href="member/insert_form.do?loc=0">회원가입</a>
							</li>
						</c:if>
						<!-- 로그인 된상태 -->
						<c:if test="${ not empty sessionScope.user }">
							<li><a href="member/logout.do?loc=0">로그아웃</a></li>
						</c:if>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>Co-end,Go-start</h1>
				<p>코로나로 인해 지친 당신 웹으로 떠나라</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">		
						<img src="${ pageContext.request.contextPath }/resources/images/img/busan/다대포해변공원.jpg" onclick="location.href='${ pageContext.request.contextPath }/busan.do'">
				</div>
				<div class="item">
					<img src="${ pageContext.request.contextPath }/resources/images/img/jeju/마노르블랑.jpg" onclick="location.href='${ pageContext.request.contextPath }/jeju.do'">
				</div>
				<div class="item">
					<img src="${ pageContext.request.contextPath }/resources/images/img/namhae/두모마을.jpg" onclick="location.href='${ pageContext.request.contextPath }/namhae.do'">
				</div>
				<div class="item">
					<img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/여수해양레일바이크.jpg" onclick="location.href='${ pageContext.request.contextPath }/yeosu.do'">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</body>
</html>