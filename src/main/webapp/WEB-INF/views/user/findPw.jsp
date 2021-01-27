<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../includes/cartHeader.jsp"%>

<!-- Blog Hero Begin -->
<div class="blog-details-hero set-bg"
	data-setbg="/resources/img/blog/details/blog-hero.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-7">
				<div class="blog__hero__text">
					<h2></h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Blog Hero End -->

<div class="w3-content w3-container w3-margin-top">
	<div class="w3-container w3-card-4">
		<form action="/user/findIdProcess.fr" method="post">
		<!-- spring security csrf token 설정1 -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				<p>
					<label>ID</label> <input class="w3-input" type="text" id="id"
						name="id" required>
				</p>
				<p>
					<label>Email</label> <input class="w3-input" type="text" id="email"
						name="email" required>
				</p>
				<p class="w3-center">
					<button type="submit" id=findBtn
						class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">찾기</button>
					<button type="button" onclick="history.go(-1);"
						class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
				</p>
			</div>
		</form>
	</div>
</div>

<!-- <script>
var code = ""; // 이메일 인증번호

// spring security csrf token 설정2
var header = "${_csrf.headerName}";
var token = "${_csrf.token}";

// 이메일 확인
$("#findBtn").click(function() {
	var email = $("#email").val();	// 이메일 주소

	$.ajax({
		url : '/user/findPwProcess.fr',
		type : 'post',
		// spring security csrf token 설정3
		beforeSend : function(xhr){
			if(token && header){
				xhr.setRequestHeader(header, token);
			}
		},
		data : {
			email : email
		},
		success : function(result) {

			if (result == 'fail') {
				$("#emailCheck").text("사용중인 이메일입니다");
				$("#emailCheck").css("color", "red");

			} else if (email == "") {

				$('#emailCheck').text('이메일을 입력해주세요');
				$('#emailCheck').css('color', 'red');
				
			} else if (!mailJ.test(email)) {

				$('#emailCheck').text('이메일을 다시 입력해주세요 예)forreport0202@gmail.com');
				$('#emailCheck').css('color', 'red');

			} else {

				$('#emailCheck').text('사용 가능한 이메일입니다');
				$('#emailCheck').css('color', 'green');
				$("#sendBtn").attr("disabled", false); // 메일 보내기 버튼 활성화 변경						
			}
		}
	});
});

// 인증번호 이메일 전송
$("#sendBtn").click(function() {
	var email = $("#email").val();	// 이메일 주소

	$.ajax({
		type : 'get',
		url : 'certificationProcess.fr?email=' + email,
		// spring security csrf token 설정3
		beforeSend : function(xhr){
			if(token && header){
				xhr.setRequestHeader(header, token);
			}
		},
		success : function(data) {

			code = data;
		}
	});
	$("#codeCheck").focus();
});

// 인증번호 비교
$("#codeCheckBtn").click(function() {
	var inputCode = $("#codeCheck").val(); //입력 코드
	var checkResult = $("#checkResult"); // 비교 결과
	
	if(inputCode == code){
		checkResult.text("인증번호가 일치합니다");
		checkResult.css('color', 'green');
		$("#nextBtn").attr('disabled', false);		// 다음단계 버튼 활성화

	} else {
		checkResult.text("인증번호를 다시 확인해주세요");
		checkResult.css('color', 'red');
	}

});

// 회원가입 페이지 이동(이메일 주소 포함)
$("#nextBtn").click(function(){
	var email = $("#email").val();	// 이메일 주소
	

	$("#form1").attr('action', '/user/join.fr');
	$("#form1").submit();
	
});
</script> -->
<%@ include file="../includes/footer.jsp"%>