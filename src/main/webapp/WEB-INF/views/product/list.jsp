<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<c:out value="${searchingVO.bigCategory}"></c:out>
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
						<a href="list?bigCategory=<c:out value="${searchingVO.bigCategory}"/>&smallCategory=HS">인문사회</a>
						<a href="list?bigCategory=<c:out value="${searchingVO.bigCategory}"/>&smallCategory=NE">자연공학</a>
						<a href="list?bigCategory=<c:out value="${searchingVO.bigCategory}"/>&smallCategory=AS">예술체육</a>
						<a href="list?bigCategory=<c:out value="${searchingVO.bigCategory}"/>&smallCategory=CUL">교양</a>
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
    				<tr>
    					<td>1</td>
    					<td><img src="#"></td>
    					<td>
    						<a href="#">제목1</a>
    					</td>
    					<td>등록일1</td>
    				</tr>
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
		var smallCategoryKor; // 소분류 한글 표시
		
		if(smallCategory) { // 소분류 선택O
			
			$(".smallCategory").css("visibility","hidden");
			
			console.log("1");
		
			if(smallCategory==="HS"){
				smallCategoryKor = "인문사회"
			} else if(smallCategory==="NE"){
				smallCategoryKor = "자연공학"
			} else if(smallCategory==="AS"){
				smallCategoryKor = "예술체육"
			} else if(smallCategory==="CUL"){
				smallCategoryKor = "교양"
			}
			
			$(".breadcrumb__option").append("<a href='list?bigCategory=${searchingVO.bigCategory}'><c:out value="${searchingVO.bigCategory}"/></a>"+"<span>"+smallCategoryKor+"</span>");
		
		} else if(!smallCategory){ // 소분류 선택 X
			
			$(".breadcrumb__option").append("<span><c:out value="${searchingVO.bigCategory}"/></span>");

		}
	});
</script>

<%@ include file="../includes/footer.jsp"%>