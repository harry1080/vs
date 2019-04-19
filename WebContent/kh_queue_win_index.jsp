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
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript">
  

 
</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
		         <ww:property value='#session.local.a00065' /> :
		         <span class="function"><ww:property value='#session.local.a00665' /></span>
		         <span class="material_bg"><ww:property value='#session.local.a00711' /></span>
			</div>
			<div class="material_show">
				<ul>
				   <li><a href="toqueuebig.vs" ><ww:property value='#session.local.a00710' /></a></li>
				   <li><a href="toqueuewin.vs" style="background-color:#007CCD;" ><ww:property value='#session.local.a00711' /></a></li>
				</ul>
			</div>
		</div>
</div>

<div class="c_middle download_manager">
    

	   
	<div>
	    <div class="c_right_header" >
		
	
			<div class="row">
			      <div class="btn-group" style="float: right;margin-right: 30px;">
				       <button onclick="onhref('toququebindwin.vs')"   type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00706' /></button><!-- 新增 -->
				       <button onclick="del_sel('delwin.vs')"        type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button>
				   </div>	
			 </div>
			
			
			
		</div>
        <!--显示内容-->
        <div style="height: 400px;width: 1050px;" >
			 <!-- 固定标题 -->
             <div style="padding-right:17px;margin: 0px;">
                 	<table border="0" cellpadding="0" cellspacing="0" style="margin: 0px;">
						<tr class="cell_element cell_first">
					    <td style="width:10%" >
					        &nbsp;&nbsp;&nbsp;<input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/>
                            <!-- <ww:property value='#session.local.a00034' />-->
					    </td>
						<td style="width:40%" ><ww:property value='#session.local.a00133' /></td><!-- 名称 -->
						<td style="width:15%" ><ww:property value='#session.local.a00708' /></td><!-- 区号 -->
						<td style="width:15%" ><ww:property value='#session.local.a00709' /></td><!-- 窗口号 -->
						<td style="width:20%" ><ww:property value='#session.local.a00038' /></td><!-- 终端名 -->
						
						</tr>
					</table>	
             </div>
			 <div style="height: 400px;overflow: auto;overflow-y:scroll;">
				 <table border="0" cellpadding="0" cellspacing="0" style="margin: 0px;" >
				       <ww:iterator value="bws">
							<tr class="cell_element cell_show">
							  <td style="width:10%">
							    &nbsp;&nbsp; <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
<!--							     <ww:property value="id" />-->
							  </td>
							  <td style="width:40%">
							     <ww:property value="name"  /> 
							  </td>
							  <td style="width:15%" ><ww:property value="point"  /></td>
							  <td style="width:15%" ><ww:property value="win"  /></td>
							  <td style="width:20%">
							     <ww:property value="cname"  />
							  </td>
							 
							</tr>
						</ww:iterator>		
				  </table>
			  </div>
		</div>
        <!--分页-->
		<div class="nav">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'toqueuewin.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'toqueuewin.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'toqueuewin.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'toqueuewin.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'toqueuewin.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('toqueuewin.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'toqueuewin.vs');" <ww:if test='pagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'toqueuewin.vs');" <ww:if test='pagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'toqueuewin.vs');" <ww:if test='pagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(<ww:property value='total'/>,'toqueuewin.vs');" <ww:if test='pagetype==total'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='pagetype'/>" />
        
		</div>
	</div>
</div>
</form>
</body>
</html>
