<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				
					<a href="#" id="allDelete">전체삭제</a>
					<div class="cartList">
						<c:forEach items="${cartProductList }" var="cartProduct">
							<div class="listing__details__comment">
	                            <div class="listing__details__comment__item">
	                            	<!-- 썸네일 -->
	                                <div class="listing__details__comment__item__pic">
	                                    <img src="/resources/img/listing/details/comment.png" alt="">
	                                </div>
	                                <div class="listing__details__comment__item__text">
	                                 	<!-- 삭제버튼 -->
	                                    <div class="listing__details__comment__item__exit">
	                                       	<a href="#"><i class="fa fa-times"></i></a>
	                                    </div>
	                                    <!-- 상품정보 -->
	                                   	<b>상품명 : <c:out value="${cartProduct.title}" /></b>
	                                    <p>상품설명 : <c:out value="${cartProduct.prodsc}" /></p>
	                                    
	                                </div>
	                            </div>
	                        </div>
						</c:forEach>
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
		
		var cartProductList = '<c:out value="${cartProductList }" />''
		
		// 즉시 실행 함수
		(function(){
			checkCartList(cartProductList);
		})();	// end function
		
		
		
		function checkCartList(cartProductList){
			
			if(cartProductList == null){
				$(".cartList").html("장바구니에 담긴 상품이 없습니다");
			}

		} 
		

		
	});
	
</script>

<%@ include file="../includes/footer.jsp"%>