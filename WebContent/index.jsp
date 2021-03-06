﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>书城首页</title>
<style type="text/css">
.demo {
	width: 820px;
	margin: 60px auto 10px auto
}

.m-sidebar {
	position: fixed;
	top: 0;
	right: 0;
	background: #000;
	z-index: 2000;
	width: 35px;
	height: 100%;
	font-size: 12px;
	color: #fff;
}

.cart {
	color: #fff;
	text-align: center;
	line-height: 20px;
	padding: 200px 0 0 0px;
}

.cart span {
	display: block;
	width: 20px;
	margin: 0 auto;
}

.cart i {
	width: 35px;
	height: 35px;
	display: block;
	background: url(car.png) no-repeat;
}

#msg {
	position: fixed;
	top: 300px;
	right: 35px;
	z-index: 10000;
	width: 1px;
	height: 52px;
	line-height: 52px;
	font-size: 20px;
	text-align: center;
	color: #fff;
	background: #360;
	display: none
}

.box {
	float: left;
	width: 198px;
	height: 320px;
	margin-left: 5px;
	border: 1px solid #e0e0e0;
	text-align: center
}

.box p {
	line-height: 20px;
	padding: 4px 4px 10px 4px;
	text-align: left
}

.box:hover {
	border: 1px solid #f90
}

.box h4 {
	line-height: 32px;
	font-size: 14px;
	color: #f30;
	font-weight: 500
}

.box h4 span {
	font-size: 20px
}

.u-flyer {
	display: block;
	width: 50px;
	height: 50px;
	border-radius: 50px;
	position: fixed;
	z-index: 9999;
}

.button {
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 16px/100% 'Microsoft yahei', Arial, Helvetica, sans-serif;
	padding: .5em 2em .55em;
	text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
	-webkit-border-radius: .5em;
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
}

.button:hover {
	text-decoration: none;
}

