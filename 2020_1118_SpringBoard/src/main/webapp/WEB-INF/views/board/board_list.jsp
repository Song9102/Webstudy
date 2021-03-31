<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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

<style type="text/css">
	#box{
	    width: 800px;
	    margin: auto;
	    margin-top: 50px;
	    /* background: red; */
	}
	
	#title{
	    text-align: center;
	    font-size: 20pt;
	    font-weight: bold;
	    color: green;
	    text-shadow: 1px 1px 1px black;
	}
	
	a:hover{
	   text-decoration: none;
	}
</style>

<script type="text/javascript">
	function insert_form(){
		
		//로그인상태 체크
		if('${ empty user }'=='true'){
			if(confirm("로그인하신후 글쓰기가 가능합니다\n" +
					   "로그인 하시겠습니까?")==false) return;
			//로그인폼 이동
			location.href="../member/login_form.do";
			return;
		}
		
		//입력폼 띄우기
		location.href="insert_form.do";
	}

	//검색메뉴
	function find() {
		
		var search 		= $("#search").val();
		var search_text = $("#search_text").val().trim();
		
		if(search!='all' && search_text==''){
			alert('검색어를 입력해주세요');
			$("#search_text").val("");
			$("#search_text").focus();
			return;
		}
		
		//검색어를 붙여서 목록 요청
		location.href="list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);
	}
	
	//jQuery 초기화 이벤트
	$(document).ready(function(){
		
		var search = '${ param.search }';
		//alert('[' + search + ']');
		if(search=='')search = 'all';
		$("#search").val(search);
		
		if($("#search").val()=='null' || search=='all')
			$("#search_text").val('');
		
	});
	
	
</script>


</head>
<body>
	<div id="box">
	    <h1 id="title">::::게시판::::</h1>
	
	    <!-- 로그인 기능 -->
		<div style="text-align: right;">
		    <!-- 로그인 안된상태 -->
		    <c:if test="${ empty sessionScope.user }">
		    	<input  class="btn  btn-primary"  type="button" 
		    	        value="로그인"
		    	        onclick="location.href='../member/login_form.do'">
		    </c:if>
		    <!-- 로그인 된상태 -->
		    <c:if test="${ not empty sessionScope.user }">
		       <b>${ user.m_name }</b>님 환영합니다
		       <input  class="btn  btn-primary"  type="button" 
		               value="로그아웃"
		               onclick="location.href='../member/logout.do'">
		    </c:if>
		    
		</div>
		
		<div>
		    <input  class="btn  btn-primary"  type="button" value="글쓰기"
		            onclick="insert_form();">
		</div>
	    <div>
	      
	    	<!-- 내용 -->
	    	<table class="table">
	    		<!-- 제목 -->
	    		<tr class="success">
	    			<th>번호</th>
	    			<th width="50%">제목</th>
	    			<th>작성자</th>
	    			<th>작성일자</th>
	    			<th>조회수</th>
	    		</tr>
	    		
	    		<!-- 게시물이 없으면 -->
		        <c:if test="${ empty list }">
			        <tr>
			           <td colspan="5" align="center" >
				           <div style="color:red;">
				              게시물이 없습니다
				           </div>
			           <td>
			        </tr>   
		        </c:if>
		        
		        <!-- 게시물이 있으면 -->
		        <!-- for(BoardVo vo : list)  -->
		        <c:forEach var="vo"  items="${ list }">
		        	<tr>
		        		<td>${ vo.no }</td>
		        		<!-- 제목 -->
		        		<td>
		        		
		        		   <!-- 들여쓰기  -->
		                   <c:forEach begin="1"  end="${ vo.depth }">
		                       &nbsp;&nbsp;               
		                   </c:forEach>  
		      
		                   <!-- 답글표시  greater than-->  	
		                   <c:if test="${ vo.depth gt 0 }">	   
		        		   ㄴ
		        		   </c:if>
		        		   
		        		   <!-- 사용중인 게시물이면 -->
		        		   <c:if test="${ vo.b_use_yn eq 'y' }">
		        		        <a href="view.do?b_idx=${ vo.b_idx }&page=${ empty param.page ? 1 : param.page }&search=${ param.search }&search_text=${ param.search_text }">${ vo.b_subject }</a>
		        		   </c:if>
		        		   
		        		   <!-- 삭제상태의 게시물이면 -->
		        		   <c:if test="${ vo.b_use_yn eq 'n' }">
		        		       <font color=red>${ vo.b_subject }(삭제된 게시물)</font> 
		        		   </c:if>
		        		   
		        		   
		        		
		        		</td>
		        		<td>${ vo.m_name }</td>
		        		<td>${ fn:substring(vo.b_regdate,0,16) }</td>
		        		<td>${ vo.b_readhit }</td>
		        	</tr>
		        </c:forEach>
	    		
	    		<!-- 검색 메뉴 -->
	    		<tr>
	    			<td colspan="5" align="center">
	    				<div style="font-size: 10pt; margin-top: 20px;">
	    					
	    					<select id="search">
	    						<option value="all">전체보기</option>
	    						<option value="name">이름</option>
	    						<option value="subject">제목</option>
	    						<option value="content">내용</option>
	    						<option value="name_subject_content">이름+제목+내용</option>
	    					</select>
	    					<input id="search_text" value="${ param.search_text }">
	    					<input type="button" value="검색" onclick="find();">
	    					
	    				</div>
	    			</td>
	    		</tr>
	    		
	    		
	    		
	    		<!-- 페이지 메뉴 -->
	    		<tr>
	    			<td colspan="5" align="center">
	    				<div style="font-size: 15pt;">
	    					${ pageMenu }
	    				</div>
	    			</td>
	    		</tr>
	    		
	    	</table>
	    	
	    </div>
    
    </div>


</body>
</html>


