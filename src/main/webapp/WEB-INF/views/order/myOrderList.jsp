<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/cartHeader.jsp"%>

<!-- 로그인한 사용자 아이디 가져오기 :: ${user_id }로 사용 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
	<sec:authentication property="principal.user.email" var="user_email" />
	<sec:authentication property="principal.user.phone" var="user_phone" />
	<sec:authentication property="principal.user.name" var="user_name" />
	<sec:authentication property="principal.user.grade" var="user_grade" />
</sec:authorize>

<!-- Blog Hero Begin -->
<div class="blog-details-hero set-bg"
	data-setbg="/resources/img/blog/details/blog-hero.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-7">
				<div class="blog__hero__text">
					<h2>내 정보</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Blog Hero End -->

<!-- Blog Details Section Begin -->
<section class="blog-details spad2">
	<div class="container">
		<div class="row">
		
			<div class="col-lg-3">
				<div class="blog__sidebar">
					<div class="blog__sidebar__recent">
						<h5>${user_id }</h5>
						${user_name }님<br><br>
						등급 : 
						<c:choose>
							<c:when test="${user_grade == 1 }">
								브론즈<br><p>상품 5개 이상 업로드</p>
							</c:when>
							<c:when test="${user_grade == 2 }">
								실버<br><p>상품 10개 이상 업로드</p>
							</c:when>
							<c:when test="${user_grade == 3 }">
								골드<br><p>상품 15개 이상 업로드</p>
							</c:when>
							<c:otherwise>
								일반 회원
							</c:otherwise>
						</c:choose>
					</div>
					<div class="blog__sidebar__categories">
						<h6>주문 관리</h6>
						<ul>
	                        <li><a href="/order/myOrderList.fr">주문내역 </a></li>
	                        <li><a href="#">판매내역 </a></li>
	                    </ul>
	                    <hr>
	                    <h6>기타 추가</h6>
						<ul>
	                        <li><a href="#">추가1 </a></li>
	                        <li><a href="#">추가2 </a></li>
	                    </ul>
                    </div>
					
				</div>
			</div>
			<div class="col-lg-9">
				<div class="blog__details__text">
					
					<h5>나의 주문내역</h5>
					
					<div class="listing__details__comment">
						<table class="table text-center">
								<thead>
									<tr>
										<th colspan="6">
											<fmt:formatDate value="${orderList.get(0).orderdate }" var="day" pattern="yyyy-MM-dd"/>
											<c:out value="${day }"></c:out>
										</th>
									</tr>
								</thead>
								<c:forEach items="${orderList }" var="order">
									<fmt:formatDate value="${order.orderdate }" var="orderdate" pattern="yyyy-MM-dd"/>
									<c:if test="${orderdate != day}">
										<c:set value="${orderdate }" var="day"></c:set>
										<thead>
											<tr> 
												<th colspan="6"> 
													<c:out value="${day }"></c:out> 
												</th> 
											</tr> 
										</thead>
									</c:if> 
									<tbody>
										<tr>
											<td><img src="/resources/img/listing/details/comment.png" alt=""></td>
											<td><c:out value="${order.ordernum }" /></td>
											<td><c:out value="${order.proname }" /></td>
											<td><c:out value="${order.payprice}" /></td>
											<td><c:out value="${order.paymethod }" /></td>
											<td><fmt:formatDate value="${order.orderdate }" pattern="yyyy-MM-dd"/></td>
										</tr>
									</tbody>
								</c:forEach>
							
						</table>
					</div>
					
				</div>

			</div>
			
		</div>
	</div>
</section>
<!-- Blog Details Section End -->


<script>

	$(document).ready(function(){
		
		// cartHeader.jsp의 로그아웃 처리
		$("#logout").click(function(e){
        			
        	e.preventDefault();
        	$(".logoutForm").submit();
        			
        });
		
		
	});
	
</script>

<%@ include file="../includes/footer.jsp"%>