.button:active {
	position: relative;
	top: 1px;
}
/* orange */
.orange {
	color: #fef4e9;
	border: solid 1px #da7c0c;
	background: #f78d1d;
	background: -webkit-gradient(linear, left top, left bottom, from(#faa51a),
		to(#f47a20));
	background: -moz-linear-gradient(top, #faa51a, #f47a20);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#faa51a',
		endColorstr='#f47a20');
}

.orange:hover {
	background: #f47c20;
	background: -webkit-gradient(linear, left top, left bottom, from(#f88e11),
		to(#f06015));
	background: -moz-linear-gradient(top, #f88e11, #f06015);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f88e11',
		endColorstr='#f06015');
}

.orange:active {
	color: #fcd3a5;
	background: -webkit-gradient(linear, left top, left bottom, from(#f47a20),
		to(#faa51a));
	background: -moz-linear-gradient(top, #f47a20, #faa51a);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20',
		endColorstr='#faa51a');
}
</style>
<script type="text/javascript"
	src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="jquery.fly.min.js"></script>
<!--[if lte IE 9]>
<script src="requestAnimationFrame.js"></script>
<![endif]-->
<script>
function loadUrl(id){
	location.href='bookInfo?bookId='+id;
}
	function init() {
		var offset = $("#end").offset(); //结束的地方的元素
		$(".addcar").click(
				function(event) { //是$(".addcar")这个元素点击促发的 开始动画的位置就是这个元素的位置为起点
					var addcar = $(this);
					var img = addcar.parent().find('img').attr('src');
					var flyer = $('<img class="u-flyer" src="'+img+'">');
					flyer.fly({
						start : {
							left : event.pageX,
							top : event.pageY
						},
						end : {
							left : offset.left + 10,
							top : offset.top + 10,
							width : 0,
							height : 0
						},
						onEnd : function() {
							$("#msg").show().animate({
								width : '250px'
							}, 200).fadeOut(1000);
							addcar.css("cursor", "default").removeClass(
									'orange').unbind('click');
							this.destory();
						}
					});
					$.ajax({
						url : 'AddShopCar',
						type : "POST",
						data : {bookId:addcar.attr('id')},
						success:function(data){
							data = $.parseJSON(data);
							if (!data.success) {
								alert(data.msg);
							}
						}
					})
				});
	}
	$(function() {

		var html;
		$
				.ajax({
					url : 'BookList',
					data : {key:$('#key').val()},
					type : "GET",
					success : function(data) {
						data = $.parseJSON(data);
						for (var i = 0; i < data.data.length; i++) {
							html = '<div class="box" style="padding-top:5px;margin-top:60px;" height="400px">'
									+ '<div  onClick="loadUrl('+data.data[i].id+')" >'+data.data[i].img
									+ '<h4>¥<span>'
									+ data.data[i].price
									+ '</span></h4>'
									+ '<p>&nbsp;&nbsp;&nbsp;'
									+ data.data[i].name
									+ '<br/>'
									+ data.data[i].content
									+ '</p></div>'
									+ '<a href="#" id="'+data.data[i].id+'" class="button orange addcar">加入购物车</a>'
									+ '</div>';
							$('#demo').append(html);
						}
						init();
					}
				})

	});
	function sub(){
		$.ajax({
			url:'BookList',
			type:'POST',
			data:{key:$('#key').val(),type:$('#type').val()},
			success:function(data){
				data = $.parseJSON(data);
				$('#demo').html("");
				if (!data.success) {
					alert(data.msg);
				}else{
					for (var i = 0; i < data.data.length; i++) {
						html = '<div class="box" style="padding-top:5px;margin-top:60px;" height="400px">'
								+ data.data[i].img
								+ '<h4>¥<span>'
								+ data.data[i].price
								+ '</span></h4>'
								+ '<p>&nbsp;&nbsp;&nbsp;'
								+ data.data[i].name
								+ '<br/>'
								+ data.data[i].content
								+ '</p>'
								+ '<a href="#" id="'+data.data[i].id+'" class="button orange addcar">加入购物车</a>'
								+ '</div>';
						$('#demo').append(html);
					}
					init();
					
				}
			}
		})
	}
	
</script>
</head>

<body>
	<div id="main">
		<h2 class="top_title">书城首页</h2>
		 
		<div class="demo">
		 	<input type="text" valeu="" id='key' name="key"/>
			<select id='type'>
				<option value="">请选择</option>
				<option value="计算机">计算机</option>
				<option value="政治">政治</option>
				<option value="物理">物理</option>
				<option value="小说">小说</option>
			</select>
			<button type="submit" onclick="sub()">查询</button>
			<br/>
		<div class="demo" id='demo' style="margin-top: -60px">
			
			<!--<div class="box" style="padding-top: 5px; margin-top: 60px;"
				height="400px">
				<img src="images/lg.jpg" class="img" width="180" height="180">
				<h4>
					¥<span>3499.00</span>
				</h4>
				<p>LG 49LF5400-CA 49寸IPS硬屏富贵招财铜钱设计</p>
				<a href="#" class="button orange addcar">加入购物车</a>
			</div>
			<div class="box">
				<img src="images/hs.jpg" class="img" width="180" height="180">
				<h4>
					¥<span>3799.00</span>
				</h4>
				<p>Hisense/海信 LED50T1A 海信电视官方旗舰店</p>
				<a href="#" class="button orange addcar">加入购物车</a>
			</div>
			<div class="box">
				<img src="images/cw.jpg" class="img" width="180" height="180">
				<h4>
					¥<span>¥3999.00</span>
				</h4>
				<p>Skyworth/创维 50E8EUS 8核4Kj极清酷开系统智能液晶电视</p>
				<a href="#" class="button orange addcar">加入购物车</a>
			</div>
			<div class="box">
				<img src="images/ls.jpg" class="img" width="180" height="180">
				<h4>
					¥<span>6969.00</span>
				</h4>
				<p>乐视TV Letv X60S 4核1080P高清3D安卓智能超级电视</p>
				<a href="#" class="button orange addcar">加入购物车</a>
			</div> -->
		</div>

	</div>

	<div class="m-sidebar">
		<div class="cart">
			<i id="end"></i> <span><a href='shopcart1.jsp'>购物车</a></span>
		</div>
	</div>
	<div id="msg">已成功加入购物车！</div>
	</div>
</body>
</html>
