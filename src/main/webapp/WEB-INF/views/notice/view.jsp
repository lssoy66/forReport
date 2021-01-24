<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>ForReport</title>

</head>

<%@ include file="../includes/header.jsp"%>


<!-- 상단표시: Listing Section Begin -->
<section class="listing-hero set-bg" data-setbg="/resources/img/listing/details/listing-hero.jpg">
	<div class="container">
    	<div class="row">
        	<div class="col-lg-8">
            	<div class="listing__hero__option">
                	<div class="listing__hero__icon">
                    	<img src="/resources/img/listing/details/ld-icon.png" alt="">
                    </div>
                    <div class="listing__hero__text">
                    	<h2><c:out value="${productVO.title}"/></h2>
                    	<h3>문서명: <c:out value="${productVO.proname}"/></h3>
                        <div class="listing__hero__widget">
                        	<!-- 평균 별점 -->
                        	<div class="listing__hero__widget__rating">
                        		<span> 별점:  </span>
                        		<span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                                
                            </div>
                            <p></p>
                            <div>
	                            <div> 작성자: <c:out value="${productVO.id}"/> &nbsp;</div>
	                            <div> 가격: <c:out value="${productVO.price}"/> &nbsp;</div>
	                            <div> 게시일 <fmt:formatDate value="${productVO.uploadDate}" pattern="yyyy-MM-dd"/></div>                      
                            </div> 
                        </div>
                        <p class="showCategory">
                        	<span class="showLargeCategory">
                        		<c:choose>
                        			<c:when test="${productVO.largeCa == 0}">Report</c:when>
                        			<c:when test="${productVO.largeCa == 1}">Paper</c:when>
                        			<c:otherwise>Report/Paper</c:otherwise>
                        		</c:choose>
                        	</span>
                        	> 
                        	<span class="showSmallCategroy">
                        		<c:choose>
                        			<c:when test="${productVO.smallCa==0}">인문사회</c:when>
                        			<c:when test="${productVO.smallCa==1}">자연공학</c:when>
                        			<c:when test="${productVO.smallCa==2}">예술체육</c:when>
                        			<c:when test="${productVO.smallCa==3}">교양</c:when>
                        		 </c:choose>
                        	</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
            	<div class="listing__hero__btns">
                	<a href="#" class="primary-btn"><i class="fa fa-bookmark"></i> 장바구니</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 상단표시: Listing Section End -->

