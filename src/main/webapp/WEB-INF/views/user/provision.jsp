<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- header.jsp에 있는 내용으로 여기서는 주석처리: <meta charset="UTF-8"> -->
<title>ForReport</title>
</head>

<%@ include file="../includes/header.jsp"%>

<!-- Hero Section Begin -->
<section class="hero set-bg"
	data-setbg="/resources/img/hero/hero-bg.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="hero__text">
					<article id="content" class="cols-d">
						<div>
							<h1>이용약관</h1>
							<form id="terms_form" class="f"
								action="http://javaking75.blog.me">
								<h4 class="scheme-g">●이용약관1</h4>
								<textarea style="font-size: 1em;">내용입니다.
            </textarea>
								<p>
									<input type="checkbox" id="check_1" name="" /> 위의 약관에 동의 합니다.<br />
								</p>
								<h4 class="scheme-g">●이용약관2</h4>
								<textarea style="font-size: 1em;">내용입니다.
            </textarea>
								<p>
									<input type="checkbox" id="check_2" name="" /> 위의 약관에 동의 합니다.<br />
								</p>
								<h4 class="scheme-g">●개인정보취급방침</h4>
								<textarea style="font-size: 1em;">내용입니다. 

            </textarea>
								<p>
									<input type="checkbox" id="check_3" name="" /> 위의 약관에 동의 합니다.<br />
									<input type="button" id="nextBtn" class="button_big"
										style="padding: 0 10px 10px 10px; height: 24px;" value="다음단계로" />
								</p>
							</form>
						</div>
					</article>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Hero Section End -->


<style type="text/css">
* {
	font-family: 'malgun gothic';
}

#content.cols-d {
	width: 583px;
	min-width: 583px;
}

.f {
	position: relative;
	margin: 0;
	padding: 0;
	color: #666;
}

.f p {
	width: 100%;
	margin: 0 0 13px;
	font-size: 1.3em;
	text-align: center;
	margin-top: 20px;
}

.f p:after {
	content: "";
	display: block;
	overflow: hidden;
	clear: both;
	height: 0;
}

.f textarea {
	position: relative;
	width: 570px;
	height: 118px;
	min-height: 118px;
	padding: 3px 3px 3px 6px;
	border: 1px solid #ececec;
	border-top-color: #e1e1e1;
	border-left-color: #e1e1e1;
	background: #ececec;
	border-radius: 3px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
}

.scheme-g {
	margin: 26px 0 8px;
	padding: 0px;
	font-size: 1.2em;
	font-weight: 100;
}

.button_big {
	float: right;
	border: 0;
	border-radius: 3px;
	cursor: pointer;
	display: inline-block;
	font-size: 12px;
	font-weight: bold;
	line-height: 24px;
	margin-left: 5px;
	padding: 8px 16px;
	text-decoration: none;
	color: #fff;
	background: #0080ff;
	text-shadow: 1px 1px 1px #0066cc;
	-webkit-transition: all 0.2s ease-out;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$("#nextBtn").click(function() {
			if ($("#check_1").is(":checked") == false) {
				alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
				return;
			} else if ($("#check_2").is(":checked") == false) {
				alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
				return;
			} else if ($("#check_3").is(":checked") == false) {
				alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다...");
				return;
			} else {
				$("#terms_form").submit();
			}
		});
	});
</script>
[출처] [jQuery] 예제 : 약관 동의 화면 예제 ( is(":checked") )|작성자 자바킹



<%@ include file="../includes/footer.jsp"%>