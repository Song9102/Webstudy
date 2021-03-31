<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">

#box{
	width: 1200px;
	margin: auto;
	margin-top: 50px;
}

#title{
	text-align: center;
	font-size: 20pt;
	font-weight: bold;
	color: green;
}

#menu{
	text-align: right;
}

th,td{
	text-align: center;
}

a{
	text-decoration: none;
	color: #333333;
}

a:hover{
	text-decoration: none;
	color: #777777;
}

input[type=button] {
	width: 100px;
}

</style>

<script type="text/javascript">

function board_insert(){
	
	//로그인 상태 체크
	if("${ empty sessionScope.user }"=="true"){
		if(confirm("로그인 후에 등록가능 합니다\n로그인 창으로 이동하시겠습니까?")==false) return;
		
		//로그인 폼으로 이동
		location.href="${ pageContext.request.contextPath }/member/login_form.do";
		
		return;
	}
	
	//로그인 됐으면 글쓰기창으로 이동
	location.href="insert_form.do"
}




</script>

</head>
<body>
	<div id="box">
		<h1 id="title">요청 게시판</h1>
		
		<div id="menu">
			<input type="button" class="btn btn-info" value="홈" onclick="location.href='${ pageContext.request.contextPath }/home.do'">
			<br>
			<!-- 로그인 안된상태 -->
			<c:if test="${ empty sessionScope.user }">
				<input type="button" class="btn btn-primary" value="로그인" onclick="location.href='${ pageContext.request.contextPath }/member/login_form.do?loc=1'">
			</c:if>
			<!-- 로그인 된상태 -->
			<c:if test="${ not empty sessionScope.user }">
				${ user.m_nickname }님 환영합니다
				<input type="button" class="btn btn-warning" value="로그아웃" onclick="location.href='${ pageContext.request.contextPath }/member/logout.do?loc=1'">
			</c:if>
			<br>	
			<input type="button" class="btn btn-success" value="글쓰기" onclick="board_insert();">
		</div>
		
		
		<div>
			<table class="table table-striped" style="margin-top:10px;">
				<tr class="success">
					<th>번호</th>
					<th width="40%" style="text-align: left">제목</th>
					<th>닉네임</th>
					<th>작성일자</th>
					<th>조회수</th>
					<th>추천수</th>
				</tr>
				
				<c:if test="${ empty list }">
					<tr>
						<td>
							<div>
								게시물이 없습니다	
							</div>
						</td>
					</tr>
				</c:if>
			
				<c:if test="${ not empty list }">
					<c:forEach var="vo" items="${ list }">
						<tr>
							<td>${ vo.b_idx }</td>
							<td style="text-align: left">
								<a href="view.do?b_idx=${ vo.b_idx }&page=${ empty param.page ? 1 : param.page }">
										${ vo.b_subject }
								</a>
								
							</td>
							<td>${ vo.m_nickname }</td>
							<td>${ fn:substring(vo.b_regdate,0,16) }</td>
							<td>${ vo.b_readhit }</td>
							<td>${ vo.b_like }</td>
						</tr>
					</c:forEach>
					
				</c:if>
			</table>
		</div>
	</div>	
</body>
</html>