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
	width: 440px;
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

<script type="text/javascript">

$(document).ready(function(){
	//ID입력창에서 키를 뗄때마다 중복체크
	$("#m_id").keyup(function(){
		var m_id = $("#m_id").val();
		
		if(m_id.length < 4){
			$("#id_msg").css("color","red");
			$("#id_msg").html("아이디는 4자리 이상을 사용하세요");
			$("#btn_register").attr("disabled",true);
			return;
		}
		
		
		//Ajax를 이용해서 중복ID체크
		$.ajax({
			url:"check_id.do",		//MemberCheckIdAction
			data: {"m_id":m_id},	//parameter
			dataType: "json",		//결과형(Type)
			success:function(res_data){
				//res_data = {"result":true or false}
				if(res_data.result==false){
					$("#id_msg").css("color","red");
					$("#id_msg").html("중복된 아이디 입니다");
					$("#btn_register").attr("disabled",true);
					return;
				}
				
				$("#id_msg").css("color","green");
				$("#id_msg").html("사용가능한 아이디 입니다");
				
				$("#btn_register").attr("disabled",false);
				
			},
			error:function(err){
				alert(err.reponseText);
			}
		});
		
	});
	
})

</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

function send(f){
	var m_name=$("#m_name").val().trim();
	var m_id=$("#m_id").val().trim();
	var m_pwd=$("#m_pwd").val().trim();
	var m_nickname=$("#m_nickname").val().trim();
	var m_age=$("#m_age").val().trim();
	var m_sex=$("m_sex").val();
	
	if(m_name==''){
		alert("이름을 입력하세요");
		m_name=$("#m_name").val("");
		m_name=$("#m_name").focus();
		return;
	}
	if(m_id==''){
		alert("id를 입력하세요");
		m_id=$("#m_id").val("");
		m_id=$("#m_id").focus();
		return;
	}
	if(m_pwd==''){
		alert("비밀번호를 입력하세요");
		m_pwd=$("#m_pwd").val("");
		m_pwd=$("#m_pwd").focus();
		return;
	}
	if(m_nickname==''){
		alert("닉네임을 입력하세요");
		m_zipcode=$("#m_nickname").val("");
		m_zipcode=$("#m_nickname").focus();
		return;
	}
	if(m_age==''){
		alert("나이 입력하세요");
		m_addr=$("#m_age").val("");
		m_addr=$("#m_age").focus();
		return;
	}
	
	f.action="insert.do";
	f.submit();
}


</script>

</head>
<body>
<form >	
	<div id="box">
		<div class="panel panel-primary">
			<div class="panel-heading">회원가입</div>
			<div class="panel-body">
				<table>
					<tr>
						<th>이름</th>
						<td><input name="m_name" id="m_name" class="form-text"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<input name="m_id" id="m_id" class="form-text"><br>
							<span id="id_msg"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="m_pwd" id="m_pwd" class="form-text"></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>
							<input name="m_nickname" id="m_nickname" class="form-text">
						</td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input name="m_age" id="m_age" class="form-text"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<input type="radio" id="male" name="m_sex" value="남자" checked="checked">남자
							<input type="radio" id="female" name="m_sex" value="여자">여자
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" id="btn_register" class="btn btn-success" value="가입하기" disabled="disabled" onclick="send(this.form);">
							<input type="button" value="메인화면" class="btn btn-primary" onclick="location.href='../board/list.do'">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</form>	
</body>
</html>