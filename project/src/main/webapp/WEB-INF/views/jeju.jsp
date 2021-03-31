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
				<h1>제주</h1>
				<p>제주 사진 갤러리</p>
			</div>
		</div>
	</div>
	
		<ul class="board_list">
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/마노르블랑.jpg" width="300" height="300"></div>
								<p class="text">#제주 #서부 동백 로드 #마노르블랑</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/백약이오름.jpg" width="300" height="300"></div>
								<p class="text">#제주 #오름여행 #백약이오름</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/법환포구둘레길.jpg" width="300" height="300"></div>
								<p class="text">#제주 #나만 알고 싶은 여행지 #법환포구둘레길</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/상효원수목원.jpg" width="300" height="300"></div>
								<p class="text">#제주 #서부 동백 로드 #상효원수목원</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/소천지.jpg" width="300" height="300"></div>
								<p class="text">#제주 #맛집 투어 #소천지</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/아부오름.jpg" width="300" height="300"></div>
								<p class="text">#제주 #오름 여행 #아부오름</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/아줄레주.jpg" width="300" height="300"></div>
								<p class="text">#제주 #가을에 만나는 제주 #아줄레주</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/용눈이오름.jpg" width="300" height="300"></div>
								<p class="text">#제주 #가을에 만나는 제주 #용눈이오름</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/월령선인장군락지.jpg" width="300" height="300"></div>
								<p class="text">#제주 #나만 알고 싶은 제주여행지 #월령선인장군락지</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/제주 코코티에.jpg" width="300" height="300"></div>
								<p class="text">#제주 #제주 남해안 투어 #제주 코코티에</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/지미봉.jpg" width="300" height="300"></div>
								<p class="text">#제주 #맛집 투어 #지미봉</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/카멜리아힐.jpg" width="300" height="300"></div>
								<p class="text">#제주 #서부 동백 로드 #카멜리아힐</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/카페동백.jpg" width="300" height="300"></div>
								<p class="text">#제주 #오름여행 #카페동백</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/카페록록.jpg" width="300" height="300"></div>
								<p class="text">#제주 #맛집 투어 #카페록록</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/큰엉해안경승지.jpg" width="300" height="300"></div>
								<p class="text">#제주 #제주 남해안 투어 #큰엉해안경승지</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/팜파스농장.jpg" width="300" height="300"></div>
								<p class="text">#제주 #가을에 만나는 제주 #팜파스농장</p>
							</div>
						</li>
						<li class="item">
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/jeju/한림공원.jpg" width="300" height="300"></div>
								<p class="text">#제주 #나만 알고 싶은 제주여행지 #한림공원</p>
							</div>
						</li>
		</ul>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</body>
</html>