<!-- 상품 정보: 상품 썸네일, 상품 설명 -->
<!-- 별점 & 댓글 -->
<!-- Listing Details Section Begin -->
<section class="listing-details spad">
	<div class="container">
		<div class="row">
        	<div class="col-lg-12">
            	<div class="listing__details__text">
                	<div class="listing__details__about">
                    	<h4>제품 설명</h4>
                        <p><c:out value="${productVO.prodsc}"></c:out></p>
					</div>
                    <div class="listing__details__gallery">
                    	<h4>콘텐츠 미리보기</h4>
                    	<!-- 만들어둔 썸네일 미리보기: 일정 시간 지나면 사진이 이동한다. -->
                    	<!-- 사진을 클릭하면 크게 보여주는 기능 추가 예정 -->
                        <div class="listing__details__gallery__pic">
                            <div class="listing__details__gallery__slider owl-carousel">
                            	<img data-imgbigurl="/resources/img/listing/details/listing-details-1.jpg"
                             		src="/resources/img/listing/details/thumb-1.jpg" alt="">
                                <img data-imgbigurl="/resources/img/listing/details/listing-details-1.jpg"
                                    src="/resources/img/listing/details/thumb-2.jpg" alt="">
                                <img data-imgbigurl="/resources/img/listing/details/listing-details-1.jpg"
                                    src="/resources/img/listing/details/thumb-3.jpg" alt="">
                                <img data-imgbigurl="/resources/img/listing/details/listing-details-1.jpg"
                                    src="/resources/img/listing/details/thumb-4.jpg" alt="">
                            </div>
                        </div>
					</div>
					
                    <div class="listing__details__rating">
                    	<h4>평균 별점</h4>
                        <div class="listing__details__rating__overall">
                        	<h2>0점</h2>
                        	<!-- 여기에 찐 평균 별점 표시 -->
                            <div class="listing__details__rating__star">
                            	<span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                           	</div>
                            <span>0명</span>
                       	</div>
                        <div class="listing__details__rating__bar">
                        	<div class="listing__details__rating__bar__item">
                            	<span>1점</span>
                                <div id="bar1" class="barfiller">
                                	<span class="fill" data-percentage="0" style="background:rgb(240,50,80); width:0%; transition: width 1s ease-in-out 0s;"></span>
                                </div>
                                <span class="right">00명</span>
                           	</div>
                            <div class="listing__details__rating__bar__item">
                            	<span>2점</span>
                               	<div id="bar2" class="barfiller">
                                	<span class="fill" data-percentage="0" style="background:rgb(240,50,80); width:0%; transition: width 1s ease-in-out 0s;"></span>
                                </div>
                                <span class="right">00명</span>
                            </div>
                            <div class="listing__details__rating__bar__item">
                                <span>3점</span>
                                <div id="bar3" class="barfiller">
                                	<span class="fill" data-percentage="0" style="background:rgb(240,50,80); width:0%; transition: width 1s ease-in-out 0s;"></span>
                                </div>
                                <span class="right">00명</span>
                            </div>
                            <div class="listing__details__rating__bar__item">
                                <span>4점</span>
                                <div id="bar4" class="barfiller">
                                	<span class="fill" data-percentage="0" style="background:rgb(240,50,80); width:0%; transition: width 1s ease-in-out 0s;"></span>
                                </div>
                                <span class="right">00명</span>
                            </div>
                            <div class="listing__details__rating__bar__item">
                                <span>5점</span>
                                <div id="bar5" class="barfiller">
                                	<span class="fill" data-percentage="0" style="background:rgb(240,50,80); width:0%; transition: width 1s ease-in-out 0s;"></span>
                                </div>
                                <span class="right">00명</span>
                            </div>
                        </div>
					 
                    </div>
                    
                   
                    <div class="listing__details__comment">
                        <h4>리뷰</h4>                       
                      	<div class="reviewListDiv"></div>
                      	 <!-- 리뷰 페이징 처리 --> 
                      	<div class="blog__pagination"></div> 
                      	<!-- /리뷰 페이징 처리 -->   
                      	                          
                    </div>
                    <div class="listing__details__review">
                        <h4>리뷰 및 별점 작성</h4>
                        <form action="/review/new" id="reviewForm" method="post">
                            <div class="listing__details__comment__item__rating">
	                        	별점
	                        	<i class="fa fa-star" name="checked"></i>
	                            <i class="fa fa-star" name="unchecked"></i>
	                            <i class="fa fa-star" name="unchecked"></i>
	                            <i class="fa fa-star" name="unchecked"></i>
	                            <i class="fa fa-star" name="unchecked"></i>
	                        </div>
                            <textarea placeholder="Review" name="review" class="review"></textarea>
                            <button type="submit" class="site-btn">리뷰 등록</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Listing Details Section End -->

<!-- AJAX를 사용하기 위해 review.js 가져오기 -->
<script type="text/javascript" src="/resources/js/review.js"></script>

<!-- 자바스크립트 효과 -->
<script type="text/javascript">

