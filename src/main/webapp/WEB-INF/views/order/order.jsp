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
					<input type="submit" class="site-btn orderButton" value="결제하기">
				<br>
				</div>
			</div>
		</div>
		
	</div>
</section>
<!-- About Section End -->

<script>

	$(document).ready(function(){
		
		var price = "<c:out value='${price }' />";
		//console.log(price);
		var IMP = window.IMP;
		IMP.init("imp17511892");
		
		$(".orderButton").click(function(e){
			
			e.preventDefault();
			
			// console.log($("input[type='radio']:checked").attr("value"));
			// 현재 amount만 넘어가도록, GET 방식으로 작성하였음
			// 1. POST 방식으로 변경, 2. 주문테이블에 필요한 데이터를 전달하도록 변경(data), 3. 성공 시 주문내역 페이지로 이동
			if($("input[type='radio']:checked").attr("value") == "Test1"){
				//alert("Test3");
				IMP.request_pay({ // param
			          pg: "html5_inicis",
			          pay_method: "card",
			          name: "주문명:결제테스트",
			          amount: price,
			          buyer_email: "lssoy66@naver.com",
			          buyer_name: "이수연",
			          buyer_tel: "010-8755-6019"
			      }, function (rsp) { // callback
			          if (rsp.success) {
			        	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			          	$.ajax({
			          		url: "/order/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
			          		type: 'GET',
			          		dataType: 'text',
			          		data: { "amount" : 100 },
			          		contentType : "application/json; charset=utf-8",
			          		success : function(result){
 			          			var msg = '결제가 완료되었습니다.';
 			          			msg += '\n고유ID : ' + rsp.imp_uid;
 			          			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
 			          			msg += '\n결제 금액 : ' + rsp.paid_amount;
 			          			msg += '\n카드 승인번호 : ' + rsp.apply_num;
			          			
			          			alert(result + " :: " + msg);
							}
			          	});
			          } else {
			        	  var msg = '결제에 실패하였습니다.';
			              msg += '\n에러내용 : ' + rsp.error_msg;
			              alert(msg);
			          }
			      });
 			}
			
		});
		
		
	});


</script>

<%@ include file="../includes/footer.jsp"%>