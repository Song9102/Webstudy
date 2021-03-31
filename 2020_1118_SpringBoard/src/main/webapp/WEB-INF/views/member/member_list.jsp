<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
  <%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 사용설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_insert").click(function(){
			location.href="insert_form.do";
		});
	});

</script>
<script type="text/javascript">

	function del(f) {

		if (confirm("정말 삭제하시겠습니까?") == false)
			return;
		f.action = "delete.do";
		f.submit();
	}

	function modify_form(f) {

		f.action = "modify_form.do"
		f.submit();
	}
</script>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#main_box {
	width: 1000px;
	margin: auto;
}

#title {
	margin-top: 20px;
	text-align: center;
	font-size: 25pt;
	font-weight: bold;
	color: navy;
	text-shadow: 1px 1px 1px black;
}
</style>

</head>
<body>
	<div id="main_box">
		<h1 id="title">회원목록</h1>
		<div style="text-align: right; magin-top: 20px; magin-bottom: 10px;">
			<input id="btn_insert" class="btn btn-primary" type="button"
										value="회원등록" onclick="location.href= 'insert_form.do' "> 
				<input id="btn_insert" class="btn btn-primary" type="button" value="회원등록2"
																onclick="location.href= 'insert_form2.do' ">
		</div>
		<div>
			<table class="table">
				<!--제목  -->
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>회원등급</th>
					<th>아이피</th>
					<th>등록일자</th>
					<th>비고</th>
				</tr>

				<!-- 데이터 출력  -->
				<!-- for(Member Vo : list -->
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${	vo.m_idx }</td>
						<td>${	vo.m_name }</td>
						<td>${	vo.m_id }</td>
						<td>${	vo.m_display_pwd }</td>
						<td>${	vo.m_zipcode }</td>
						<td>${	vo.m_addr }</td>
						<td>${	vo.m_grade }</td>
						<td>${	vo.m_ip }</td>
						<td>${	fn:substring(vo.m_regdate,0,10) }</td>
						<td>
							<form>
								<input type="hidden" name="m_idx" value="${vo.m_idx }">
								<input class="btn btn-info" type="button" value="수정"
									onclick="modify_form(this.form)"> <input
									class="btn btn-success" type="button" value="삭제"
									onclick="del(this.form)">
							</form>
						</td>
					</tr>
				</c:forEach>

			</table>
		</div>

	</div>


</body>
</html>