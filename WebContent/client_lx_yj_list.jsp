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
			       <ww:property value='#session.local.a00405' /> :
<!--			        <span class="function"><ww:property value='#session.local.a00404' /></span>-->
			       <span class="material_bg"><ww:property value='#session.local.a00401' /></span>
			</div>
			
		</div>
</div>

<div class="c_middle download_manager">
    
	<div>
	     <div class="c_right_header" style="height: 48px;margin-left: 20px;" >
		    
			
			 <div class="col-xs-1">
		        
		         <select id="sel" name="sel" class="form-control input-sm" style="width: 90px;">
		             <!-- 搜搜条件 -->
		             <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00031' /></option>
		             <!-- 终端名 -->
		             <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00038' /></option>
					 <!-- 终端IP-->
<!--					 <option  <ww:if test="sel==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.a00039' /></option>-->
					 <!-- 标识码 -->
					 <option  <ww:if test="sel==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.a00040' /></option>
				 </select>  
			 </div>

             <div class="col-xs-2" style="margin-left:2px;">
				     <input  name="ser"  class="form-control input-sm" type="text"  value="<ww:property value='ser' />"  placeholder="" style="width: 110px;" /> 
		     </div> 
			 <div class="col-xs-3" style="margin-left: -70px;" >
				     <button  onclick="sel_ser_client_index('clientLxYjList.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
		     </div> 
			
	
		    
		</div>
          <!--显示内容-->
        <div style="height: 400px;width: 1080px;margin-top: -10px;" >
             <!-- 固定标题 -->
             <div style="padding-right:17px;margin-left: 30px;">
                <table style="text-align: center;margin: 0px;" border="0" cellpadding="0" cellspacing="0">
					<tr class="cell_element cell_first">
				        <td style="width:20%" ><ww:property value='#session.local.a00038' /></td><!-- 终端名 -->
						<td style="width:20%" ><ww:property value='#session.local.a00040' /></td><!-- 标识码  -->
						
						<td style="width:20%" ><ww:property value='#session.local.a00042' /></td> <!-- 连接时间 -->  
						<td width="20%"><ww:property value='#session.local.b00328' /></td><!-- 离线天数 -->
						
					</tr>
				 </table>	
             </div>
              <div style="height: 400px;overflow: auto;margin-top:-5px;margin-left: 30px;">
				<table style="text-align: center;margin: 0px;" border="0" cellpadding="0" cellspacing="0">
					<ww:iterator value="clients" >
						<tr class="cell_element cell_show">
						  <td style="width:20%" >
						     <span style="cursor: pointer;" onclick="open_client_info(<ww:property value='id' />)" id="sname<ww:property value='id' />" onmouseover="show_tips('sname<ww:property value='id' />','<ww:property value='name' />')"> <ww:property value='name' /></span>
						  </td>
						  <td style="width:20%" >
						     <ww:property value="mark" />
						  </td>
						  
						  <td style="width:20%">
						     <ww:property value="last" />
						  </td>
						  <td width="20%">
						    <ww:property value="lxDay" />
						  </td>
						 
						  
						</tr>
					</ww:iterator>
				</table>
			</div>
		</div>
        <!--分页-->
		<div class="nav" style="width: 1000px;margin-left:10px;">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'clientLxYjList.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'clientLxYjList.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'clientLxYjList.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'clientLxYjList.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'clientLxYjList.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('tohzclient.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'clientLxYjList.vs');" <ww:if test='pagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
			     <a href="javascript:setpagetype(20,'clientLxYjList.vs');" <ww:if test='pagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'clientLxYjList.vs');" <ww:if test='pagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(<ww:property value='total'/>,'clientLxYjList.vs');" <ww:if test='pagetype==total'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
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
