<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="cn" class="no-js">
<head>
<meta charset="utf-8">
<title>登录</title>
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
		location.href = "registered.jsp";
	}
	if("${msg}"!=""){
		alert("${msg}");
	}
</script>
</head>
<body>
	<div class="page-container">
		<h1>登录</h1>
		<form id="form" action="Login" method="post">
			<input type="text" id="username" name="username" class="username"
				placeholder="用户名"> <input type="password" id="password"
				name="password" class="password"placeholder="密码">
			<button onclick="loginYz" type="submit">登录</button>
			<button onclick="loginYz()">注册</button>
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



