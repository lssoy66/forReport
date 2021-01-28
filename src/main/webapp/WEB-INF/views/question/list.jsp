<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- header.jsp에 있는 내용으로 여기서는 주석처리: <meta charset="UTF-8"> -->
<title>ForReport</title>
</head>

<%@ include file="../includes/header.jsp"%>

<!-- 상단표시: Listing Section Begin -->
<section class="listing-hero set-bg" data-setbg="/resources/img/listing/details/listing-hero.jpg">
	<div class="container">
    	<div class="row">
        	<div class="col-lg-8">
            	<div class="listing__hero__option">
                	
                    <div class="listing__hero__text">
                    	<h2><c:out value="${QuestionVO.questiontitle}"/></h2>
                    	
                       
                       
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
            	
            </div>
        </div>
    </div>
</section>
<!-- 상단표시: Listing Section End -->


<!-- 상품 목록 -->
<section class="blog-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<table class="table text-center">
    			<thead>
    				<tr>
    					<th>번호</th>    					
    					<th>제목</th>   					

    				</tr>
    			</thead>
    			<tbody>
    				<c:forEach items="${list}" var="list">
						<tr >
							<td><c:out value="${list.questionnum}"/></td>
							
							<td>
								<a href="view.fr?questionnum=${list.questionnum}">
									<c:out value="${list.questiontitle}"/>
								</a>
							</td>		
						</tr>
					</c:forEach>	
    				
    			</tbody>
    		</table>
			</div>
		</div>
	</div>
</section>

<!-- 페이징 처리: Blog Section Begin -->
<section class="blog-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="blog__pagination">
				
					<c:if test="${pageDTO.prev}">
						<a href="?largeCategory=${pageDTO.searchingVO.largeCategory}
								&smallCategory=${pageDTO.searchingVO.smallCategory}
								&pageNum=${pageDTO.startPage-1}
								&inputKeyword=${pageDTO.searchingVO.inputKeyword}">
							<i class="fa fa-long-arrow-left"></i> Pre
						</a>
					</c:if>
					
					<c:forEach var="num" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
						<c:choose>
							<c:when test="${pageDTO.searchingVO.pageNum==num}">
								<a href="?largeCategory=${pageDTO.searchingVO.largeCategory}
										&smallCategory=${pageDTO.searchingVO.smallCategory}
										&pageNum=${num}
										&inputKeyword=${pageDTO.searchingVO.inputKeyword}">
									<strong style="color:red">${num}</strong>
								</a>
							</c:when>
							<c:otherwise>
								<a href="?largeCategory=${pageDTO.searchingVO.largeCategory}
										&smallCategory=${pageDTO.searchingVO.smallCategory}
										&pageNum=${num}
										&inputKeyword=${pageDTO.searchingVO.inputKeyword}">
									${num}
								</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				
					<c:if test="${pageDTO.next}">
						<a href="?largeCategory=${pageDTO.searchingVO.largeCategory}
								&smallCategory=${pageDTO.searchingVO.smallCategory}
								&pageNum=${pageDTO.endPage+1}
								&inputKeyword=${pageDTO.searchingVO.inputKeyword}">
							Next<i class="fa fa-long-arrow-right"></i></a>
					</c:if>
				
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 페이징 처리:Blog Section End -->


<script type="text/javascript" src="/resources/js/review.js"></script>

<script>
	$(document).ready(function(){
				
	
	
		
</script>


<%@ include file="../includes/footer.jsp"%>