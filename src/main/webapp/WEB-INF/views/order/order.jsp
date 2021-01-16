<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<%@ include file="../includes/cartHeader.jsp"%>

<!-- Breadcrumb Begin -->
<div class="breadcrumb-area set-bg"
	data-setbg="/resources/img/breadcrumb/breadcrumb-normal.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>결제하기</h2>
					<div class="breadcrumb__option">
						<a href="/cart/cartList.fr"><i class="fa fa-shopping-cart"></i>
							Cart</a> <span>Order</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb End -->


<!-- About Section Begin -->
<section class="about spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="about__text">
					<h4>상품목록</h4>
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
							<c:forEach items="${orderProductList }" var="orderProduct">
								<tr>
									<td><img src="/resources/img/listing/details/comment.png"
										alt=""></td>
									<td><c:out value="${orderProduct.title }" /></td>
									<td><c:out value="${orderProduct.id }" /></td>
									<td><c:out value="${orderProduct.price }" />원</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br><br>
					<h4>구매자 정보</h4>
					<hr>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 col-md-2">
				<div class="about__title">
					<b>구매자</b><br><br>
					<b>휴대폰</b><br><br>
					<b>이메일</b>
				</div>
			</div>
			<div class="col-lg-10 col-md-10">
				<div class="about__text">
					이름<br><br>
					번호<br><br>
					이메일
				</div>
			</div>
		</div>
		
		<br><br><br>
					<h4>결제수단</h4>
					<hr>
		
		<div class="row">
			<div class="col-lg-2 col-md-2">
				<div class="about__title">
					<b>일반결제</b><br><br>
					<b>무통장</b><br><br>
					<b>카카오</b><br><br>
				</div>
			</div>
			<div class="col-lg-10 col-md-10">
				<div class="about__text">
					<form action="#">
						<input type="radio" name="paymethod" value="Test1" checked="checked"> 신용카드<br><br>
						<input type="radio" name="paymethod" value="Test2"> 무통장입금<br><br>
						<input type="radio" name="paymethod" value="Test3"> 카카오페이<br><br>
					</form>
				</div>
			</div>
		</div>
				
		<div class="row">
			<div class="col-lg-12">
				<hr>
				<div class="about__title">
				<br>
					<p>총 결제 금액 : </p>
					<h4><c:out value="${price }" /><h4>
					<p>원</p>
					<button class="site-btn orderButton">결제하기</button>
				<br>
				</div>
			</div>
		</div>
		
	</div>
</section>
<!-- About Section End -->

<script>

	$(document).ready(function(){
		
		var IMP = window.IMP;
		IMP.init("imp17511892");
		
		$(".orderButton").click(function(e){
			console.log($("input[type='radio']:checked").attr("value"));
			if($("input[type='radio']:checked").attr("value") == "Test3"){
				//alert("Test3");
				IMP.request_pay({ // param
			          pg: "html5_inicis",
			          pay_method: "card",
			          merchant_uid: "ORD20180131-0000011",
			          name: "노르웨이 회전 의자",
			          amount: 64900,
			          buyer_email: "gildong@gmail.com",
			          buyer_name: "홍길동",
			          buyer_tel: "010-4242-4242",
			          buyer_addr: "서울특별시 강남구 신사동",
			          buyer_postcode: "01181"
			      }, function (rsp) { // callback
			          if (rsp.success) {
			        	  
			          } else {
			        	  
			          }
			      });
			}
			
		});
		
		
	});


</script>

<%@ include file="../includes/footer.jsp"%>