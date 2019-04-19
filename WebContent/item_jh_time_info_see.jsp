<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base target="_self" />
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

<link rel="stylesheet" href="css/edit/jquery-ui.min.css" />
 
<script src="js/edit/jquery-ui.min.js"></script>
  
  
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<link href="zui-1.5.0-dist/dist/lib/datatable/zui.datatable.min.css" rel="stylesheet" />
<script src="zui-1.5.0-dist/dist/lib/datatable/zui.datatable.min.js"></script>




<script>
//返回计划
function go_itemjh(jhtype){
	document.form1.action="jhlist.vs?jhtype="+jhtype+"&jhid="+$("#jhid").val();
	document.form1.target = "_self";
    document.form1.submit();
}

$(function() {
    $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
    /* 初始化数据表格 */
    $('table.datatable').datatable({sortable: true});
    
});

//返回
function return_jh(returnURl){

	window.location.href=returnURl;
    
}

</script>
<style>
body,html{
margin:0px;
padding:0px;
border:0px;
}
/*background-color:#134AFF;*/
/*overflow:hidden*/

 .ui-tabs-vertical { width: 55em; }
  .ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 12em; }
  .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
  .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
  .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; border-right-width: 1px; }
  .ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 65em;}
  
</style>
</head>

<body>
<script type="text/javascript"> 
document.body.onselectstart=document.body.oncontextmenu=function(){ return false;} 
</script> 
<form  name="form1" method="post" >
	<input type="hidden" value="<ww:property  value='jhid'/>" name="jhid" id="jhid"/>


	<div style="width: 1100px;margin: 0px auto;position: relative;">
	   
	    <div class="c_right_header" >
		
			<div class="row">
		         <div class="btn-group" style="float: right;margin-right: 30px;">
		              <ww:if test="posType==0">
		                 <button onclick="return_jh('jhlist.vs?jhtype=1')"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00014' /></button><!-- 返回 -->
		              </ww:if>
		              <ww:elseif  test="posType==1">
		                 <button onclick="return_jh('tonoocheckjh.vs?type=1')"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00014' /></button><!-- 返回 -->
		              </ww:elseif>
		         </div>
		    </div>
		</div>
	</div>

	<!--显示内容-->
<!--	<div id="calendar" style="height: 500px;width: 1050px;margin: 0px auto;overflow-y:auto;" ></div>-->


    <div id="tabs"  style="height: 500px;width: 1050px;margin: 0px auto;overflow-y:auto;">
		  <ul>
		    <li><a href="#tabs-8" style="width: 100%;"> <ww:property value="#session.local.a00483"/>  </a></li><!-- 每天 -->
		    <li><a href="#tabs-1" style="width: 100%;"> <ww:property value="#session.local.a00475"/>  </a></li><!-- 周一 -->
		    <li><a href="#tabs-2" style="width: 100%;"> <ww:property value="#session.local.a00476"/> </a></li><!-- 周二 -->
		    <li><a href="#tabs-3" style="width: 100%;"> <ww:property value="#session.local.a00478"/> </a></li><!-- 周三 -->
		    <li><a href="#tabs-4" style="width: 100%;"> <ww:property value="#session.local.a00479"/> </a></li><!-- 周四 -->
		    <li><a href="#tabs-5" style="width: 100%;"> <ww:property value="#session.local.a00480"/> </a></li><!-- 周五 -->
		    <li><a href="#tabs-6" style="width: 100%;"> <ww:property value="#session.local.a00481"/> </a></li><!-- 周六 -->
		    <li><a href="#tabs-7" style="width: 100%;"> <ww:property value="#session.local.a00482"/></a></li><!-- 周日 -->
		  </ul>
		
		  
		  
		  <ww:iterator value="weekList"     status="week">
		      <div id="tabs-<ww:property />"  style="overflow: auto;height: 400px;" >
			      <table class="table datatable"   >
					  <thead>
					    <tr>
					       <th> <ww:property value="#session.local.a00255"/> </th>  <!--节目名  -->
					       <th> <ww:property value="#session.local.a00540"/> </th>  <!-- 开始时间 -->
					       <th> <ww:property value="#session.local.a00541"/> </th>  <!-- 结束时间 --> 
					       <th style="display: none;" > <ww:property value="#session.local.a00016"/> </th>  <!-- 操作 -->
					    </tr>
					  </thead>
					  <tbody>
					    <ww:iterator  value="jhitems"  >
					        <ww:if test="day==weekList[#week.index]"  >
						      <tr>
							      <td>
							          <span onclick="selJhPlayInfo('<ww:property value='itemids'/>')" style="cursor: pointer;" ><ww:property  value="itemnames"/></span>
							      </td>
							      <td>
							           <ww:property  value="sdate"/>
							      </td>
							      <td>
							           <ww:property  value="edate"/>
							      </td>
							      <td style="display: none;">
							          <!--  修改 --> 
								  	  
		                             <span title="<ww:property value='#session.local.a00017' />" onclick="editjhitem(<ww:property value='id'/>)" style="cursor: pointer;margin-right: 5px;">
		                                  <i class="icon icon-edit"></i>
		                             </span> 
		                             
		                             |
		                             <span title="<ww:property value='#session.local.a00025' />" onclick="delSubmit(<ww:property value='id'/>)" style="cursor: pointer;margin-right: 5px;">
		                                   <i class="icon icon-remove-sign"></i>
		                             </span>
		                             
		                               
							      </td>
						      </tr>
					         </ww:if>
					    </ww:iterator>
					   
					 
					  </tbody>
					  
				   </table>
			   </div>
		    </ww:iterator>
		   
		   
		   
     </div>


