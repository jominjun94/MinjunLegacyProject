<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp" />
<style>
header.masthead {
	
	display: none;
}	
</style>
<br/><br/>
<div class="container">

<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header text-white" style="background-color: #ff52a0;">${article.boardNo}번 게시물 내용</div>
      <div class="card-body">

       
        
          <div class="form-group">
            <label>작성자</label>
            <input type="text" class="form-control" name='writer' value="${article.writer}" readonly>
          </div>
          
          <div class="form-group">
            <label>제목</label>
            <input type="text" class="form-control" name='title' value="${article.title}" readonly>
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="5" name='content' readonly>${article.content}</textarea>
          </div>

         
        <form role="form" id = "formObj" action="<c:url value='/board/delete'/>" method="post">  
          
          <input type="hidden" name="boardNo" value="${article.boardNo}">
          
          <input type="button" value="목록" class="btn" onclick="location.href='/board/list?page=${p.page}&countPerPage=${p.countPerPage}'"
		style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">&nbsp;&nbsp;
          
          
          <c:if test="${login.name == article.writer}">
          <input id = "modBtn" type="button" value="수정" class="btn btn-warning"  style="color:white;">&nbsp;&nbsp;
          
          <input type="submit" value="삭제" class="btn btn-danger" onclick="return confirm('정말로 삭제하시겠습니까?')">&nbsp;&nbsp;
          
          </c:if>
        </form>

      </div>
    </div>
  </div>
</div>
</div>


<script>
$(function () {
	
	
	const formElement = $("#formObj");
	
	
	var modifyBtn = $("#modBtn"); 
	
	modifyBtn.click(function() {
	
		formElement.attr("action", "/board/modify");
		formElement.attr("method", "get");
		
		formElement.submit();
	});
});


const result = "${msg}";
if(result === 'modSuccess'){
	alert("게시글 등록이 완료 되었습니다.");

}


</script>


<jsp:include page="../include/footer.jsp" />



