
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 사용설정 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
#box {
	width: 600px;
	margin: auto;
	margin-top: 50px;
}
</style>

<script type="text/javascript">
	/*JQuery 초기화  */
	$(document).ready(function() {
		
		//관리자 or 일반 check
		if('${vo.m_grade}'=='일반'){
			$("#m_grade1").attr("checked",true);
		}else{
			$("#m_grade2").attr("checked",true)
		}
		 
		
		// m_id => ReadOnly로 변경(읽기전용으로 변경)
		$("#m_id").attr("readonly", true);

		//btn_register => disabled=false(활성화)
		$("#btn_register").attr("disabled", false);

	});
</script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function send(f) {
		var m_name = f.m_name.value.trim();
		var m_pwd = f.m_pwd.value.trim();

		if (m_name == '') {
			alert("이름을 입력하세요");
			f.m_name.value = "";
			f.m_name.focus();
			return;
		}

		if (m_pwd == '') {
			alert("비밀번호를 입력하세요");
			f.m_pwd.value = "";
			f.m_pwd.focus();
			return;
		}

		if (confirm("정말 수정하시겠습니까?") == false)
			return;
		f.action = "modify.do"//visitIsertAction
		f.submit();
	}

	//주소검색
	function find_addr() {
		new daum.Postcode({
			oncomplete : function(data) {
				//data = { "zonecode" : "08768" , "address": "서울관악", "roadAddress" : "도로명주소" }
				// 선택한 주소를 각 항목 (우편번호/주소) 입력
				$("#m_zipcode").val(data.zonecode);
				$("#m_addr").val(data.address);
			}
		}).open();
	};
</script>


</head>
<body>
	<form action="">
		<div id="box">
			<div class="panel panel-primary">
				<div class="panel-heading">회원 수정</div>
				<div class="panel-body">
					<table class="table">
						<tr>
							<th>이름</th>
							<td><input name="m_name" value="${vo.m_name }"></td>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input name="m_id" value="${vo.m_id }"
								readonly="readonly"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="m_pwd" 
								value="${vo.m_pwd }"></td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td><input name="m_zipcode" id="m_zipcode" value="${vo.m_zipcode }">
								 <input type="button" value="주소검색" onclick="find_addr();"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input name="m_addr" id="m_addr" 
								value="${vo.m_addr }"></td>
						</tr>
						
						<tr>
							<th>등급</th>
							<td>
								<input type="radio" name="m_grade"  id="m_grade1" value="일반" > 일반
								<input type="radio" name="m_grade"  id="m_grade2" value="관리자"> 관리자
							</td>
						</tr>
						
						<tr>
							<td colspan="2" style="text-align: center">
							<input type="hidden" name="m_idx" value="${vo.m_idx }"> 
							<input class="btn btn-primary" id=btn_register type="button" value="수정하기" onclick="send(this.form);"> 
							<input class="btn btn-success" type="button" value="홈으로" onclick="location.href='list.do'"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
</html>