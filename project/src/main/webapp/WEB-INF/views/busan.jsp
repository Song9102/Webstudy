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
				<h1>부산</h1>
				<p>부산 사진 갤러리</p>
			</div>
		</div>
	</div>
	
		<ul>
					  <li class="item">
                       	   <div class="wrap">
                           		<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/다대포해변공원.jpg" width="250" height="250"></div>
                        		<p class="text">#부산 #가을여행 #다대포해변공원</p>
                           </div>
                  	  </li>
                  
	                  <li class="item">
	                        <div class="wrap">
	                           	<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/더베이101.jpg" width="250" height="250"></div>
	                        	<p class="text">#부산 #가을여행 #더베이101</p>
	                     	</div>
	                  </li>

						
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/동래읍성.jpg" width="250" height="250"></div>
								<p class="text">#부산 #가을여행 #동래읍성</p>
							</div>
						</li>
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/아홉산숲.jpg" width="250" height="250"></div>
								<p class="text">#부산 #가을여행 #아홉산숲</p>
							</div>
						</li>
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/우암동도시숲.jpg" width="250" height="250"></div>
								<p class="text">#부산 #가을여행 #우암동도시숲</p>
							</div>
						</li>
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/을숙도생태공원.jpg" width="250" height="250"></div>
								<p class="text">#부산 #가을여행 #을숙도생태공원</p>
							</div>
						</li>
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/청사포다릿돌전망대.jpg" width="250" height="250"></div>
								<p class="text">#부산 #가을여행 #청사포다릿돌전망대</p>
							</div>
						</li>
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/청학배수지전망대.jpg" width="250" height="250"></div>
								<p class="text">#부산 #가을여행 #청학배수지전망대</p>
							</div>
						</li>
						
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/카린영도플레이스.jpg" width="250" height="250"></div>
								<p class="text">#부산 #영도 스페셜 코스 #카린영도플레이스</p>
							</div>
						</li>
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/카페 엣지993.jpg" width="250" height="250"></div>
								<p class="text">#부산 #가을여행 #카페 엣지993</p>
							</div>
						</li>
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/태종대.jpg" width="250" height="250"></div>
								<p class="text">#부산 #영도 스페셜 코스 #태종대</p>
							</div>
						</li>
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/해동용궁사.jpg" width="250" height="250"></div>
								<p class="text">#부산 #가을여행 #해동용궁사</p>
							</div>
						</li>
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/호천마을.jpg" width="250" height="250"></div>
								<p class="text">#부산 #가을여행 #호천마을</p>
							</div>
						</li>
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/황령산봉수대.jpg" width="250" height="250"></div>
								<p class="text">#부산 #가을여행 #황령산봉수대</p>
							</div>
						</li>
						
						<li>
							<div class="wrap">
								<div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/busan/흰여울문화마을.jpg" width="250" height="250"></div>
								<p class="text">#부산 #영도 스페셜 코스 #흰여울문화마을</p>
							</div>
						</li>
		</ul>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</body>
</html>