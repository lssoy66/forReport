<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Login V15</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="/resources/Login/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/Login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/Login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/Login/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/Login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/Login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/Login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/Login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/Login/css/util.css">
<link rel="stylesheet" type="text/css"
	href="/resources/Login/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title">
<!-- 					style="background-image: url(/resources/Login/images/bg-01.jpg);"> -->
<!-- 										<span class="login100-form-title-1"> For Report </span> -->
					<img alt="" src="/resources/img/logo_for.png">
					
				</div>

				<form class="login100-form validate-form" action="/login"
					method="post">
					<div class="wrap-input100 validate-input m-b-26"
						data-validate="Username is required">
						<span class="label-input100">Username</span> <input
							class="input100" type="text" name="username"
							placeholder="Enter username"> <span
							class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18"
						data-validate="Password is required">
						<span class="label-input100">Password</span> <input
							class="input100" type="password" name="password"
							placeholder="Enter password"> <span
							class="focus-input100"></span>
					</div>

					<div class="flex-sb-m w-full p-b-30">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox"
								name="remember-me"> <label class="label-checkbox100"
								for="ckb1"> Remember me </label>
						</div>

						<div>
							<a href="#" class="txt1"> Forgot Password? </a>
						</div>
					</div>

					<div>

						<div =class="container-login100-form-btn">
							<input type="submit" name="submit" class="login100-form-btn"
								value="Login">
						</div>

						<div class="container-login100-form-btn">
							<div class="login101-form-btn">
								<a href="#">With Kakao</a>
							</div>
						</div>

						
					</div>

					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }">
				</form>
			</div>
		</div>
	</div>

	<!--===============================================================================================-->
	<script src="/resources/Login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/Login/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/Login/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/Login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/Login/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/Login/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="/resources/Login/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/Login/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/Login/js/main.js"></script>

</body>
</html>