<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>订单管理</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.1.4.2-min.js"></script>
<script type="text/javascript" src="js/Calculation.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//jquery特效制作复选框全选反选取消(无插件)
		// 全选        
		$(".allselect").click(function() {
			$(".gwc_tb2 input[name=newslist]").each(function() {
				$(this).attr("checked", true);
				// $(this).next().css({ "background-color": "#3366cc", "color": "#ffffff" });
			});
			GetCount();
		});

		//反选
		$("#invert").click(function() {
			$(".gwc_tb2 input[name=newslist]").each(function() {
				if ($(this).attr("checked")) {
					$(this).attr("checked", false);
					//$(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
				} else {
					$(this).attr("checked", true);
					//$(this).next().css({ "background-color": "#3366cc", "color": "#000000" });
				}
			});
			GetCount();
		});

		//取消
		$("#cancel").click(function() {
			$(".gwc_tb2 input[name=newslist]").each(function() {
				$(this).attr("checked", false);
				// $(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
			});
			GetCount();
		});

		// 所有复选(:checkbox)框点击事件
		$(".gwc_tb2 input[name=newslist]").click(function() {
			if ($(this).attr("checked")) {
				//$(this).next().css({ "background-color": "#3366cc", "color": "#ffffff" });
			} else {
				// $(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
			}
		});

		// 输出
		$(".gwc_tb2 input[name=newslist]").click(function() {
			// $("#total2").html() = GetCount($(this));
			GetCount();
			//alert(conts);
		});
	});
	//******************
	function GetCount() {
		var conts = 0;
		var aa = 0;
		$(".gwc_tb2 input[name=newslist]").each(function() {
			if ($(this).attr("checked")) {
				for (var i = 0; i < $(this).length; i++) {
					conts += parseInt($(this).val());
					aa += 1;
				}
			}
		});
		$("#shuliang").text(aa);
		$("#zong1").html((conts).toFixed(2));
		$("#jz1").css("display", "none");
		$("#jz2").css("display", "block");
	}
</script>


