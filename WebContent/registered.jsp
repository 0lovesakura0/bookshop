<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="cn" class="no-js">
<head>
<meta charset="utf-8">
<title>注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- CSS -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/supersized.css">
<link rel="stylesheet" href="css/style.css">

<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<link
	href="<%=request.getContextPath()%>/scripts/miniui/themes/default/miniui.css"
	rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/scripts/miniui/miniui.js"
	type="text/javascript"></script>


<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script type="text/javascript">
	function loginYz() {
		location.href = "login.jsp";
	}
	if ("${msg}" != "") {
		alert("${msg}1");
	}
</script>
</head>
<body>
	<div class="page-container">
		<h1>注册</h1>
		<form action="registered" id='form' method="post">
			<input type="text" name="username" class="username" placeholder="用户名">
			<input type="password" name="password" id='password' class="password"
				placeholder="密码"> <input type="password" id="password1"
				class="password" placeholder="重复密码">
			<button type="submit">注册</button>
			<button onclick="loginYz()">登录</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>
	</div>
	<!-- Javascript -->
	<script src="js/jquery-1.9.1.js"></script>
	<script src="js/supersized.3.2.7.min.js"></script>
	<script src="js/supersized-init.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
<script type="text/javascript">
	$('#form').submit(function() {
		if ($('#password').val() != $('#password1').val()) {
			alert("两次密码不一致");
			return false;
		}
	})
</script>

