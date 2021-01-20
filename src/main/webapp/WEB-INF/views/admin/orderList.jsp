<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes_admin/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">전체 주문 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-info">
			<div class="panel-heading">Order List</div>
			<!--  /.panel-heading  -->
			<div class="panel-body">
				
				
				
				<table class="table table-striped table-bordered table-hover">
				
					<thead>
						<tr>
							<th>주문번호</th>
							<td>상품명</td>
							<td>구매자ID</td>
							<td>결제방식</td>
							<td>결제금액</td>
							<td>주문일자</td>
						</tr>
					</thead>
					<c:forEach items="${orderList }" var="order">
						<tr>
						
							<td><c:out value="${order.ordernum }" /></td>
							<td><c:out value="${order.proname }" /></td>
							<td><c:out value="${order.id }" /></td>	
							<td><c:out value="${order.paymethod }" /></td>	
							<td><c:out value="${order.payprice }" /></td>
							<td><fmt:formatDate value="${order.orderdate }" pattern="yyyy-MM-dd"/> </td>
						
						</tr>
					</c:forEach>
				</table>
				
				<div class="pull-right">
					<ul class="pagination">
						
						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous"><a href="${pageMaker.startPage - 1 }">Previous</a></li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.criteria.pageNum == num ? "active":"" }" >
								<a href="${num }">${num }</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
							<li class="paginate_button next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
						</c:if>	
					</ul>
				</div>
				<!-- end Pagination -->
				
				<form id="actionForm" action="/admin/orderList.fr" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum }">	
					<input type="hidden" name="amount" value="${pageMaker.criteria.amount }">
				</form>
				
				
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel -->
	</div>
</div>


<script type="text/javascript">
	$(document).ready(function(){

		// 페이징 처리
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			console.log("click");
			actionForm.find("input[name='pageNum']")
						.val($(this).attr("href"));
			actionForm.submit();
		});
		
		

		
		
	});
</script>


<%@ include file="../includes_admin/footer.jsp"%>
