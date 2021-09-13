<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />
<style>
header.masthead {
	
	display: none;
}	
.btn-orange {
	background-color: orange;
	color: white;
}
.btn-izone {
	background-color: #ff52a0;
	color: white;
}
</style>

<br><br> 
 
    <!-- Begin Page Content -->
	

	<div class="container">
		<div class="row">
			<div class="col-lg-2">
			</div>
			<div class="col-lg-8">
				<div class="panel-body">
				<h2 class="page-header"><span style="color: #ff52a0;">IZONE</span> 자유 게시판
					<span id="count-per-page" style="float: right;">
	                     <input class="btn btn-izone" type="button" value="10">  
	                     <input class="btn btn-izone" type="button" value="20">   
	                     <input class="btn btn-izone" type="button" value="30">
                     </span>
					
				</h2>
					<table class="table table-bordered table-hover">
						<thead>
							<tr style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
								<th>#번호</th>
								<th>작성자</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<c:forEach var = "b" items="${articles}">
						<!-- 게시물이 들어갈 공간 -->
							<tr style="color: #ff52a0;">
								<td>${b.boardNo}</td>
								<td>${b.writer}</td>

								<td><a style="margin-top: 0; height: 40px; color: orange;" href="<c:url value = '/board/content/${b.boardNo}?page=${pc.page}&countPerPage=${pc.countPerPage}'/>">
										${b.title}
									</a>
									<c:if test = "${b.newMark == true}">
									<span class = "badge badge-pill badge-danger">new</span>
									</c:if>
									
								</td>

								<td>${b.regDate}</td>
								<td>${b.viewCnt}</td>
							</tr>
						</c:forEach>
					</table>
					
					<!-- 페이징 처리 부분  -->
					<ul class="pagination justify-content-center">
						<c:if test="${pc.prev}">
                       	<li class="page-item">
                       	  <!--  이전    --> 
                       	  	
							<a class="page-link" href="<c:url value='/board/list?page=${pc.endPage-1}&countPerPage=${pc.countPerPage}' />" 
							style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">이전</a>
						</li>
						</c:if>
						<!-- 페이지 버튼 -->
						<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
							<li class="page-item">
							   <a href="<c:url value='/board/list?page=${pageNum}&countPerPage=${pc.countPerPage}'/>" class="page-link" style="margin-top: 0; height: 40px; color: pink; border: 1px solid pink;">${pageNum}</a>
							</li>
					    </c:forEach>
					   <!--  다음   --> 
					    <c:if test="${pc.next}">
					    <li class="page-item">
					      <a class="page-link"  href="<c:url value='/board/list?page=${pc.endPage+1}&countPerPage=${pc.countPerPage}' />" 
					      style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">다음</a>
					    </li>
					    </c:if>
				    </ul>
				    	<a href="<c:url value = '/board/write'/>" class="btn btn-izone float-right">글쓰기</a>
					<!-- 페이징 처리 끝 -->
					</div>
				</div>
			</div>
					<!-- 검색 버튼 -->
					<div class="row">
	                    
	                    <div class="col-sm-2">
						
						</div>
						<div class="col-sm-2"></div>
					</div>
					
		
	</div>
	
	<script>

	//글쓰기 완료 시 띄울 알림창 처리
	const result = "${msg}";
	
	if(result === "regSuccess") {
		alert("게시글 등록이 완료되었습니다.");
	} else if(result === "delSuccess") {
		alert("게시글 삭제가 완료되었습니다.");
	}
	
	
	//start jQuery
	$(function() {
		
		//목록 개수가 변동하는 이벤트 처리
		$("#count-per-page .btn-izone").click(function() {
			//console.log("목록 버튼이 클릭됨!");
			//console.log($(this).val());
			let count = $(this).val();
			location.href="/board/list?countPerPage=" + count;
		});
		
	});//end jQuery

</script>
	
	
	
	
	
	
<jsp:include page="../include/footer.jsp" />