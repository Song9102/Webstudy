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
<style type="text/css">
.img{
	float:left;
	margin: 10px;
	border: 10px solid white;
}
ul{
	list-style: none;
	padding-left: 10;
}
.item {
  list-style-type: left;
  text-align: left;
}
.wrap {
  display: inline-block;
  text-align: left;
  float: left;
}
.container {
    display: inline-block;
    text-align: left;
}
.text {
    margin: 0;
    text-align: center;
}

</style>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home.do">Co-end,Go-start</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="home.do	">홈</a></li>
				<li class="item"><a href="board/list.do">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<!-- 로그인 안된상태 -->
						<c:if test="${ empty sessionScope.user }">
							<li class="item">
								<a href="member/login_form.do?loc=0">로그인</a>
							</li>
							<li class="item">
								<a href="member/insert_form.do?loc=0">회원가입</a>
							</li>
						</c:if>
						<!-- 로그인 된상태 -->
						<c:if test="${ not empty sessionScope.user }">
							<li class="item"><a href="member/logout.do?loc=0">로그아웃</a></li>
						</c:if>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>남해</h1>
				<p>남해 사진 갤러리</p>
			</div>
		</div>
	</div>
	
		<ul>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/namhae/양모리학교.jpg" width="300" height="300"></div>
								<p class="text">#남해 #동심 가득 남해여행 #양모리학교</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/namhae/섬이정원.jpg" width="300" height="300"></div>
								<p class="text">#남해 #동심 가득 남해여행 #섬이정원</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/namhae/독일마을.jpg" width="300" height="300"></div>
								<p class="text">#남해 #동심 가득 남해여행 #독일마을</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/namhae/해오름예술촌.jpg" width="300" height="300"></div>
								<p class="text">#남해 #동심 가득 남해여행 #해오름예술촌</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/namhae/원예예술촌.jpg" width="300" height="300"></div>
								<p class="text">#남해 #엄빠 취향저격 남해여행 #원예예술촌</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/namhae/두모마을.jpg" width="300" height="300"></div>
								<p class="text">#남해 #엄빠 취향저격 남해여행 #두모마을</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/namhae/보리암 & 금산산장.jpg" width="300" height="300"></div>
								<p class="text">#남해 #엄빠 취향저격 남해여행 #보리암 & 금산산장</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/namhae/다랭이마을.jpg" width="300" height="300"></div>
								<p class="text">#남해 #로맨틱 남해 커플여행 #다랭이마을</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/namhae/카페 보통날.jpg" width="300" height="300"></div>
								<p class="text">#남해 #로맨틱 남해 커플여행 #카페 보통날</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/namhae/상주은모래비치.jpg" width="300" height="300"></div>
								<p class="text">#남해 #로맨틱 남해 커플여행 #상주은모래비치</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/namhae/섬이정원.jpg" width="300" height="300"></div>
								<p class="text">#남해 #로맨틱 남해 커플여행 #섬이정원</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/namhae/헐스밴드.jpg" width="300" height="300"></div>
								<p class="text">#남해 #로맨틱 남해 커플여행 #헐스밴드</p>
							</div>
						</li>	
		</ul>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</body>
</html>