</head>
<body>

	<div class="gwc" style="margin: auto;">
		<div id='div'>
			<!-- <table cellpadding="0" cellspacing="0" class="gwc_tb1">
				<tr>
					<td class="tb1_td1"></td>
					<td class="tb1_td1"></td>
					<td class="tb1_td3">商品</td>
					<td class="tb1_td4">商品信息</td>
					<td class="tb1_td5">数量</td>
					<td class="tb1_td6">单价</td>
					<td class="tb1_td7">操作</td>
				</tr>
			</table> -->
		</div>
		<!---商品加减算总数---->
		<script type="text/javascript">
			var totleCount = 0;
			function ocMin(id) {
				if (parseInt($('#text_box' + id).val()) > 1) {
					$('#text_box' + id).val(
							parseInt($('#text_box' + id).val()) - 1);
					setTotal();

				}
			}
			function ocMax(id) {
				if (parseInt($('#text_box' + id).val()) < 99) {
					$('#text_box' + id).val(
							parseInt($('#text_box' + id).val()) + 1);
					setTotal();
				}
			}
			$(function() {
				$("#jz2").css("display", "block");
				$
						.ajax({
							url : "searchBookOrder",
							type : "GET",
							data : {},
							success : function(data) {
								data = $.parseJSON(data);
								var a = 0;
								totleCount = data.data.length;
								var html = '<table cellpadding="0" cellspacing="0" class="gwc_tb1">'
										+ '	<tr>   '
										+ '<td class="tb1_td1"> </td>     '
										+ '<td class="tb1_td1"> </td>     '
										+ '<td class="tb1_td3">商品</td>  '
										+ '<td class="tb1_td4">商品信息</t>'
										+ '<td class="tb1_td5">数量</td>  '
										+ '<td class="tb1_td6">单价</td>  '
										+ '<td class="tb1_td7">操作</td>  '
										+ '</tr>' + '</table>';
								var boid = 0;
								for (var i = 0; i < data.data.length; i++) {
									 
									if (boid == 0) {
										boid = data.data[i].boid;
									}
								
									if (boid != data.data[i].boid) {
										boid=data.data[i].boid;
										html = '<table cellpadding="0" cellspacing="0" class="gwc_tb1">'
												+ '	<tr>   '
												+ '<td class="tb1_td1"> </td>     '
												+ '<td class="tb1_td1"> </td>     '
												+ '<td class="tb1_td3">商品</td>  '
												+ '<td class="tb1_td4">商品信息</t>'
												+ '<td class="tb1_td5">数量</td>  '
												+ '<td class="tb1_td6">单价</td>  '
												+ '<td class="tb1_td7">操作</td>  '
												+ '</tr>' + '</table>';
									}
									html += '	'
											+ '<table cellpadding="0" cellspacing="0" class="gwc_tb2">'
											+ '<tr>'
											+ '	<td class="tb2_td1"> </td>'
											+ '	<td class="tb2_td2"><a href="#"><img src="'+data.data[i].img+'"/></a></td>'
											+ '	<td class="tb2_td3"><a href="#">'
											+ data.data[i].name
											+ '</a></td>'
											+ '	<td class="tb1_td4">'
											+ data.data[i].content
											+ '</td>'
											+ '	<td class="tb1_td5">'
											+ '	'
											+ '		<input id="text_box'+i+'" name="" readOnly="readOnly"   type="text" value="'
											+data.data[i].number
											+'" style=" width:30px; text-align:center; border:1px solid #ccc;" />'
											+ '		'
											+ '	</td>'
											+ '	<td class="tb1_td6"><label id="total'+i+'" class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;">'
											+ (parseInt(data.data[i].price))
													.toFixed(2)
											+ '</label></td>'
											+ '	<td class="tb1_td7"> <s>删除</s></td>'
											+ '</tr>' + '</table>';
									if (i==data.data.length-1) {
										html += '<table cellpadding="0" cellspacing="0" class="gwc_tb3">'
											+ '<tr>'
											+ '<td class="tb1_td1"></td>'
											+ '<td class="tb1_td1"></td>'
											+ '<td class="tb3_td1"></td>'
											+ '<td class="tb3_td2"></td>'
											+ '<td class="tb3_td3">合计(不含运费):<span>￥</span><span'
										+'	style="color: #ff5500;"><label id="zong'+i+'"'
										+'		style="color: #ff5500; font-size: 14px; font-weight: bold;">'+(parseInt(data.data[i].price) * parseInt(data.data[i].number)).toFixed(2)+'</label></span></td>'
											+ '<td class="tb3_td4"><s>结算</s></td>     '
											+ '</tr>             '
											+ '</table>        ';
											
									}else if (boid != data.data[i + 1].boid) {
										html += '<table cellpadding="0" cellspacing="0" class="gwc_tb3">'
												+ '<tr>'
												+ '<td class="tb1_td1"></td>'
												+ '<td class="tb1_td1"></td>'
												+ '<td class="tb3_td1"></td>'
												+ '<td class="tb3_td2"></td>'
												+ '<td class="tb3_td3">合计(不含运费):<span>￥</span><span'
											+'	style="color: #ff5500;"><label id="zong'+i+'"'
											+'		style="color: #ff5500; font-size: 14px; font-weight: bold;">'+parseInt(data.data[i].zong).toFixed(2)+'</label></span></td>'
												+ '<td class="tb3_td4"><s>结算</s></td>     '
												+ '</tr>             '
												+ '</table>        ';
												
										//a = (parseInt(data.data[i].price) * parseInt(data.data[i].number))
										//$('#zong' + i).text(a.toFixed(2));
									}
									console.log(html);
									$('#div').append(html);
									html="";
								}

							}

						});
			})
		</script>

		<!-- <table cellpadding="0" cellspacing="0" class="gwc_tb2">
			<tr>
				<td class="tb2_td1"><input type="checkbox" value="1"
					name="newslist" id="newslist-1" /></td>
				<td class="tb2_td2"><a href="#"><img src="images/img1.jpg" /></a></td>
				<td class="tb2_td3"><a href="#">产品标题</a></td>
				<td class="tb1_td4">一件</td>
				<td class="tb1_td5"><input id="min1" name=""
					style="width: 20px; height: 18px; border: 1px solid #ccc;"
					type="button" value="-" /> <input id="text_box1" name=""
					type="text" value="1"
					style="width: 30px; text-align: center; border: 1px solid #ccc;" />
					<input id="add1" name=""
					style="width: 20px; height: 18px; border: 1px solid #ccc;"
					type="button" value="+" /></td>
				<td class="tb1_td6"><label id="total1" class="tot"
					style="color: #ff5500; font-size: 14px; font-weight: bold;"></label></td>
				<td class="tb1_td7"><a href="#">删除</a></td>
			</tr>
		</table>
 -->
		<!---商品加减算总数---->
		<script type="text/javascript">
			function setTotal() {
				var totle = 0;
				for (var i = 0; i < totleCount; i++) {
					totle += parseInt($('#total' + i).text())
							* parseInt($('#text_box' + i).val())
				}
				$('#zong1').text(totle.toFixed(2));
			}
		</script>
		<!-- <table cellpadding="0" cellspacing="0" class="gwc_tb2">
			<tr>
				<td class="tb2_td1"><input type="checkbox" value="1"
					name="newslist" id="newslist-2" /></td>
				<td class="tb2_td2"><a href="#"><img src="images/img2.jpg" /></a></td>
				<td class="tb2_td3"><a href="#">产品标题</a></td>
				<td class="tb1_td4">一件</td>
				<td class="tb1_td5"><input id="min2" name=""
					style="width: 20px; height: 18px; border: 1px solid #ccc;"
					type="button" value="-" /> <input id="text_box2" name=""
					type="text" value="1"
					style="width: 30px; text-align: center; border: 1px solid #ccc;" />
					<input id="add2" name=""
					style="width: 20px; height: 18px; border: 1px solid #ccc;"
					type="button" value="+" /></td>
				<td class="tb1_td6"><label id="total2" class="tot"
					style="color: #ff5500; font-size: 14px; font-weight: bold;"></label></td>
				<td class="tb1_td7"><a href="#">删除</a></td>
			</tr>
		</table> -->

		<!-- <table cellpadding="0" cellspacing="0" class="gwc_tb3">
			<tr>
				<td class="tb1_td1"></td>
				<td class="tb1_td1"></td>
				<td class="tb3_td1"></td>
				<td class="tb3_td2"></td>
				<td class="tb3_td3">合计(不含运费):<span>￥</span><span
					style="color: #ff5500;"><label id="zong1"
						style="color: #ff5500; font-size: 14px; font-weight: bold;"></label></span></td>
				<td class="tb3_td4"><s>结算</s></td>
			</tr>
		</table>
 -->
	</div>
</body>
</html>