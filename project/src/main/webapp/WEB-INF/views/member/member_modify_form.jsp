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
#box{
	width: 400px;
	margin: auto;
	margin-top: 50px;
}

th{
	width: 80px;
	height: 50px;
}

.form-text{
	width: 200px;
	display: inline-block;
	height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
}

</style>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script type="text/javascript">

$(document).ready(function(){
	if('${ vo.m_grade }'=='일반'){
		$("#m_grade1").attr("checked",true);
		$("#m_grade1").attr("disabled",false);
	}else{
		$("#m_grade2").attr("checked",true);
		$("#m_grade1").attr("disabled",false);
		$("#m_grade2").attr("disabled",false);
	}
});

function send(f){
	var m_name=$("#m_name").val().trim();
	var m_pwd=$("#m_pwd").val().trim();
	var m_zipcode=$("#m_zipcode").val().trim();
	var m_addr=$("#m_addr").val().trim();
	var m_grade=$("m_grade").val();
	
	if(m_name==''){
		alert("이름을 입력하세요");
		m_name=$("#m_name").val("");
		m_name=$("#m_name").focus();
		return;
	}
	if(m_pwd==''){
		alert("비밀번호를 입력하세요");
		m_pwd=$("#m_pwd").val("");
		m_pwd=$("#m_pwd").focus();
		return;
	}
	if(m_zipcode==''){
		alert("우편번호를 입력하세요");
		m_zipcode=$("#m_zipcode").val("");
		m_zipcode=$("#m_zipcode").focus();
		return;
	}
	if(m_addr==''){
		alert("주소를 입력하세요");
		m_addr=$("#m_addr").val("");
		m_addr=$("#m_addr").focus();
		return;
	}
	
	f.action="modify.do";
	f.submit();
}

function find_addr(){
   new daum.Postcode({
        oncomplete: function(data) {
            //선택한 주소를 각 항복(우편번호/주소)로 넣는다
        	$("#m_zipcode").val(data.zonecode);
            $("#m_addr").val(data.address);
        }
    }).open();
}


</script>

</head>
<body>
<form>	
	<div id="box">
		<div class="panel panel-primary">
			<div class="panel-heading">회원정보수정</div>
			<div class="panel-body">
				<table>
					<tr>
						<th>이름</th>
						<td><input name="m_name" id="m_name" class="form-text" value="${ vo.m_name }"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<input name="m_id" id="m_id" class="form-text" value="${ vo.m_id }" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="m_pwd" id="m_pwd" class="form-text" value="${ vo.m_pwd }"></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>
							<input name="m_zipcode" id="m_zipcode" class="form-text" value="${ vo.m_zipcode }">
							<input type="button" value="주소검색" class="btn btn-info" onclick="find_addr();">
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input name="m_addr" id="m_addr" class="form-text" value="${ vo.m_addr }"></td>
					</tr>
					<tr>
						<th>등급</th>
						<td>
							<input type="radio" name="m_grade" id="m_grade1" disabled="disabled" value="일반">일반
							<input type="radio" name="m_grade" id="m_grade2" disabled="disabled" value="관리자">관리자
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="hidden" name="m_idx" value="${ vo.m_idx }">
							<input type="button" id="btn_register" value="수정하기" class="btn btn-success" onclick="send(this.form);">
							<input type="button" value="목록보기" class="btn btn-primary" onclick="location.href='list.do'">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</form>	
</body>
</html>