</form>
    
<script>


function addjhitem(){
    var jhid=document.getElementById("jhid").value;
	layer.open({
		type: 2,
        area: ['920px', '500px'],
        offset: '20px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: 'toadjhitem1.vs?igr.itemgroupid=0&jhid='+jhid+"&jhtype=1",
        scrollbar: false,
        end: function(){ 
    	    window.location.target = "_self";
	    	window.location.href="jhtimeiteminfo.vs?jhid="+jhid;
		}
	});
}

function editjhitem(jhitemid){
	var jhid=document.getElementById("jhid").value;
	layer.open({
		type: 2,
        area: ['920px', '500px'],
        offset: '20px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: 'toeditjhitem.vs?igr.itemgroupid=0&jhid='+jhid+"&jhtype=1&jhitemid="+jhitemid,
        scrollbar: false,
        end: function(){ 
    	    window.location.target = "_self";
	    	window.location.href="jhtimeiteminfo.vs?jhid="+jhid;
		}
	});
}


//查看播放信息
function selJhPlayInfo(itemidsStr){

	  var itemids = itemidsStr;
      var itemIdsAndType = itemidsStr+"_1";
      var jhitemid = itemidsStr;
	  layer.open({
			type: 2,
	        area: ['620px', '400px'],
	        offset: '20px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'tojhplayitem.vs?itemIdsAndType='+itemIdsAndType+'&jhitemid='+jhitemid,
	        scrollbar: false,
	        end: function(){ 
	    	          
			}
		});

		
}


function delSubmit(jhitemid){
	
	layer.confirm("<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />"}, function(index,layero){
    	$.ajax({
			type:'post',
			url:'deljhitem.vs',
			data:"jhitemid="+jhitemid,
			dataType:'json',
			async:true,
			cache:true,
			success:function(data){
				if(data == "0"){
					layer.msg("<ww:property value='#session.local.a00512' />");
					//var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
					//window.parent.returnValue=""; 
			        //window.parent.layer.close(index);
					 window.location.target = "_self";
				     window.location.href="jhtimeiteminfo.vs?jhid="+$("#jhid").val();
				}else{
					layer.msg("<ww:property value='#session.local.a00511' />");
				}
            }
  		});
	});
}


</script>
</body>
</html>