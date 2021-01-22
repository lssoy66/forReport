<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<!-- header.jsp에 있는 내용으로 여기서는 주석처리: <meta charset="UTF-8"> -->
<title>ForReport</title>
</head>

<%@ include file="includes/header.jsp" %>

    <!-- Hero Section Begin -->
    <section class="hero set-bg" data-setbg="/resources/img/hero/hero-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hero__text">
                        <div class="section-title">
                            <h2>ForReport</h2>
                            <p>검증형 시스템으로 당신에게 딱 맞는 정보를 찾아보세요.</p>
                        </div>
                        <div class="hero__search__form">
                            <form id="mainInputKeywordForm" action="/product/list" method="get">
                                <input type="text" placeholder="Search..." name="inputKeyword">
                                <input type="hidden" name="largeCategory" value=999>                                
                                <input type="hidden" name="smallCategory" value=999>                                
                                <button type="submit">검색</button>
                            </form>
                        </div>
                        <ul class="hero__categories__tags">
                           	<li><a href="product/list?largeCategory=0&smallCategory=999"><img src="/resources/img/hero/cat-2.png" alt=""> 레포트</a></li>
                            <li><a href="product/list?largeCategory=1&smallCategory=999"><img src="/resources/img/hero/cat-1.png" alt=""> 논문</a></li>
                            <li><a href="#"><img src="/resources/img/hero/cat-3.png" alt=""> 내 레포트/논문 올리기</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    

<script>
	$(document).ready(function(){
		
		$(".blog__sidebar__search").css("display", "none");
	});
</script>
  
<%@ include file="includes/footer.jsp" %>