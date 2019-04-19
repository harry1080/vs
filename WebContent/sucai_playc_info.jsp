<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="css/index.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript" src="js/My97DatePicker/<ww:property value='#session.local.a00000' />_WdatePicker.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<style>
body,html{
margin:0px;
padding:0px;
border:0px;
}
</style>

</head>
<body>
<form  name="form1" method="post" >
<div class="title bottom">
	<div class="t_container">
		<div class="loc">
	       <ww:property value='#session.local.a00065' /> :
	       <span class="function"><ww:property value='#session.local.a00113' /></span>
	       <span class="function"><ww:property value='#session.local.a00852' /></span>
	       <span class="material_bg"><ww:property value='#session.local.a00752' /></span>
		</div>
	</div>
</div>
<div class="c_middle download_manager">
    <!--菜单-->
	<div>
        <!--显示内容-->
        <div style="height: 400px;text-align:center;">
          <!-- 固定标题 -->
          <div style="padding-right:17px;">
	            <table border="0" cellspacing="0" cellpadding="0">
	              <tr class="cell_element cell_first">
					<td style="width:20%"><ww:property value='#session.local.a00038' /></td>
					<td style="width:20%"><ww:property value='#session.local.a00255' /></td>
					<td style="width:25%"><ww:property value='#session.local.a00067' /></td>
					<td style="width:20%"><ww:property value='#session.local.a00585' /></td>
					<td style="width:15%"><ww:property value='#session.local.b00085' /></td>
				  </tr>
	            </table>
            </div>
            <div style="height: 400px;overflow: auto;overflow-y:scroll;margin-top:-20px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<ww:iterator value="spcList">
					
						<tr class="cell_element cell_show">
						  <td style="width:20%">
							  <ww:if test="mark.length()>15"><ww:property  value="mark.substring(0,15)"/>...</ww:if>
			   				  <ww:else><ww:property value='mark' /></ww:else>
						  </td>
						  <td style="width:20%">
							  <ww:if test="name.length()>15"><ww:property  value="name.substring(0,15)"/>...</ww:if>
			   				  <ww:else><ww:property value='name' /></ww:else>
						  </td>
						  <td style="width:25%">
							  <ww:if test="sname.length()>15"><ww:property  value="sname.substring(0,15)"/>...</ww:if>
			   				  <ww:else><ww:property value='sname' /></ww:else>
						  </td>
						  <td style="width:20%"><ww:property value='scount' /></td>
					  	  <td style="width:15%"><ww:property value='sdate.substring(0,10)' /></td>
						</tr>
					
					</ww:iterator>
				</table>
			</div>
		</div>
		
        <!--分页-->
		<div class="nav" style="width:96%;">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'seeplaycinfo.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'seeplaycinfo.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'seeplaycinfo.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'seeplaycinfo.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'seeplaycinfo.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('seeplaycinfo.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'seeplaycinfo.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'seeplaycinfo.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'seeplaycinfo.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'seeplaycinfo.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
            <input type="hidden" name="mark" id="mark" value="<ww:property value='mark'/>" /> 
            <input type="hidden" name="name" id="name" value="<ww:property value='name'/>" /> 
            <input type="hidden" name="sname" id="sname" value="<ww:property value='sname'/>" /> 
            <input type="hidden" name="btime" id="btime" value="<ww:property value='btime'/>" /> 
            <input type="hidden" name="etime" id="etime" value="<ww:property value='etime'/>" /> 
            <input type="hidden" name="stype" id="stype" value="<ww:property value='stype'/>" /> 
		</div>
	</div>
</div>
</form>
</body>
</html>