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
       width: 700px;
       margin: auto;
       margin-top: 30px;
   }
   
   th{
      background: #ccccff;
   }
   
   caption {
	   font-size: 16pt;
	   color: #6699ff;
	   font-weight: bold;
	   text-align: center;
	   text-shadow: 1px 1px 1px black;
   }
</style>


<script type="text/javascript">
	function  reply_form(){
		
		//로그인여부
		if('${ empty user }'=='true'){
			
			if(confirm("답글쓰기는 로그인이 필요합니다\n로그인 하시겠습니까?")==false)return;
			
			//로그인폼으로 이동(현재위치: /board/view.do)
			//       http://localhost:9090/myapp2/board/view.do?b_idx=5
			location.href = "../member/login_form.do?url=" + encodeURIComponent(location.href) ;
			
			return;
		}
		
		//답글폼으로 이동
		location.href="reply_form.do?b_idx=${ vo.b_idx }&page=${ param.page }";
	}
	
	function  del(){
		
		if(confirm("정말 삭제하시겠습니까?")==false)return;
		
		//삭제
		location.href="delete.do?b_idx=${ vo.b_idx }&page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }"
		
	}
	
	function  modify_form(){
		
		//수정
		location.href="modify_form.do?b_idx=${ vo.b_idx }&page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }"
		
	}	
	
	
</script>

</head>
<body>
   <div id="box">
      <table class="table">
          <caption>::::게시판 상세보기::::</caption>
          <tr>
          	 <th>번호</th>
          	 <td>${ vo.b_idx }</td>
          </tr>
          
          <tr>
          	 <th>작성자</th>
          	 <td>${ vo.m_name }</td>
          </tr>
          
          <tr>
          	 <th>제목</th>
          	 <td>${ vo.b_subject }</td>
          </tr>
          
          <tr>
          	 <th>내용</th>
          	 <td>
          	   <div  style="min-height: 80px;">
          	      ${ vo.b_content }
          	   </div>
          	 </td>
          </tr>
          
          <tr>
          	 <th>작성일자/아이피</th>
          	 <td>${ vo.b_regdate }/(${ vo.b_ip })</td>
          </tr>
          <tr>
          	<td colspan="2">
          	    <input class="btn btn-primary" type="button" value="목록보기"
          	           onclick="location.href='list.do?page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }'" >
          	    
          	    
          	    <!-- 전체 검색이 아니면서 메인글일경우만 활성화 -->
          	    <c:if test="${ (empty param.search or param.search eq 'all') && vo.depth le 0 }">
	          	    <input class="btn btn-success" type="button" value="답글쓰기"
	          	           onclick="reply_form();">
          	    </c:if>       
          	           
          	           
          	    
          	    <!-- 작성한유저 또는 관리자만 사용가능 -->
          	    <c:if test="${ (user.m_idx eq vo.m_idx) or (user.m_grade eq '관리자') }">	          	    
          	        <input class="btn btn-danger"  type="button" value="삭제하기"
          	               onclick="del();">
	          	    <input class="btn btn-info"    type="button" value="수정하기" onclick="modify_form();">
          	    </c:if>
          	    
          	</td>
          </tr>
          
      </table>
   </div>


</body>
</html>