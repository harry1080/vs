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

</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			    	&nbsp;&nbsp;<ww:property value='#session.local.a00065' /> :
			       <span class="function"><ww:property value='#session.local.a00113' /></span>
			       <span class="function"><ww:property value='#session.local.b00115' /></span>
			       <span class="material_bg"><ww:property value='#session.local.a00752' /></span>
			</div>
			
		</div>
</div>

<div class="c_middle download_manager">
    

	
	<div>
	    <div class="c_right_header" style="height: 48px;margin-left: 30px;" >
		    
			 <div class="row">
			     <div class="col-xs-1">
				   
		            
		            
		             
				  </div>
				  <div class="col-xs-2" style="margin-left:2px;">
				    
				  </div> 
				  <div class="col-xs-3" style="margin-left: -70px;" >
				   
				  </div> 
				
			       
				 <div   style="float: right;margin-right: 50px;">
				 	<script type="text/javascript">
				 		
						 	$(function(){
				 				　　$('#peopleClick').click(function(){
				 				
				 						//关闭自身
				 						window.parent.close();
				 					
				 						//刷新父页面
				 						window.parent.location.reload();
				 				　　});
				 			}); 
				 	</script>
			         <button id="peopleClick" style="width:60px;height:30px;margin: 5px 50px;" class="btn btn-sm btn-primary" >
                                  <ww:property  value="#session.local.a00014"/>
                      </button>
			      </div>
			     
				 		  
			 </div>
			 
		    
		</div>
        <!--显示内容-->
        <div style="height: 400px;width: 1080px;margin-top: -10px;" >
             <!-- 固定标题 -->
             <div style="padding-right:17px;margin-left: 30px;">
                <table style="text-align: center;margin: 0px;" border="0" cellpadding="0" cellspacing="0">
					<tr class="cell_element cell_first">
				        <td style="width:40%" ><ww:property value='#session.local.b00141' /></td><!--年龄 -->
						<td style="width:20%" ><ww:property value='#session.local.b00142' /></td><!--性别 -->
					    <td style="width:30%" ><ww:property value='#session.local.d00015' /></td><!--mac地址 -->				
					</tr>
				 </table>	
             </div>
             <div style="height: 400px;overflow: auto;margin-top:-5px;margin-left: 30px;">
				<table style="text-align: center;margin: 0px;" border="0" cellpadding="0" cellspacing="0">
					<ww:iterator value="countPeopleDetailsList" >
						<tr class="cell_element cell_show">
						  <td style="width:40%" >
						     <ww:property value="age"/>
						  </td>
						  <td style="width:20%" >
						      <ww:if test="sex==1">
						         <ww:property value="#session.local.b00143" />
  						      </ww:if>
						      <ww:elseif test="sex==2">
						         <ww:property value="#session.local.b00144" />
						      </ww:elseif>
						      <ww:elseif test="sex==3">
						         <ww:property value="#session.local.d00016" />
						      </ww:elseif>
						  </td>
						  <td style="width:30%" >
						     <ww:property value="mac"/>
						  </td>
						</tr>
					</ww:iterator>
				</table>
			</div>
		</div>
  
	</div>
</div>
</form>
</body>
</html>
