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
            <li class="active"><a href="home.do   ">홈</a></li>
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
            <h1>여수</h1>
            <p>여수 사진 갤러리</p>
         </div>
      </div>
   </div>
    <ul>
                 <li class="item">
                             <div class="wrap">
                                 <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/여수해상케이블카.jpg" width="300" height="300"></div>
                              <p class="text">#여수 #엄빠 취향 저격 #여수해상케이블카</p>
                           </div>
                       </li>
                  
                     <li class="item">
                           <div class="wrap">
                              <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/여수예술랜드.jpg" width="300" height="300"></div>
                              <p class="text">#여수 #엄빠 취향 저격 #여수예술랜드</p>
                           </div>
                     </li>

                  
                  <li>
                     <div class="wrap">
                        <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/향일암.jpg" width="300" height="300"></div>
                        <p class="text">#여수 #엄빠 취향 저격 #향일암</p>
                     </div>
                  </li>
                  <li>
                     <div class="wrap">
                        <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/유월드루지테마파크.jpg" width="300" height="300"></div>
                        <p class="text">#여수 #신나는 액티비티 #유월드루지테마파크</p>
                     </div>
                  </li>
                  <li>
                     <div class="wrap">
                        <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/해양레일바이크.jpg" width="300" height="300"></div>
                        <p class="text">#여수 #신나는 액티비티 #해양레일바이크</p>
                     </div>
                  </li>
                  <li>
                     <div class="wrap">
                                                <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/해상케이블카.jpg" width="300" height="300"></div>
                        <p class="text">#여수 #신나는 액티비티 #해상케이블카</p>
                     </div>
                  </li>
                  <li>
                     <div class="wrap">
                                                <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/무슬목해변.jpg" width="300" height="300"></div>
                        <p class="text">#여수 #여수 바다 즐기기 #무슬목해변</p>
                     </div>
                  </li>
                  <li>
                     <div class="wrap">
                                                <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/갤러리안.jpg" width="300" height="300"></div>
                        <p class="text">#여수 #여수 바다 즐기기 #갤러리안</p>
                     </div>
                  </li>
                  
                  <li>
                     <div class="wrap">
           <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/만성리검은모래해변.jpg" width="300" height="300"></div>
                        <p class="text">#여수 #여수 바다 즐기기 #만성리검은모래해변</p>
                     </div>
                  </li>
                  <li>
                     <div class="wrap">
                                                <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/비스토니커피.jpg" width="300" height="300"></div>
                        <p class="text">#여수 #여수 바다 즐기기 #비스토니커피</p>
                     </div>
                  </li>
                  <li>
                     <div class="wrap">
                                                <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/와이드커피스탠드.jpg" width="300" height="300"></div>
                        <p class="text">#여수 #여수 인생샷 투어 #와이드커피스탠드</p>
                     </div>
                  </li>
                  <li>
                     <div class="wrap">
                                                <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/고소동벽화마을.jpg" width="300" height="300"></div>
                        <p class="text">#여수 #여수 인생샷 투어 #고소동벽화마을</p>
                     </div>
                  </li>
                  <li>
                     <div class="wrap">
                                                <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/하이클래스153.jpg" width="300" height="300"></div>
                        <p class="text">#여수 #여수 인생샷 투어 #하이클래스153</p>
                     </div>
                  </li>
                  <li>
                     <div class="wrap">
                                                <div class="img"><img src="${ pageContext.request.contextPath }/resources/images/img/Yeosu/테디베어뮤지엄.jpg" width="300" height="300"></div>
                        <p class="text">#여수 #여수 인생샷 투어 #테디베어뮤지엄</p>
                     </div>
                  </li>
                  
                 
      </ul>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</body>
</html>