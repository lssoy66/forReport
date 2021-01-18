<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<%@ include file="../includes/cartHeader.jsp"%>

<!-- Breadcrumb Begin -->
<div class="breadcrumb-area set-bg"
	data-setbg="/resources/img/breadcrumb/breadcrumb-normal.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center"></div>
		</div>
	</div>
</div>
<!-- Breadcrumb End -->

<!-- Work Section Begin -->
<section class="work work-about spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>결제성공!</h2>
					<p>결제가 정상적으로 완료되었습니다.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="work__item">
					<div class="work__item__number">OrderSuccess</div>
						<img src="/resources/img/work/work-2.png" alt="">
						<h5>For Report를 이용해주셔서 감사합니다.</h5>
						<p>
							구매한 상품은 <a href="#">구매내역</a>에서 확인 가능합니다.
						</p>
						<br>
						
					<div class="row">
						<div class="col-lg-3 col-md-3">

						</div>
						<div class="col-lg-2 col-md-2" id="custom">
							<br>
							<b>구매자</b><br><br>
							<b>휴대폰</b><br><br>
							<b>이메일</b><br><br>
							<br>
							<b>주문번호</b><br><br>
							<b>결제방식</b><br><br>
							<b>주문일자</b><br><br>
							<br>
							<b>총 결제금액</b><br><br>						
						</div>
						<div class="col-lg-4 col-md-4" id="custom">
							<br>
							구매자이름<br><br>
							구매자폰번호<br><br>
							구매자이메일<br><br>
							<br>
							주문번호<br><br>
							결제방식<br><br>
							주문일자<br><br>
							<br>
							<p id="customP">총 결제금액</p><br><br>						
						</div>
						
						<div class="col-lg-3 col-md-3">

						</div>
					</div>
					
					<div class="row">
						<div class="col-lg-2 col-md-2">

						</div>
						<div class="col-lg-8 col-md-8" id="custom">
							<div class="about__text">
								<br>
								<table class="table text-center">
									<thead>
										<tr>
											<th>(썸네일)</th>
											<th>상품명</th>
											<th>판매자</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><img src="/resources/img/listing/details/comment.png"
												alt=""></td>
											<td>상품명</td>
											<td>판매자id</td>
											<td>상품가격</td>
										</tr>
										<tr>
											<td><img src="/resources/img/listing/details/comment.png"
												alt=""></td>
											<td>상품명</td>
											<td>판매자id</td>
											<td>상품가격</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<br><br>
							<div class="section-title">
								<a href="/" class="site-btn" id="orderButton2">홈으로</a>&nbsp;
								<a href="#" class="site-btn" id="orderButton">구매내역</a>
							</div>
							
							
							
						</div>
						<div class="col-lg-2 col-md-2">

						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Work Section End -->

<%@ include file="../includes/footer.jsp"%>
