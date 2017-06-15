
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>详情</title>
<meta name="keywords" content="详情" />
<meta name="description" content="详情" />
 <link rel="stylesheet" type="text/css" href="css/normalize.css"/>
 <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
 <script src="js/common.js" type="text/javascript" charset="utf-8"></script>
   <script type="text/javascript">
  $(document).ready(function(){
	  var showproduct = {
		  "boxid":"showbox",
		  "sumid":"showsum",
		  "boxw":400,//宽度,该版本中请把宽高填写成一样
		  "boxh":400,//高度,该版本中请把宽高填写成一样
		  "sumw":60,//列表每个宽度,该版本中请把宽高填写成一样
		  "sumh":60,//列表每个高度,该版本中请把宽高填写成一样
		  "sumi":7,//列表间隔
		  "sums":5,//列表显示个数
		  "sumsel":"sel",
		  "sumborder":1,//列表边框，没有边框填写0，边框在css中修改
		  "lastid":"showlast",
		  "nextid":"shownext"
		  };//参数定义	  
	 $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
  });
  
  function addcar(){
	  
		$.ajax({
			url : 'AddShopCar',
			type : "POST",
			data :{bookId:${rs.id}},
			success:function(data){
				data = $.parseJSON(data);
				if (!data.success) {
					alert(data.msg);
				}else{
					alert('加入购入车成功！')
				}
			}
		});
	}
</script>
</head>
<body>
 <div class="showall">
	                <!--left -->
	                <div class="showbot">
                    <div id="showbox">
                        <img src="img/book/${rs.id }.jpg" width="400" height="400" />
                       <!--  <img src="images/photos/img02.png" width="400" height="400" />
                        <img src="images/photos/img03.png" width="400" height="400" />
                        <img src="images/photos/img04.png" width="400" height="400" />
                        <img src="images/photos/img05.png" width="400" height="400" />
                        <img src="images/photos/img06.png" width="400" height="400" />
                         -->
                    </div><!--展示图片盒子-->
                        <div id="showsum">
                        	<!--展示图片里边-->
                        </div>
                        <p class="showpage">
                            <a href="javascript:void(0);" id="showlast"> < </a>
                            <a href="javascript:void(0);" id="shownext"> > </a>
                        </p>
                        </div>
                        <!--conet -->
                        <div class="tb-property">
                        	<div class="tr-nobdr">
                        		<h3> ${rs.name }</h3>
                        	</div>
                        		<div class="txt">
                        			<span class="nowprice">￥<a href="#">${rs.price }</a></span>
                        			<div class="cumulative">
                        				<span class="number ty1">累计售出<br /><em id="add_sell_num_363">370</em></span>
                        				<span class="number tyu">累计评价<br /><em id="add_sell_num_363">25</em></span>
                        			</div>
                        		</div>
                        	<div class="txt-h">
                        		<span class="tex-o">分类</span>
                        		<ul class="glist" id="glist" data-monitor="goodsdetails_fenlei_click">
                        			<li><a title="红色36g" href="">红色36g</a></li>
                        			<li><a title="蓝色16g" href="">红色36g</a></li>
                        		<!--<li><a title="红色36g" href="">红色36g</a></li>
                        			<li><a title="蓝色16g" href="">红色36g</a></li>-->
                        		</ul>
                        	</div>
                        	<script>
                        	
                        	$(document).ready(function(){ 
                          	var t = $("#text_box"); 
                        	$('#min').attr('disabled',true); 
                            	$("#add").click(function(){    
                               	 t.val(parseInt(t.val())+1)
                               	 if (parseInt(t.val())!=1){
                                   	 $('#min').attr('disabled',false);
                                	}
      
                           	 })  
                            	$("#min").click(function(){
                                	t.val(parseInt(t.val())-1);
                                	if (parseInt(t.val())==1){
                                   	 $('#min').attr('disabled',true);
                                	}
      
                            	})  
                        	});
                        	</script>  
                        	<div class="gcIpt">
                        		<span class="guT">数量</span>
                        		<input id="min" name="" type="button" value="-" />  
                        		<input id="text_box" name="" type="text" value="1"style="width:30px; text-align: center; color: #0F0F0F;"/>  
                        		<input id="add" name="" type="button" value="+" />
                        		<span class="Hgt">库存（99）</span>
                        	</div>
                        	<div class="nobdr-btns">
                        		<button class="addcart hu" onclick="addcar()"><img src="images/shop.png" width="25" height="25"/>加入购物车</button>
                        		<button class="addcart yh"><img src="images/ht.png" width="25" height="25"/>立即购买</button>
                        	</div>
                        	<div class="guarantee">
                        		<span>邮费：包邮&nbsp;&nbsp;支持货到付款 <a href=""><img src="images/me.png"/></a></span>
                        	</div>
                        </div>
                        <!--right -->
                        <div class="extInfo">
            	            <div class="brand-logo">
            	             	<a href="" title="奥影汽车影音">
            	             		<img src="images/ho_03.png"/>
            	             	</a>
            	            </div>
            	            <div class="seller-pop-box">
            	            	<span class="tr">商家名称：奥影汽车影音奥影汽车影音奥影汽车影音</span>
            	            	<span class="tr">商家等级：初级店铺</span>
            	            	<span class="tr">客家电话：15012365897</span>
            	            	<span class="tr hoh">
            	            		<a title="河南郑州市航海路57号河南郑州市航海路57号" href="">所在地区：河南郑州市航海路57号河南郑州市航海路57号</a>
            	            	</span>
            	            </div>
            	            <div class="seller-phone">
            	            	<span class="pop im">
            	            		<a href="" data-name="联系卖家"><img src="images/phon.png"/>联系卖家</a>
            	            	</span>
            	            	<span class="pop in">
            	            		<a href="" data-name="咨询卖家"><img src="images/qq.png"/>咨询卖家</a>
            	            	</span>
            	            	<span class="pop in">
            	            		<a href="" data-name="进店逛逛"><img src="images/shop-line.png"/>进店逛逛</a>
            	            	</span>
            	            	<span class="pop in">
            	            		<a href="" data-name="关注店铺"><img src="images/staar.png"/>关注店铺</a>
            	            	</span>
            	            </div>
            	            <div class="jd-service">
            	            	<a href="">
            	            		<img src="images/ho_07.png"/>
            	            	</a>
            	            </div>
            	            <div class="suport-icons">
            	            	<h4>扫一扫<br />手机下单更优惠</h4>
            	            	<img src="images/ho_11.jpg"/>
            	            </div>
                        </div>
                    </div>                
     
