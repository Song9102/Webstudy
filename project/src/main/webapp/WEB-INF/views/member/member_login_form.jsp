<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 300px;
	margin: auto;
	margin-top: 100px;
}

table{
	width: 100%;
}

input[type=button]{
	width: 80px
}


</style>

<script type="text/javascript">
	$(document).ready(function(){
		//0.1초후에 show_message() 호출
		setTimeout(show_message,100);
		
	});
	
	
	
	function show_message(){

		//	login_form.do?reason=fail_id
		//	login_form.do?reason=fail_pwd
		
		if("${ param.reason eq 'fail_id' }"=="true"){
			alert('아이디가 틀렸습니다');
			return;
		}		
		
		if("${ param.reason eq 'fail_pwd' }"=="true"){
			alert('비밀번호가 틀렸습니다');
			return;
		}
	}


</script>


<script type="text/javascript">

function send(f){
	var m_id = f.m_id.value.trim();
	var m_pwd = f.m_pwd.value.trim();
	
	if(m_id==''){
		alert('아이디를 입력하세요');
		f.m_id.value='';
		f.m_id.focus();
		return;
	}
	if(m_pwd==''){
		alert('비밀번호를 입력하세요');
		f.m_pwd.value='';
		f.m_pwd.focus();
		return;
	}
	
	f.action='login.do?url=${ param.url }&loc=${ param.loc }';
	f.submit();
	
}

</script>


</head>
<body>
	<form>
		<input type="hidden" name="url" value="${ param.url }">
		<input type="hidden" name="loc" value="${ param.loc }">
		<div id="box">
			<div class="panel panel-primary">
		    	<div class="panel-heading">로그인</div>
		    	<div class="panel-body">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name = "m_id"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="m_pwd"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="button" class="btn btn-primary" value="로그인" onclick="send(this.form);">
								<input type="button" class="btn btn-info" value="게시판" onclick="location.href='../board/list.do'">
								<input type="button" class="btn btn-success" value="회원가입" onclick="location.href='insert_form.do'">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
</html>