$(document).ready(function(){
	
	/////////////////////////////////////////////////////////////////////
	
	/** 별점 효과 */
	
	/////////////////////////////////////////////////////////////////////
		
	/* 별점효과 1. 회색 별로 변경*/
	var grayStar = $("#reviewForm .listing__details__comment__item__rating i");
	
	grayStar.each(function(index, item){
		if($(item).attr("name").toString()==="unchecked"){
			$(this).css("color", "gray");
		} else {
			$(this).css("color", "orange");
		}
	});
	
	
	/* 별점효과 2.선택하면 주황색 별로 변경, 만약 이미 선택된 주황색 별을 선택한 경우 회색으로 변경*/
	grayStar.click(function(){
	
		if($(this).attr("name").toString()==="unchecked"){
		
			console.log("gray -> orange");
		
			$(this).prevAll("i").css("color", "orange");
			$(this).css("color", "orange");
		
			$(this).attr("name", 'checked');
			$(this).prevAll("i").attr("name", 'checked');
		
		} else if($(this).attr("name").toString()==="checked"){
		
			console.log("orange->gray");
		
			$(this).nextAll("i").css("color", "gray");
			$(this).nextAll("i").attr("name", 'unchecked');
		}
	});
	
	/////////////////////////////////////////////////////////////////////
	
	/** 별점효과 끝*/
	
	/////////////////////////////////////////////////////////////////////
	
	
	/////////////////////////////////////////////////////////////////////
	
	/** AJAX로 리뷰 가져오기, 등록, 삭제, 페이징처리 */
	/** 리뷰 가져오기 + 페이징 처리: showReviewList */
	/** 리뷰 등록: submit + showReviewList(-1) */
	/** 리뷰 삭제:  */
	
	/////////////////////////////////////////////////////////////////////
	
	/** AJAX를 이용해서 리뷰 전체 가져오기 + 평균 별점, 리뷰 개수*/
	
	var pronum = '<c:out value="${productVO.pronum}"/>';
	
	showReviewList(1); // 해당 제품의 리뷰 1페이지 출력	
	
	/*showReviewList 자리*/
	function showReviewList(pageNum){
		
		var reviewListDiv = $(".reviewListDiv");
		var reviewStr = "";
		
		
		reviewService.getReviewList({pronum:pronum, pageNum: pageNum||1},
				function(reviewTotal, reviewList, avgRate, reviewCriteria, rateOne, rateTwo, rateThree, rateFour, rateFive){
						
			showReviewPage(reviewTotal); // 댓글 페이징 처리			
			
			// 페이지번호가 -1인 경우 가장 마지막 페이지 출력
			if(pageNum == -1){
				
				pageNum = Math.ceil(reviewTotal/10.0); // 마지막 페이지 번호
				showReviewList(pageNum); 
				return;
			}
			
			// 해당 게시글에 댓글이 없는 경우 -> 그냥 돌아간다.
			if(reviewList==null || reviewList.length == 0) {
				
				return;
			}
			
			/* 얻어온ReviewPageDTO값을 이용해서 전체 리뷰 개수 표시하기 */
			$(".listing__details__comment h4").html('리뷰('+reviewTotal+')');
			
			
			/* 얻어온ReviewPageDTO값을 이용해서 평균 별점 표시하기 - 상단 */
			console.log("평균 별점: " + avgRate);
			avgRate = avgRate.toFixed(2);
			console.log("평균 별점 반올림: " + avgRate);
			
			var avgRateShowStr = ''; // 별점 표시를 위한 변수
			var star_text = '<span> 별점  &nbsp;</span>';
			console.log("평균별점: " + avgRateShowStr);
			for(var i = 1; i<=avgRate; i++){
				avgRateShowStr += "<span class='icon_star'>&nbsp;</span>";
			}
			$(".listing__hero__widget__rating").html(star_text + avgRateShowStr);
						
			/* 평균 별점 표시: 하단*/			
			$(".listing__details__rating__overall h2").html(avgRate||0);
			$(".listing__details__rating__star").html(avgRateShowStr||0);
			$(".listing__details__rating__star").siblings("span").html("총 " +reviewTotal +"명"||0+"명");
			
			/*점수 별 사람들 표시*/
			
			var ratePerPerson = "";
			
			console.log("reviewTotal: " + reviewTotal);
			
			console.log("rateFive: " + rateFive);
							
			ratePerPerson += '<div class="listing__details__rating__bar__item">' +
								 '<span>5점</span>' +
								 '<div id="bar1" class="barfiller">' +
								 	'<span class="fill" data-percentage="'+Math.ceil(rateFive/reviewTotal*100)+'"'+
								 		'style="background:rgb(240,50,80); width:'+Math.ceil(rateFive/reviewTotal*100)+'%; transition: width 1s ease-in-out 0s;"></span>' +
								 '</div>' + 
								 ' <span class="right">'+rateFive+'명</span>';
								 
			ratePerPerson += '<div class="listing__details__rating__bar__item">' +
								 '<span>4점</span>' +
								 '<div id="bar4" class="barfiller">' +
								 	'<span class="fill" data-percentage="'+Math.ceil(rateFour/reviewTotal*100)+'"'+
								 		'style="background:rgb(240,50,80); width:'+Math.ceil(rateFour/reviewTotal*100)+'%; transition: width 1s ease-in-out 0s;"></span>' +
								 '</div>' + 
								 ' <span class="right">'+rateFour+'명</span>';
								 
			ratePerPerson += '<div class="listing__details__rating__bar__item">' +
								 '<span>3점</span>' +
								 '<div id="bar3" class="barfiller">' +
								 	'<span class="fill" data-percentage="'+Math.ceil(rateThree/reviewTotal*100)+'"'+
								 		'style="background:rgb(240,50,80); width:'+Math.ceil(rateThree/reviewTotal*100)+'%; transition: width 1s ease-in-out 0s;"></span>' +
								 '</div>' + 
								 ' <span class="right">'+rateThree+'명</span>';
								 
			ratePerPerson += '<div class="listing__details__rating__bar__item">' +
								 '<span>2점</span>' +
								 '<div id="bar2" class="barfiller">' +
								 	'<span class="fill" data-percentage="'+Math.ceil(rateTwo/reviewTotal*100)+'"'+
								 		'style="background:rgb(240,50,80); width:'+Math.ceil(rateTwo/reviewTotal*100)+'%; transition: width 1s ease-in-out 0s;"></span>' +
								 '</div>' + 
								 ' <span class="right">'+rateTwo+'명</span>';
								 
			ratePerPerson += '<div class="listing__details__rating__bar__item">' +
								 '<span>1점</span>' +
								 '<div id="bar1" class="barfiller">' +
								 	'<span class="fill" data-percentage="'+Math.ceil(rateOne/reviewTotal*100)+'"'+
								 		'style="background:rgb(240,50,80); width:'+Math.ceil(rateOne/reviewTotal*100)+'%; transition: width 1s ease-in-out 0s;"></span>' +
								 '</div>' + 
								 ' <span class="right">'+rateOne+'명</span>';
			
			$(".listing__details__rating__bar").html(ratePerPerson);			
				
			
			// 댓글이 있는 경우 게시글 출력하기
			for(var i = 0, len=reviewList.length||0; i<len; i++){
				
				var rate_star = "";
				var rateCnt = reviewList[i].rate;
								
				for(var j = 0; j < rateCnt; j++){
		
					rate_star += '<i class="fa fa-star" style="color: orange"></i>';
					
				}
			
				reviewStr += '<div class="listing__details__comment__item">';
				reviewStr +=	'<div class="listing__details__comment__item__rating">';
				reviewStr +=		'<div class="rate_star">';
				reviewStr +=			rate_star;
				reviewStr +=	'</div>';
				reviewStr +=	'</div>';
				reviewStr +=	'<span>'+reviewService.displayTime(reviewList[i].reviewDate)+'</span>';
				reviewStr +=	'<div class="listing__details__comment__item__text">';
				reviewStr +=		'<h5>'+reviewList[i].id+'</h5>';
				reviewStr +=		'<p>'+reviewList[i].review+'</p>';
				reviewStr +=		'<a href="#"><span data-reviewNum="'+reviewList[i].reviewNum+'" class="btn_removeReview" style="border: 2px ridge pink"><i class="fa fa-hand-o-right"></i> 삭제</span></a>';
				reviewStr +=	'</div>';
				reviewStr +=  '</div>';
			} // 바깥 for문
						
			reviewListDiv.html(reviewStr);
			
			remove(pageNum); // append가 되어 값이 처리되는 곳에서 이벤트를 넣어주어야 한다.(remove 함수를 외부에서 만든 후 끌어다 씀)
			
	}) /* -- END: showReviewList 자리*/
	
		/** 블로그 페이징 처리 하단부 등장할 부분 */
		/*다른 곳에서도 쓰기 때문에 ready에 있어야 한다.*/
		//var reviewPageFooter = $(".blog__pagination");
	
		/** 댓글 페이징 처리 자리(showReviewPage(reviewTotal 자리))*/
		/** 댓글 페이징 처리*/		
		function showReviewPage(reviewTotal) {
			
			console.log("showReviiewPage" + reviewTotal);
			
			var endNum = Math.ceil(pageNum / 10.0) * 10; // 현재 리뷰 페이지가 속한 페이지 리스트의 마지막 번호
			var startNum = endNum - 9;
			
			var prev = startNum != 1; // 시작페이지 번호가 1이 아닌 경우 prev버튼 넣을 것
			var next = false;
			
			if(endNum * 10 > reviewTotal){
				endNum = Math.ceil(reviewTotal/10.0); // 마지막 페이지가 전체 페이지 개수보다 많은 경우 조정
			}
			
			if(endNum * 10 < reviewTotal){
				next = true; // 더 뒤로 갈 페이지가 남은 경우 next 버튼 넣기
			}
			
			var str = "";
			
			if(prev){
				str += '<a href="'+(startNum-1)+'"><i class="fa fa-long-arrow-left"></i> Pre</a>';
			}
			
			for(var i = startNum; i<= endNum; i++){
				
				//var actvie = pageNum == i ? "<strong>"+i+"</strong":i; // 현재 페이지의 경우 활성화 표시
				
				if(pageNum == i) {
					str += '<a href="'+i+'"><strong style="color:red">'+i+'</strong></a>';
				} else {
					str += '<a href="'+i+'">'+i+'</a>';
				}
				
			}
			
			if(next){
				str += '<a href="'+(endNum+1)+'">Next<i class="fa fa-long-arrow-right"></i></a>';
			}
			
			reviewPageFooter.html(str);
			
		} // -- END: showReviewPage(reviewTotal)
		
	};
	
	
	var reviewPageFooter = $(".blog__pagination");
	/** 페이지 번호 클릭하면 해당 페이지의 리뷰 출력*/		
	reviewPageFooter.on("click", "a", function(e){
		
		e.preventDefault();
		
		var targetPageNum = $(this).attr("href");
		
		pageNum = targetPageNum;
		
		showReviewList(pageNum);
		
	}); // --END: reviewPageFooter
	
	
	/** AJAX를 이용해서 리뷰 등록하기 */	
	/*구매 여부 확인 필요:: #reviewForm button 클릭 이벤트*/
	$("#reviewForm button").on("click", function(e){
		
		e.preventDefault();
		
		var ratingCnt = 0; // 체크된 별의 개수
		$("i[name=checked]").each(function(i){
			ratingCnt += 1;
		});
		
		var id = 'aa'; // 임시 아이디
		var review = $(".review");
		
		var addReview = {
				pronum: ${productVO.pronum},
				id: id, // 임시로 지정
				review: review.val(),
				rate: ratingCnt
		};
		
		reviewService.add(addReview, function(result){
			alert(result);
		});
		
		// 댓글 등록 후 리뷰, 별점 리셋
		review.val("");
		$("i[name=checked]").css("color", "gray");
		$("i[name=checked]").nextAll("i").attr("name", 'unchecked');
		
		showReviewList(-1);
	}); // /* -- END:: 구매 여부 확인 필요:: #reviewForm button 클릭 이벤트*/
	
	/** 삭제 구현 >> append되는 곳에서 호출해서 사용*/
	function remove(pageNum){
		
		$(".listing__details__comment__item__text a").on("click", function(e){
					
			console.log("remove");
			
			e.preventDefault();
			
			var reviewNum = $(this).children().attr("data-reviewNum");
			var reviewPageNum = pageNum;
						
			console.log(typeof(reviewNum));
			console.log("reviewNum: " + reviewNum);
			
			reviewNum = Number(reviewNum);
			console.log(typeof(reviewNum));
			console.log("reviewNum: " + reviewNum);

			
			reviewService.remove(reviewNum*1, function(result){
				alert(result);
			});
			
			//reviewService.remove($(this).attr)
			
			showReviewList(pageNum);
			
		}); 
		
	} // remove 끝
	
}); // ready 끝
</script>
<!-- footer에서 가져옴 -->

<%@ include file="../includes/footer.jsp"%>