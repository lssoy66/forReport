<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- header.jsp에 있는 내용으로 여기서는 주석처리: <meta charset="UTF-8"> -->
<title>ForReport</title>
</head>

<%@ include file="../includes/header.jsp"%>

<!-- 카테고리 분류 부분: Breadcrumb Begin -->
<div class="breadcrumb-area set-bg"
	data-setbg="../resources/img/breadcrumb/breadcrumb-blog.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>
						<c:choose>
							<c:when test="${searchingVO.largeCategory == 0}">Report</c:when>
							<c:when test="${searchingVO.largeCategory == 1}">Paper</c:when>
							<c:otherwise>Report/Paper</c:otherwise>
						</c:choose>
					</h2>
					<div class="breadcrumb__option">
						<a href="/"><i class="fa fa-home"></i> Home</a>
					</div>
					<!-- 
						HS: Humanities and Social Sciences 인문사회
						NE: Natural Engineering 자연공학
						AS: Art sprots 예술체육
						CUL: Culture 교양
					 -->
					<div class="smallCategory">
						<a href="list?largeCategory=<c:out value="${searchingVO.largeCategory}"/>&smallCategory=0">인문사회</a>
						<a href="list?largeCategory=<c:out value="${searchingVO.largeCategory}"/>&smallCategory=1">자연공학</a>
						<a href="list?largeCategory=<c:out value="${searchingVO.largeCategory}"/>&smallCategory=2">예술체육</a>
						<a href="list?largeCategory=<c:out value="${searchingVO.largeCategory}"/>&smallCategory=3">교양</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 카테고리 분류 부분: Breadcrumb End -->

<!-- 상품 목록 -->
<section class="blog-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<table class="table">
    			<thead>
    				<tr>
    					<th>번호</th>
    					<th>썸네일</th>
    					<th>제목</th>
    					<th>등록일</th>
    				</tr>
    			</thead>
    			<tbody>
    				
    				<c:forEach items="${productList}" var="list">
						<tr>
							<td><c:out value="${list.pronum}"/></td>
							<td>썸네일</td>
							<td><c:out value="${list.title}"/></td>
							<td><c:out value="${list.uploadDate}"/></td>
						</tr>
					</c:forEach>	
    				
    			</tbody>
    		</table>
			</div>
		</div>
	</div>
</section>

<!-- 페이징 처리: Blog Section Begin -->
<section class="blog-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="blog__pagination">
					<a href="#"><i class="fa fa-long-arrow-left"></i> Pre</a>
					<a href="#">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">Next<i class="fa fa-long-arrow-right"></i></a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 페이징 처리:Blog Section End -->

<script>
	$(document).ready(function(){
		
		/*
			카테고리 상단부 smallCategory 처리
			- 소분류가 선택된 경우: 소분류 버튼 표시X
			- 소분류가 선택되지 않은 경우: 소분류 버튼 표시O
		*/
		
		var smallCategory = "${searchingVO.smallCategory}";
		var largeCategory = "${searchingVO.largeCategory}";
		
		var largeCategoryKor = ""; // 대분류 한글 표시
		var smallCategoryKor = ""; // 소분류 한글 표시
		
		// 대분류 글자 변환
		if(largeCategory==0) {
			largeCategoryKor = "Report"
		} else if(largeCategory== 1) {
			largeCategoryKor = "Paper"
		}
		
		// 소분류 카테고리 번호 확인 후 글자 변환하여 출력
		// 대분류 하이퍼링크 추가
		if(smallCategory!=999) {
			
			$(".smallCategory").css("visibility","hidden");
					
			if(smallCategory==0){
				smallCategoryKor = "인문사회"
			} else if(smallCategory==1){
				smallCategoryKor = "자연공학"
			} else if(smallCategory==2){
				smallCategoryKor = "예술체육"
			} else if(smallCategory==3){
				smallCategoryKor = "교양"
			}
			
		
			$(".breadcrumb__option").append("<a href='list?largeCategory="+largeCategory+"'>"+largeCategoryKor+"</a>"+"<span>"+smallCategoryKor+"</span>");
			console.log(largeCategory);
		} else if(smallCategory==999){ // 소분류 선택 X
			
			console.log(largeCategoryKor);
			$(".breadcrumb__option").append("<span>"+largeCategoryKor+"</span>");
		}
	});
</script>


<%@ include file="../includes/footer.jsp"%>