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
					<h2>이메일 본인 인증</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Blog Hero End -->

<div class="container">
	<div class="row">
		<div class="col-lg-4">
			<div class="hero__text">
				<article id="content" class="cols-d">
					<div>
						<form action="/user/.fr" method="POST">

							<!-- 이메일 발송 -->
							<div class="form-group">
								<label for="email">이메일</label> <input type="text"
									class="form-control" name="email" id="email"
									placeholder="이메일 주소를 입력하세요" required>
								<div class="check_font" id="emailCheck"></div>
								<button type="submit" id="sendBtn"
									class="btn btn-outline-danger btn-sm px-3">
									<i class="fa fa-envelope"></i>&nbsp;이메일 인증받기 (이메일 보내기)
								</button>
								&nbsp;
							</div>

							<div class="form-group">
								<!-- 인증번호입력 -->
								<div>
									<input type="number" style="margin-top: 5px;"
										class="email_form" name="email_confirm" id="email_confirm"
										placeholder="인증번호 입력" required>
									<button type="button" class="btn btn-outline-info btn-sm px-3"
										onclick="">
										<i class="fa fa-envelope"></i>&nbsp;확인
									</button>
									&nbsp;
								</div>
							</div>

							<!-- 취소 | 다음 버튼-->
							<div class="reg_button">
								<a class="btn btn-danger px-3"
									href="${pageContext.request.contextPath}"> <i
									class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
								</a>&emsp;&emsp;
								<button class="btn btn-primary px-3" id="reg_submit"
									type="submit">
									<i class="fa fa-heart pr-2" aria-hidden="true"></i>다음단계
								</button>
							</div>
						</form>
					</div>
				</article>
			</div>
		</div>
	</div>
</div>

<script>
// 이메일 유효성 검사(1 = 중복 / 0 = 중복x)
	$("#email").on(function() {
		var email = $("#email").val();
		
		$.ajax({
			url : '/user/emailCheck.fr',
			type : 'post',
			data : {email : email},
			success : function(result) {
			
			// 1 : 이메일 중복
			if(result != 'fail'){
				$("#emailCheck").text("사용중인 이메일입니다");
				$("#emailCheck").css("color", "red");
				$("#sendBtn").attr("disabled", false);	// 메일 보내기 버튼 비활성화	
				
				
			} else if(email == ""){
					
				$('#emailCheck').text('이메일을 입력해주세요 :)');
				$('#emailCheck').css('color', 'red');
				$("#sendBtn").attr("disabled", false);							
			}
		}
	});
});
</script>
<%@ include file="../includes/footer.jsp"%>