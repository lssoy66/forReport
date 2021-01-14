<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<a href="/cart/cartList.fr"><i class="fa fa-shopping-cart"></i> Cart</a> <span>Order</span>
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
                        <h4>상품목록</h4><hr>
                        <table>
                        	<thead>
                        		<tr>
                        			<td>(썸네일)</td>
                        			<td>상품명</td>
                        			<td>판매자</td>
                        			<td>가격</td>
                        		</tr>
                        	</thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About Section End -->

	<c:out value="${price }"></c:out>
	<c:forEach items="${orderProductList }" var="orderProduct">
		<c:out value="${orderProduct.title }" />
	</c:forEach>
<%@ include file="../includes/footer.jsp"%>