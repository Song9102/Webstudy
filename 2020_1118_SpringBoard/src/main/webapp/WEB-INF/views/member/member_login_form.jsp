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
	width: 400px;
	margin: auto;
	margin-top: 200px;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		//0.1초후에 show_msg함수 호출 1000-> 1초
		setTimeout(show_msg,100);
	
			
	});
	
	function show_msg(){
		//login_form.do?reason=fail_id
		if("${ param.reason eq 'fail_id' }"=="true"){
			alert("등록되지 않은 아이디입니다");
			return;
		}
		
				
		//login_form.do?reason=fail_pwd
		if("${ param.reason eq 'fail_pwd' }"=="true"){
			alert("비밀번호가 맞지않습니다");
			return;
		}
	
		
	}
	
	
	
	
	
</script>




<script type="text/javascript">

	function send(f){
		
		//아이디 비밀번호 입력체크
		var m_id =f.m_id.value.trim();
		var m_pwd=f.m_pwd.value.trim();
		
		if(m_id==''){
			alert("아이디를 입력하세요")
			f.m_id.value="";
			f.m_id.foucs();
			return;
		}
		
		if(m_pwd==''){
			alert("비밀번호를 입력하세요")
			f.m_pwd.value="";
			f.m_pwd.foucs();
			return;
		}
		
		//전송
		f.action = "login.do"; //memberLoginAction
		f.submit();
		
	}

</script>


</head>
<body>
	<form>
		<input type="hidden" name="url" value="${ param.url }">
			<div id="box">
				<div class="panel panel-primary">
				<div  class="panel-heading">로그인</div>
				<div class="panel-body">
					<table>
						<tr>
							<th>아이디</th>
							<td><input name="m_id"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="m_pwd"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input class="btn btn-primary" type="button" value="로그인" onclick="send(this.form);">
								<input class="btn btn-info" type="button" value="메인화면" onclick="location.href='../board/list.do'">
								<input class="btn btn-success" type="button" value="회원 가입" onclick="location.href='insert_form.do'">
							</td>
						</tr>
					</table>
				</div>
				</div>
			</div>
	</form>
</body>
</html>