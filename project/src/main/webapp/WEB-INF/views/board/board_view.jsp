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
	width: 700px;
	margin: auto;
	margin-top: 30px;
}

th{
	background: #dddddd;
}

td{
	background: #eeeeee;
}

caption{
	font-size: 20pt;
	color: #222222;
	font-weight: bold;
	text-align: center;
}

.buttons{
	text-align: center;
}

</style>

<script type="text/javascript">

function del(){
	
	if(confirm("정말 삭제하시겠습니까?")==false) return;
	
	location.href="delete.do?b_idx=${ vo.b_idx }&page=${ param.page }";
}


function modify2(){
	
	location.href="modify_form.do?b_idx=${ vo.b_idx }&page=${ param.page }";
	
}

function like(){

	location.href="like.do?b_idx=${ vo.b_idx }&page=${ param.page }";
	
}



</script>

</head>
<body>
<form>
	<input type="hidden" name="b_idx" value="${ vo.b_idx }">
	<input type="hidden" name="b_subject" value="${ vo.b_subject }">
	<input type="hidden" name="b_content" value="${ vo.b_content }">
	<div id="box">
		<table class="table">
			<caption>---게시판 상세보기---</caption>
			<tr>
				<th>번호</th>
				<td>${ vo.b_idx }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ vo.m_nickname }</td>
			</tr>
			<tr>
				<th>조회수/추천수</th>
				<td>${ vo.b_readhit }/${ vo.b_like } </td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${ vo.b_subject }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td style="min-height: 60px;">
					${ vo.b_content }
				</td>
				
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${ vo.b_regdate }</td>
			</tr>
			<tr>
				<td colspan="2" class="buttons">
					<input type="button" class="btn btn-primary" value="목록보기" 
							onclick="location.href='list.do?page=${ param.page }'">
					<input type="button" class="btn btn-success" value="추천하기" onclick="like();">
					<c:if test="${ (user.m_idx eq vo.m_idx) }">
						<input type="button" class="btn btn-danger" value="삭제하기" onclick="del();">
						<input type="button" class="btn btn-info" value="수정하기" onclick="modify2();">
					</c:if>
				</td>
			</tr>
			
		</table>	
</div>
</form>
</body>
</html>