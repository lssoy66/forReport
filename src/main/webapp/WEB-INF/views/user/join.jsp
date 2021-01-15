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
					<h2>회원 가입</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Blog Hero End -->

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="hero__text">
				<article id="content" class="cols-d">
					<div>
						<form method="POST" id="joinForm">
							<!-- 아이디 -->
							<div class="form-group">
								<label for="id">아이디</label> <input type="text"
									class="form-control" id="id" name="id"
									placeholder="ID" required>
								<div class="check_font" id="idcheck"></div>
							</div>
							<!-- 비밀번호 -->
							<div class="form-group">
								<label for="user_pw">비밀번호</label> <input type="password"
									class="form-control" id="password" name="password"
									placeholder="PASSWORD" required>
								<div class="check_font" id="pw_check"></div>
							</div>
							<!-- 비밀번호 재확인 -->
							<div class="form-group">
								<label for="user_pw2">비밀번호 확인</label> <input type="password"
									class="form-control" id="password2" name="password2"
									placeholder="Confirm Password" required>
								<div class="check_font" id="pw2_check"></div>
							</div>
							<!-- 이름 -->
							<div class="form-group">
								<label for="user_name">이름</label> <input type="text"
									class="form-control" id="name" name="name"
									placeholder="Name" required>
								<div class="check_font" id="name_check"></div>
							</div>
							<!-- 본인확인 이메일 -->
							<div class="form-group">
								<label for="user_email">이메일</label> <input type="text"
									class="form-control" name="email" id="email"
									placeholder="E-mail" required>
								<!-- <input type="text" style="margin-top: 5px;"class="email_form" name="email_confirm" id="email_confirm" placeholder="인증번호를 입력해주세요!" required>
						<button type="button" class="btn btn-outline-danger btn-sm px-3" onclick="confirm_email()">
							<i class="fa fa-envelope"></i>&nbsp;인증
						</button>&nbsp;
						<button type="button" class="btn btn-outline-info btn-sm px-3">
							<i class="fa fa-envelope"></i>&nbsp;확인
						</button>&nbsp; -->
								<div class="check_font" id="email_check"></div>
							</div>
							<!-- 휴대전화 -->
							<div class="form-group">
								<label for="user_phone">휴대전화 ('-' 없이 번호만 입력해주세요)</label> <input
									type="text" class="form-control" id="phone"
									name="phone" placeholder="Phone Number" required>
								<div class="check_font" id="phone_check"></div>
							</div>
							<div class="reg_button">
								<a class="btn btn-danger px-3"
									href="${pageContext.request.contextPath}"> <i
									class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
								</a>&emsp;&emsp;
								<button class="btn btn-primary px-3" id="joinBtn">
									<i class="fa fa-user-plus" aria-hidden="true"></i>가입하기
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

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$("#joinBtn").click(function(){
		$("#joinForm").attr("action", "/user/join.fr");
		$("#joinForm").submit();
	});
});

//아이디 중복검사
$('#id').on("propertychange change keyup paste input", function(){
	var data = {id : $('#id').val()};
	
	$.ajax({
		type : "post",
		url : "/user/idCheck.fr",
		data : data,
		success : function(result){
			if(result != 'fail'){
				$('#idcheck').text("사용중인 아이디입니다.");
				$("#idcheck").css("color", "red");
			}
		}
	});
});
</script>
<%@ include file="../includes/footer.jsp"%>