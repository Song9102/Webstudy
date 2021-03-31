	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- Bootstrap 사용설정 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style>
		#box{
			width: 600px;
			margin: auto;
			margin-top: 50px;
			
		}
	</style>
	
	<script type="text/javascript">
		/*JQuery 초기화  */
	$(document).ready(function(){
		
		//중복ID 버튼이 눌리면
		$("#btn_check_id").click(function(){
			var m_id = $("#m_id").val();
		
			if(m_id==''){
				alert("아이디를 입력하세요");
				$("#m_id").val("");
				$("#m_id").focus();
				return;
			}
			
		//Ajax를 이용하여 중복아이디 체크
		 $.ajax({ 
			 url:"check_id.do",   //MemberCheckIdAction
			 data: {"m_id":m_id}, //Parameter
			 dataType:"json",
			 success: function(res_data){
				//res_data={"result": False or True}	 
				if(res_data.result==false){
					alert("이미 사용중인 아이디입니다.");
					return;
				}
				if (confirm("사용가능한 아이디입니다\n 사용하시겠습니까?")==false) return;
					
				// m_id => ReadOnly로 변경(읽기전용으로 변경)
				$("#m_id").attr("readonly",true);
				
				//btn_register => disabled=false(활성화)
				$("#btn_register").attr("disabled",false);
				
			 },
			 error: function(err){
				 alert(err.responseText);
			 }
		 });
			
		});
		
	});

	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	function send(f){
		var m_name = f.m_name.value.trim();
		var m_pwd = f.m_pwd.value.trim();
		
		if(m_name==''){
			alert("이름을 입력하세요");
			f.m_name.value="";
			f.m_name.focus();
			return;
		}	
		
		if(m_pwd==''){
			alert("비밀번호를 입력하세요");
			f.m_pwd.value="";
			f.m_pwd.focus();
			return;
		}	
		
		f.action="insert.do"//visitIsertAction
		f.submit();
	}
	
	//주소검색
	function find_addr(){
	  new daum.Postcode({
	        oncomplete: function(data) {
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
					      <div class="panel-heading">회원 가입</div>
					      <div class="panel-body">
	<table class="table">
		<tr>
			<th>이름</th>
			<td><input name="m_name" id="m_name"></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input name="m_id" id="m_id">
				<input type="button"  id="btn_check_id" value="중복ID체크">
				
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="m_pwd" id="m_pwd"></td>
		</tr>
		<tr>
			<th>우편번호</th>
				<td>
					<input name="m_zipcode" id="m_zipcode">
					<input type="button" value="주소검색" onclick="find_addr();">
				</td>
		</tr>
		<tr>
			<th>주소</th>
				<td><input name="m_addr" id="m_addr" size="60" ></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center">
				   	<input class="btn btn-primary" id=btn_register type="button" value="가입하기"  
				   														disabled="disabled" onclick="send(this.form);">
				   	<input class="btn btn-success" type="button" value="메인화면"
								onclick="location.href='../board/list.do'"></td>

		</tr>
				</table>
			</div>
		</div>
	</div>	
	</form>
	</body>
	</html>