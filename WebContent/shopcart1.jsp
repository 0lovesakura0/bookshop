<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>购物车</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.1.4.2-min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style1.css">
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/Calculation.js"></script>
<link rel="stylesheet" type="text/css" href="css/common.css" />
 <style type="text/css">
            .input_tip{
                font-size:16px;
                height:18px;
                padding:4px;
                padding-left:22px;
                transition: all 0.3s ease 0s;
                -webkit-transition: all 0.5s ease-in-out 0s;
            }
            .focus_tip{color:#FF6600;background:url(images/tipv1.png) no-repeat 0 5px;}
            .right_tip{color:#009828;background:url(images/tipv1.png) no-repeat 0 -20px;}
            .error_tip{color:red;background:url(images/tipv1.png) no-repeat 0 -47px;}
            .ajax_checking_tip{color:#009828;}
            dt{margin:5px 0}
        </style>
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
			<table cellpadding="0" cellspacing="0" class="gwc_tb1">
				<tr>
					<td class="tb1_td1"> </td>
					<td class="tb1_td1"> </td>
					<td class="tb1_td3">商品</td>
					<td class="tb1_td4">商品信息</td>
					<td class="tb1_td5">数量</td>
					<td class="tb1_td6">单价</td>
					<td class="tb1_td7">操作</td>
				</tr>
			</table>
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
							url : "SearchShopCart",
							type : "GET",
							data : {},
							success : function(data) {
								data = $.parseJSON(data);
								var a=0;
								totleCount = data.data.length;
								for (var i = 0; i < data.data.length; i++) {
									var html = '	'
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
											+ '		<input id="min'
											+ i
											+ '" name="" onclick="ocMin(\''
											+ i
											+ '\');" style=" width:20px; height:18px;border:1px solid #ccc;" type="button" value="-" />'
											+ '		<input id="text_box'+i+'" name="" type="text" value="'
											+data.data[i].number
											+'" style=" width:30px; text-align:center; border:1px solid #ccc;" />'
											+ '		<input id="add'
											+ i
											+ '" name="" onclick="ocMax(\''
											+ i
											+ '\');" style=" width:20px; height:18px;border:1px solid #ccc;" type="button" value="+" />'
											+ '	</td>'
											+ '	<td class="tb1_td6"><label id="total'+i+'" class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;">'
											+ (parseInt(data.data[i].price))
													.toFixed(2)
											+ '</label></td>'
											+ '	<td class="tb1_td7"> <input type="hidden" value="'+data.data[i].id+'" id="id'+i+'"/><a href="deleteBookShop?id='+data.data[i].id+'">删除</a></td>'
											+ '</tr>' + '</table>';
									$('#div').append(html);
									a+=(parseInt(data.data[i].price)
											* parseInt(data.data[i].number))
									$('#zong1').text(a.toFixed(2));	
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
		$(function() {
			var region = $("#region");
			var address = $("#address");
			var number_this = $("#number_this");
			var name = $("#name_");
			var phone = $("#phone");
			$("#sub_setID").click(function() {
				var input_out = $(".input_style");
				for (var i = 0; i <= input_out.length; i++) {
					if ($(input_out[i]).val() == "") {
						$(input_out[i]).css("border", "1px solid red");
						
						return false;
					} else {
						$(input_out[i]).css("border", "1px solid #cccccc");
					}
				}
			});
			var span_momey = $(".span_momey");
			var b = 0;
			for (var i = 0; i < span_momey.length; i++) {
				b += parseFloat($(span_momey[i]).html());
			}
			var out_momey = $(".out_momey");
			out_momey.html(b);
			$(".shade_content").hide();
			$(".shade").hide();
			$('.nav_mini ul li').hover(function() {
				$(this).find('.two_nav').show(100);
			}, function() {
				$(this).find('.two_nav').hide(100);
			})
			$('.left_nav').hover(function() {
				$(this).find('.nav_mini').show(100);
			}, function() {
				$(this).find('.nav_mini').hide(100);
			})
			$('#jia').click(function() {
				$('input[name=num]').val(parseInt($('input[name=num]').val()) + 1);
			})
			$('#jian').click(function() {
				$('input[name=num]').val(parseInt($('input[name=num]').val()) - 1);
			})
			$('.Caddress .add_mi').click(function() {
				$(this).css('background', 'url("images/mail_1.jpg") no-repeat').siblings('.add_mi').css('background', 'url("images/mail.jpg") no-repeat')
			})
		})
		var x = Array();

		function func(a, b) {
			x[b] = a.html();
			alert(x)
			a.css('border', '2px solid #f00').siblings('.min_mx').css('border', '2px solid #ccc');
		}

		function onclick_close() {
			var shade_content = $(".shade_content");
			var shade = $(".shade");
			if (confirm("确认关闭么！此操作不可恢复")) {
				shade_content.hide();
				shade.hide();
			}
		}

		function onclick_open() {
			$(".shade_content").show();
			$(".shade").show();
			var input_out = $(".input_style");
			for (var i = 0; i <= input_out.length; i++) {
				if ($(input_out[i]).val() != "") {
					$(input_out[i]).val("");
				}
			}
		}

		function onclick_remove(r) {
			if (confirm("确认删除么！此操作不可恢复")) {
				var out_momey = $(".out_momey");
				var input_val = $(r).parent().prev().children().eq(1).val();
				var span_html = $(r).parent().prev().prev().children().html();
				var out_add = parseFloat(input_val).toFixed(2) * parseFloat(span_html).toFixed(2);
				var reduce = parseFloat(out_momey.html()).toFixed(2)- parseFloat(out_add).toFixed(2);
				console.log(parseFloat(reduce).toFixed(2));
				out_momey.text(parseFloat(reduce).toFixed(2))
				$(r).parent().parent().remove();
			}
		}

		function onclick_btnAdd(a) {
			var out_momey = $(".out_momey");
			var input_ = $(a).prev();
			var input_val = $(a).prev().val();
			var input_add = parseInt(input_val) + 1;
			input_.val(input_add);
			var btn_momey = parseFloat($(a).parent().prev().children().html());
			var out_momey_float = parseFloat(out_momey.html()) + btn_momey;
			out_momey.text(out_momey_float.toFixed(2));
		}

		function onclick_reduce(b) {
			var out_momey = $(".out_momey");
			var input_ = $(b).next();
			var input_val = $(b).next().val();
			if (input_val <= 1) {
				alert("商品个数不能小于1！")
			} else {
				var input_add = parseInt(input_val) - 1;
				input_.val(input_add);
				var btn_momey = parseFloat($(b).parent().prev().children().html());
				var out_momey_float = parseFloat(out_momey.html()) - btn_momey;
				out_momey.text(out_momey_float.toFixed(2));
			}
		}
			function setTotal() {
				var totle = 0;
				for (var i = 0; i < totleCount; i++) {
					totle += parseInt($('#total' + i).text())
							* parseInt($('#text_box' + i).val())
				}
				$('#zong1').text(totle.toFixed(2));
			}
			function jiesuan(){
				var data='';
				for (var i = 0; i < totleCount; i++) {
					data+= $('#id' + i).val()+";"
				}
				$.ajax({
					url:'addOrder',
					type:'POST',
					data:{data:data,zong:$('#zong1').text()},
					success:function(data){
						data = $.parseJSON(data);
					//	if (!data.success) {
							alert(data.msg);
					//		return;
					//	}
						location.href="shopcart2.jsp";
					}
					
				})
			}
		</script> 
 
		<table cellpadding="0" cellspacing="0" class="gwc_tb3">
			<tr>
				<td class="tb1_td1"> </td>
				<td class="tb1_td1"> </td>
				<td class="tb3_td1"> </td>
				<td class="tb3_td2"><a	href="shopcart2.jsp"  onclick="jiesuan()">订单管理</a>
				</td>
				<td class="tb3_td3">合计(不含运费):<span>￥</span><span
					style="color: #ff5500;"><label id="zong1"
						style="color: #ff5500; font-size: 14px; font-weight: bold;"></label></span></td>
				<td class="tb3_td4"> <a	href="#jz2" style="display: none;"
					class="jz2" id="jz2" onclick="onclick_open()">结算</a></td>
		 
			</tr>
		</table>

	</div>
	<div class="shade_content">
			<div class="col-xs-12 shade_colse">
				<button onclick="javascript:onclick_close();">x</button>
			</div>
			<div class="nav shade_content_div">
				<div class="col-xs-12 shade_title">
					新增收货地址
				</div>
				<div class="col-xs-12 shade_from">
					<!-- <form action="" method="post"> -->
						<div class="col-xs-12">
							<span class="span_style" id="">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区</span>
							<input class="input_style" type="" name="" id="region" value="" placeholder="&nbsp;&nbsp;请输入您的所在地区" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">详细地址</span>
							<input class="input_style" type="" name="" id="address" value="" placeholder="&nbsp;&nbsp;请输入您的详细地址" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">邮政编号</span>
							<input class="input_style" type="" name="" id="number_this" value="" placeholder="&nbsp;&nbsp;请输入您的邮政编号" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" class="span_sty" id="">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
							<input class="input_style" type="" name="" id="name_" value="" placeholder="&nbsp;&nbsp;请输入您的姓名" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">手机号码</span>
							<input class="input_style" type="" name="" id="phone" value="" placeholder="&nbsp;&nbsp;请输入您的手机号码" />
						</div>
						<div class="col-xs-12">
							<input class="btn_remove" type="button" id="" onclick="javascript:onclick_close();" value="取消" />
							<input type="button" class="sub_set" id="sub_setID" onclick="jiesuan()" value="提交" />
						</div>
					<!-- </form> -->
				</div>
			</div>
		</div>
	
</body>
</html>