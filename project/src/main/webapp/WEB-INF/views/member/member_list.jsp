<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
*{
	margin: 0;
	padding: 0;
}

#main_box{
	width: 1200px;
	margin: auto;
}

#title{
	margin-top: 20px;
	text-align: center;
	font-size: 25pt;
	font-weight: bold;
	color: #777777;
	text-shadow: 1px 1px 1px black;
}

table th, td{
	text-align: center;
}

</style>

<script type="text/javascript">

function del(f){
	
	var m_idx = f.m_idx.value;
	
	if(confirm("정말 삭제하시겠습니까?")==false)
		return;		
	location.href="delete.do?m_idx=" + m_idx;
	
	
	
}

function modify(f){
	
	var m_idx = f.m_idx.value;
	
	location.href="modify_form.do?m_idx=" + m_idx;
	
}



</script>


</head>
<body>

	<div id="main_box">		
		<h1 id="title">회원목록</h1>
		<div style="text-align:right; margin-top:30px; margin-right: 20px;">
			<input type="button" value="회원등록"  class="btn btn-primary" onclick="location.href='insert_form.do'">
		</div>
		
		<div>
			<table class="table table-striped" style="margin-top:10px;">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>닉네임</th>
					<th>나이</th>
					<th>성별</th>
					<th>가입일자</th>
					<th></th>
				</tr>
				
				<c:forEach var="vo" items="${ list }">
					<tr>
						<td>${ vo.m_idx }</td>
						<td>${ vo.m_name }</td>
						<td>${ vo.m_id }</td>
						<td>${ vo.m_display_pwd }</td>
						<td>${ vo.m_nickname }</td>			
						<td>${ vo.m_age }</td>
						<td>${ vo.m_sex }</td>
						<td>${ fn:substring(vo.m_regdate,0,10) }</td>
						<td>
							<form>
								<input type="hidden" name="m_idx" value="${ vo.m_idx }">
								<input type="button" class="btn btn-success" value="수정" onclick="modify(this.form);">
								<input type="button" class="btn btn-danger" value="삭제" onclick="del(this.form);">
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

</body>
</html>