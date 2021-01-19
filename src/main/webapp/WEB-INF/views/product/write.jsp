<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- header.jsp에 있는 내용으로 여기서는 주석처리: <meta charset="UTF-8"> -->
<title>ForReport</title>

<style type="text/css">

#uploadFormTable th {
	vertical-align: middle /*table head 수직 정렬*/
}

#uploadFormTable td {
	text-align: left /*table body 왼쪽 정렬*/
}

</style>

</head>

<%@ include file="../includes/header.jsp"%>


	<!-- 추가 헤더: Breadcrumb Begin -->
	<div class="breadcrumb-area set-bg"
		data-setbg="../resources/img/breadcrumb/breadcrumb-normal.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>
							자료 등록
						</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 추가 헤더: Breadcrumb End -->
	
	
<!-- 상품 목록 -->
<section class="blog-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form action="/product/write.fr" method="post" enctype="multipart/form-data">
					<table id="uploadFormTable" class="table text-center">
	    				<tr>
	    					<th>파일 선택</th>
	    					<td>
	    						<input type="file" name="uploadFile" multiple>
							</td>
	    				</tr>
	    				<tr>
	    					<th>제목</th>
	    					<td>
	    						<p>자료의 내용을 대표할 수 있도록 구체적으로 기재하시기 바랍니다.</p>
	    						<input type="text" id="title">
	    					</td>
	    				</tr>
	    				<tr>
	    					<th>대분류</th>
	    					<td>
	    						<select id="largeCa" name="largeCa">
		    						<option value="0">레포트</option>
		    						<option value="1">논문</option>
		    					</select>    				
	    					</td>
	    				</tr>
	    				<tr>
	    					<th>소분류</th>
	    					<td>
	    						<select id="smallCa" name="smallCa">
		    						<option value="0">인문사회</option>
		    						<option value="1">자연공학</option>
		    						<option value="2">예술체육</option>
		    						<option value="3">교양</option>
		    					</select>    				
	    					</td>
	    				</tr>
	    				<tr>
	    					<th>상세정보</th>
	    					<td>
	    						<textarea rows="10" cols="130" placeholder="자료에 대한 소개, 목차, 본문 내용 등을 상세하게 적어주세요."></textarea>
	    					</td>
	    				</tr>
	    			</table>	    			
	    			<input type="hidden" name="id" value="#"> 
	    			<input type="submit" value="자료 등록" class="primary-btn" style="float:right">
	    		</form>
			</div>
		</div>
	</div>
</section>





<%@ include file="../includes/footer.jsp"%>