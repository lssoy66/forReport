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
	                        <li><a href="/order/mySaleList.fr">판매내역 </a></li>
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
					
					<h5>나의 판매내역</h5>
					
					<div class="listing__details__comment saleList">
						<table class="table text-center thCustom2">
								
							<tr>
								<th></th>
								<th>상품번호</th>
								<th>상품명</th>
								<th>가격</th>
								<th>등록일</th>
								<th>판매 수</th>
								<th>승인여부</th>
							</tr>
								<c:forEach items="${saleList }" var="sale">
										<tr>
											<td class="tdImg">
												<img src='/product/showThumbnail.fr?pronum=${sale.pronum}&index=0' 
													alt='' style='width:100px; height: 100px; margin: 0px'>
											</td>
											<td><p><c:out value="${sale.pronum }" /></p></td>
											<td><p><a href="/product/view.fr?pronum=${sale.pronum}"><c:out value="${sale.proname }" /></a></p></td>
											<td><p><c:out value="${sale.price}" /></p></td>
											<td><p><fmt:formatDate value="${sale.uploadDate }" pattern="yyyy-MM-dd"/></p></td>
											<c:choose>
												<c:when test="${sale.approval == 1 }">
													<td style="color: blue">승인</td>
												</c:when>
												<c:when test="${sale.approval == 2 }">
													<td style="color: red">승인거부</td>
												</c:when>
												<c:when test="${sale.approval == 3 }">
													<td style="color: red">삭제요청</td>
												</c:when>
												<c:otherwise>
													<td style="color: black">승인대기</td>
												</c:otherwise>
											</c:choose>
										</tr>
									
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
		 
		var saleList = '<c:out value="${saleList.isEmpty() }" />';
		checkSaleList(saleList);
		
		function checkSaleList(saleList){
			console.log("checkSaleList");
			if(saleList == "true"){
				$(".saleList").html("<h5>판매한 상품이 없습니다.</h5>");
			}
		} 
		
	});
	
</script>

<%@ include file="../includes/footer.jsp"%>