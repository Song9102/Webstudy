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
		width: 600px;
		margin: auto;
		margin-top: 50px;
}

input[type='button']{
	width: 100px;
}

textarea{
	width: 98%;
	height: 100px;
	color: #555;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.form-text{
	width: 98%;
	color: #555;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
}
   
</style>

<script type="text/javascript">

function modify(f){
	
	var b_subject = f.b_subject.value.trim();
	var b_content = f.b_content.value;
	
	if(b_subject==''){
		alert("제목을 입력하세요");
		f.b_subject.value='';
		f.b_subject.focus();
		return;
	}
	if(b_content==''){
		alert("내용을 입력하세요");
		f.b_content.value='';
		f.b_content.focus();
		return;
	}
	
	
	f.action='modify.do';
	f.submit();
	
}


</script>


</head>
<body>

</body>
<form>
	<input type="hidden" name="b_idx" value="${ param.b_idx }">
	<input type="hidden" name="page" value="${ param.page }">
	<div id="box">
		<div class="panel panel-primary">
			<div class="panel-heading">수정하기</div>
			<div class="panel-body">
				<table class="table">
					<tr>
						<th>제목</th>
						<td><input name="b_subject" class="form-text" value="${ vo.b_subject }"></td>
					</tr>			        
					<tr>
						<th>내용</th>
						<td>
							<textarea name="b_content" rows="" cols="">${ vo.b_content }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" class="btn btn-primary" value="수정하기" onclick="modify(this.form)">
							<input type="button" class="btn btn-success" value="메인화면" onclick="location.href='list.do'">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</form>
</html>