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
<title>书城首页</title>
</head>
<body>
	 
	<div style="width: 100%;">
		<div class="mini-toolbar" style="border-bottom: 0; padding: 0px;">
			<table style="width: 100%;">
				<tr>
					<td style="width: 100%;"><a class="mini-button"
						iconCls="icon-add" onclick="addRow()" plain="true" tooltip="增加...">增加</a>
						<a class="mini-button" iconCls="icon-remove" onclick="removeRow()"
						plain="true">删除</a> <span class="separator"></span> <a
						class="mini-button" iconCls="icon-save" onclick="saveData()"
						plain="true">保存</a></td>
					<td style="white-space: nowrap;"><input id="key" type="text"
						class="mini-textbox" emptyText="请输入书籍名称" style="width: 150px;"
						onenter="onKeyEnter" /> <a class="mini-button" onclick="search()">查询</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="datagrid1" class="mini-datagrid"
		style="width:100%; height: 580px;" url="BookList" idField="id"
		allowResize="true" pageSize="20" allowCellEdit="true"
		allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		editNextRowCell="true">
		<div property="columns">
			<!-- <div type="indexcolumn"></div> -->
			<div type="checkcolumn"></div>
			<div field="img" style="dispay:none" width="200px" ></div>
			<!-- <div field="message" width="200px" ></div> -->
			<!-- <div field="name" width="120" headerAlign="center" allowSort="true">书籍名称</div>
			<div field="type" width="100" renderer="onGenderRenderer"
				align="center" headerAlign="center">类别</div>
			<div field="price" numberFormat="¥#,0.00" align="right" width="100"
				allowSort="true">价格</div>
			<div field="author" width="100" allowSort="true" decimalPlaces="2"
				dataType="float">作者</div>
			<div field="number" width="100" allowSort="true" decimalPlaces="2"
				dataType="float">书籍编号</div>
			<div field="content" width="100" allowSort="true" decimalPlaces="2"
				dataType="float">详情</div>
			<div field="content" width="100" allowSort="true" decimalPlaces="2"
				dataType="float">操作</div> -->
		</div>
	</div>
</body>

<script type="text/javascript">
var search;
var onGenderRenderer;
	$(function() {
		mini.parse();
		var grid = mini.get("datagrid1");
		
		grid.load();
		search=function search() {
			var key = $("#key").val();
			$("#key").focus();
			return ;
			console.log(key);
			grid.load({
				key : key
			});
		}
		$("#key").bind("keydown", function(e) {
			if (e.keyCode == 13) {
				search();
				console.log(e)
			}
		});
		///////////////////////////////////////////////////////
		var Genders = [ {
			id : 1,
			text : '男'
		}, {
			id : 2,
			text : '女'
		} ];
		onGenderRenderer=function onGenderRenderer(e) {
			console.log(e)
			for (var i = 0, l = Genders.length; i < l; i++) {
				var g = Genders[i];
				if (g.id == e.value)
					return g.text;
			}
			return "";
		}
	})
</script>
</html>
