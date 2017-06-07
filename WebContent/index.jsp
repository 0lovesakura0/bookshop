<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<link
	href="<%=request.getContextPath()%>/scripts/miniui/themes/default/miniui.css"
	rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/scripts/miniui/miniui.js"
	type="text/javascript"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	hello,world!
	<input id="helloBtn" class="mini-button" text="Hello"
		onclick="onHelloClick" />
	<script type="text/javascript">
		function onHelloClick(e) {
			var button = e.sender;
			mini.alert("Hello你好	 MiniUI!");
		}
		
	</script>
</body>
</html>