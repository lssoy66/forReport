<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../includes/cartHeader.jsp"%>

<!-- Blog Hero Begin -->
<div class="blog-details-hero set-bg"
	data-setbg="/resources/img/blog/details/blog-hero.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-7">
				<div class="blog__hero__text">
					<h2>장바구니</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Blog Hero End -->

<!-- Blog Details Section Begin -->
<section class="blog-details spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="blog__details__text">
				
					<h5>Cattle She’d Days Lights Light Saw Spirit Shall</h5>
					<div class="cartList">
						${cart}
					</div>
						
				</div>



			</div>
			<div class="col-lg-4">
				<div class="blog__sidebar">
					<div class="blog__sidebar__recent">
						<h5>Recent Post</h5>
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Details Section End -->


<script>

	$(document).ready(function(){
		
		var userid = "user3";
		
		// 즉시 실행 함수
		(function(){
			checkCartList(userid);
		})();	// end function
		
		
		
		function checkCartList(userid){
			
			if(){
				return;
			}

			

			$(".cartList").html("");
		}
		

		
	});
	
</script>

<%@ include file="../includes/footer.jsp"%>