<!-- 商品介紹 -->                
                <div class="gdetail">
                	<!-- left -->
                	<div class="aside">
                		  <h3>看了还看<span><img src="images/fod.png"width="22" height="22"/>换一批</span></h3>
                		  <dl class="ac-mod-list">
                		  	<dt><a href=""><img src="images/hdy_09.png"/></a></dt>
                		  	<dd>
                		  		  O2+车载空气净化器DM2
                		  		  <span>￥99</span>
                		  	</dd>
                		  </dl>
                		  <dl class="ac-mod-list">
                		  	<dt><a href=""><img src="images/hdy_07.png"/></a></dt>
                		  	<dd>
                		  		  O2+车载空气净化器DM2
                		  		  <span>￥99</span>
                		  	</dd>
                		  </dl>
                		  <dl class="ac-mod-list">
                		  	<dt><a href=""><img src="images/hdy_11.jpg"/></a></dt>
                		  	<dd>
                		  		  O2+车载空气净化器DM2
                		  		  <span>￥99</span>
                		  	</dd>
                		  </dl>
                	</div>
                	<!-- right -->
                	<script> 
</script>
                	<div class="detail">
                		<div class="active_tab" id="outer">
													<ul class="act_title_left" id="tab">
														<li class="act_active">
															<a href="#">规格参数</a>
														</li>
														 
													</ul>
													<ul class="act_title_right">
														<li class="mui">  
															<a id="mui-a" href="#">扫手机下单+</a>
														</li>
														<li class="mui-ac">
															<a href="#">加入购物车</a>
														</li>
													</ul>
													<div class="clear"></div>
												</div>
												<div id="content" class="active_list"> 
													<!--0-->
													<div id="ui-a" class="ui-a">
												        <ul style="display:block;">
												        <li>商品名称：${rs.name }</li>
												        <li>商品编号：${rs.number }</li>
												        <li>库存： 999 </li>
												        <li>详情： ${rs.content } </li>
												        <li><img src="img/book/${rs.id }.jpg"/></li> 
												        </ul>
												   </div>
												   <!--商品规格-->
												    	<div id="bit" class="bit">
												        <ul style="display:none;">
												            <li><img src="images/ko-1.jpg"/></li>
												            <li><img src="images/ko-2.jpg"/></li>
												            <li><img src="images/ko.jpg"/></li>
												            <li><img src="images/ko-1.jpg"/></li>
												            <li><img src="images/ko-2.jpg"/></li>
												                
												       </ul>
												       </div>
												       
												 <!--商品评价-->      
												   
												    <div id="ui-c" class="ui-c">
												         <ul style="display:none;">
												         	
												         </ul>
												    </div>
												 <!--售后保障-->
												 <div id="uic" class="uic">
												         <ul style="display:none;">
												         	<p>商品名称：仙人指路道镜前后双录智能后视镜导航仪行车记录仪后视预警一体机</p>
												         	<p>商品编号：ECS001983</p>
												         	<p>品牌:威力马哈国产</p>
												         	<p>上架时间：2016-05-24</p>
												         	<span><img src="images/ko-1.jpg"/></span>
												            <span><img src="images/ko-2.jpg"/></span>
												         </ul>
												    </div>
												</div>
												<script>
													$(function(){
														window.onload = function()
														{
															var $li = $('#tab li');
															var $ul = $('#content ul');
																		
															$li.mouseover(function(){
																var $this = $(this);
																var $t = $this.index();
																$li.removeClass();
																$this.addClass('act_active');
																$ul.css('display','none');
																$ul.eq($t).css('display','block');
															})
														}
													});  
												</script>
                	</div>
                </div>
                
</body>
</html>
