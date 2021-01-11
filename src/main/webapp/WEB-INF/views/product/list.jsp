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
						<a href="#"><i class="fa fa-home"></i> Home</a> <span>논문/레포트</span>
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
    					<td>제목1</td>
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

<%@ include file="../includes/footer.jsp"%>