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
<script type="text/javascript">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>书城首页</title>
</head>
<body>

	<div id="datagrid1" class="mini-datagrid"
		style="width: 100%; height: 550px;"
		url="/BookList" idField="id"
		allowResize="true" sizeList="[20,30,50,100]" pageSize="20">
		<div property="columns">
			<div type="indexcolumn"></div>
			<div field="loginname" width="120" headerAlign="center"
				allowSort="true">员工帐号</div>
			<div field="name" width="120" headerAlign="center" allowSort="true">姓名</div>
			<div field="gender" width="100" renderer="onGenderRenderer"
				align="center" headerAlign="center">性别</div>
			<div field="salary" numberFormat="¥#,0.00" align="right" width="100"
				allowSort="true">薪资</div>
			<div field="age" width="100" allowSort="true" decimalPlaces="2"
				dataType="float">年龄</div>
			<div field="createtime" width="100" headerAlign="center"
				dateFormat="yyyy-MM-dd" allowSort="true">创建日期</div>
		</div>
	</div>
</body>
</html>
