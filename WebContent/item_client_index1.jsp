<%@page import="com.vshow.control.data.ClientGroup"%>
<%@page import="com.vshow.control.tool.Constant"%>

<%@page import="java.util.*"%>
<%@page import="com.vshow.control.data.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet"  href="css/index.css"  type="text/css" />
<link rel="stylesheet"  href="css/reset.css"  type="text/css" />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="js/jay.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="zTree/3.5/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="zTree/3.5/jquery.ztree.excheck-3.5.js"></script>
<link rel="stylesheet" href="zTree/3.5/zTreeStyle.css" />

<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<style>
a{text-decoration:none;}
</style>
<script type="text/javascript">

function init_self(){

	var openIntro = <%=request.getParameter("openIntro")%>;

	if(openIntro == '1'){
		var intro = introJs();  
		intro.setOptions({
		prevLabel:"<ww:property value='#session.local.a00861' />", 
        nextLabel:"<ww:property value='#session.local.a00862' />",
        skipLabel:"<ww:property value='#session.local.a00863' />",
        doneLabel:"<ww:property value='#session.local.a00863' />",
		showStepNumbers: false,
		showBullets: false,
		exitOnOverlayClick: false,
		overlayOpacity: 0.4,  
		steps: [  	
			{
				element: '#step1',
				intro: "<span style='color:blue'><ww:property value='#session.local.a00865' /></span> <ww:property value='#session.local.a00909' />",
				position: "left"
			},
			{
				element: "#step2",
				intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00394' /></span><ww:property value='#session.local.a00887' />",
				position: "left"
			}
		  ]  
		});  

		document.getElementById("step2").onclick = function(){
			intro.exit();
			validity_send_1();
			document.getElementById("step2").onclick = function (){
				validity_send();
			};
		};
		intro.start().oncomplete(function() {  
			intro.exit();  
			document.getElementById("step2").onclick = function (){
				validity_send();
			};
	    });
		intro.onexit(function() {
			layer.msg("<ww:property value='#session.local.a00864' />");
		});
	}
}

/*发送节目*/
 function send_item(){
	    //获取所有选用户
		var checkboxuids=document.getElementsByName("curruserid");
		//计数
		var ucount=0;
		//拼接用户id
		var cgids="";
	    for(var i=0;i<checkboxuids.length;i++){
	       if(checkboxuids[i].checked){
	    	   
	    	   if(ucount==0){
	    		   cgids=checkboxuids[i].value;
	    		  
	           }else{
	        	   cgids=cgids+"_"+checkboxuids[i].value; 
	           }
	    	   ucount++;   
	       }
	    }
	 
	    //选择终端
	    var ids=document.getElementsByName('qx'); 
		var clientids="";
		for(var i=0;i<ids.length;i++) 
	    { 
	      if(ids[i].checked==true) 
	      { 
	         if(clientids.length==0){
	        	 clientids=ids[i].value;
	         }else{
	        	 clientids=clientids+"_"+ids[i].value;
	         } 
	      } 
	    } 
	    if(clientids.length==0&&cgids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
	          return ; 
	    }


	    document.getElementById("clientids").value=clientids;
	    document.getElementById("cgids").value=cgids;

	    //获取发布类型
	    var fbtype=document.getElementById("fbtype").value;
	    if(fbtype==1){
	    	//0替换 1追加 defaultFbmode
	    	var fbmode="<ww:property value='#session.defaultFbmode' />";
	    	
	    	if(fbmode==""){
	    		fbmode=0;
		    }
	    	document.form1.action="senditem.vs?fbmode="+fbmode;
		}else if(fbtype==2){
          
			layer.open({
				type: 2,
		        area: ['650px', '500px'],
		        offset: '10px',
		        title:false,
		        fix: false, //不固定
		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        content: "toItemInteractFb.vs?itemIdStr="+$("#itemsids").val()+"&fbtype=2",
		        scrollbar: false,
		        end: function(){ 
				   if(window.returnValue==undefined||window.returnValue==""){
					    window.returnValue=""; 			            
				   }else{

					     //获取初始化数据
						 var sendPlayBasisJson=window.returnValue;
					
						 if(sendPlayBasisJson!=""){
						    	
							    
	                            $("#itemsids").val(sendPlayBasisJson);   
	                            document.form1.action="sendinteractitem.vs";
								document.form1.submit();  

						 }		    
					
					 }	 		         
				 }
		     });


		     
			
		}
      
  } 

 /*有效期发布*/
 function validity_send_1(){
	    //获取所有选用户
		var checkboxuids=document.getElementsByName("curruserid");
		//计数
		var ucount=0;
		//拼接用户id
		var cgids="";
	    for(var i=0;i<checkboxuids.length;i++){
	       if(checkboxuids[i].checked){
	    	   
	    	   if(ucount==0){
	    		   cgids=checkboxuids[i].value;
	    	   }else{
	        	   cgids=cgids+"_"+checkboxuids[i].value; 
	           }
	    	   ucount++;   
	       }
	    }


	    //选择终端
	    var ids=document.getElementsByName('qx'); 
		var clientids="";
		for(var i=0;i<ids.length;i++) 
	    { 
	      if(ids[i].checked==true) 
	      { 
	         if(clientids.length==0){
	        	 clientids=ids[i].value;
	         }else{
	        	 clientids=clientids+"_"+ids[i].value;
	         } 
	      } 
	    } 
	    if(clientids.length==0&&cgids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
	          return ; 
	    }


      document.getElementById("clientids").value=clientids;
	  document.getElementById("cgids").value=cgids;
	  
	  layer.open({
			type: 2,
	        area: ['650px', '350px'],
	        offset: '50px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: "toItemDateFb.vs?itemIdStr="+$("#itemsids").val()+"&openIntro=1",
	        scrollbar: false,
	        end: function(){ 
			   if(window.returnValue==undefined||window.returnValue==""){
				    window.returnValue=""; 			            
			   }else{
				 


				     //获取初始化数据
					 var sendPlayBasisJson=window.returnValue;
					 
					 if(sendPlayBasisJson!=""){
					    	
						    sendPlayBasisJson=sendPlayBasisJson.replace(/&quot;/g,"\"");
				            //转换成touch对象组
						    var sendPlayBasisObject = eval( "(" + sendPlayBasisJson + ")" );//转换后的JSON对象

							if(sendPlayBasisObject.fbtype=="0"){
								//document.form1.action="senditem.vs?fbmode="+rvs[0];
								document.form1.action="senditem.vs?openIntro=1";
						    }else{
						    	//document.form1.action="senddateitem.vs?sdate="+rvs[1]+"&edate="+rvs[2]+"&vfbmode="+rvs[0];
						    	document.form1.action="senddateitem.vs??openIntro=1";
                           }
                           $("#sendPlayBasisJson").val(sendPlayBasisJson);   
						   document.form1.submit();  

					 }

					 
				 }	 		         
			 }
	     });
 } 	 

  /*有效期发布*/
  function validity_send(){
	    //获取所有选用户
		var checkboxuids=document.getElementsByName("curruserid");
		//计数
		var ucount=0;
		//拼接用户id
		var cgids="";
	    for(var i=0;i<checkboxuids.length;i++){
	       if(checkboxuids[i].checked){
	    	   
	    	   if(ucount==0){
	    		   cgids=checkboxuids[i].value;
	    	   }else{
	        	   cgids=cgids+"_"+checkboxuids[i].value; 
	           }
	    	   ucount++;   
	       }
	    }


	    //选择终端
	    var ids=document.getElementsByName('qx'); 
		var clientids="";
		for(var i=0;i<ids.length;i++) 
	    { 
	      if(ids[i].checked==true) 
	      { 
	         if(clientids.length==0){
	        	 clientids=ids[i].value;
	         }else{
	        	 clientids=clientids+"_"+ids[i].value;
	         } 
	      } 
	    }
		
	    if(clientids.length==0&&cgids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
	          return ; 
	    }

        document.getElementById("clientids").value=clientids;
      
	    document.getElementById("cgids").value=cgids;
	  
	    layer.open({
			type: 2,
	        area: ['650px', '500px'],
	        offset: '10px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: "toItemDateFb.vs?itemIdStr="+$("#itemsids").val(),
	        scrollbar: false,
	        end: function(){ 
			   if(window.returnValue==undefined||window.returnValue==""){
				    window.returnValue=""; 			            
			   }else{

				     //获取初始化数据
					 var sendPlayBasisJson=window.returnValue;
					 
					 if(sendPlayBasisJson!=""){
					    	
						    sendPlayBasisJson=sendPlayBasisJson.replace(/&quot;/g,"\"");
				            //转换成touch对象组
						    var sendPlayBasisObject = eval( "(" + sendPlayBasisJson + ")" );//转换后的JSON对象

							if(sendPlayBasisObject.fbtype=="0"){
								//document.form1.action="senditem.vs?fbmode="+rvs[0];
								document.form1.action="senditem.vs";
						    }else{
						    	//document.form1.action="senddateitem.vs?sdate="+rvs[1]+"&edate="+rvs[2]+"&vfbmode="+rvs[0];
						    	document.form1.action="senddateitem.vs";
                            }
                            $("#sendPlayBasisJson").val(sendPlayBasisJson);   
							document.form1.submit();  

					 }		    
				
				 }	 		         
			 }
	     });
  } 


  function send_induction(){
      //item_client_induction_send.jsp

      //toItemInductionFb

	  //获取所有选用户
		var checkboxuids=document.getElementsByName("curruserid");
		//计数
		var ucount=0;
		//拼接用户id
		var cgids="";
	    for(var i=0;i<checkboxuids.length;i++){
	       if(checkboxuids[i].checked){
	    	   
	    	   if(ucount==0){
	    		   cgids=checkboxuids[i].value;
	    	   }else{
	        	   cgids=cgids+"_"+checkboxuids[i].value; 
	           }
	    	   ucount++;   
	       }
	    }


	    //选择终端
	    var ids=document.getElementsByName('qx'); 
		var clientids="";
		for(var i=0;i<ids.length;i++) 
	    { 
	      if(ids[i].checked==true) 
	      { 
	         if(clientids.length==0){
	        	 clientids=ids[i].value;
	         }else{
	        	 clientids=clientids+"_"+ids[i].value;
	         } 
	      } 
	    } 
	    if(clientids.length==0&&cgids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
	          return ; 
	    }


       document.getElementById("clientids").value=clientids;
	   document.getElementById("cgids").value=cgids;


	    //获取发布类型
	    var fbtype=$("#fbtype").val();
	    if(fbtype==1){
	    	document.form1.action="sendInductionItem.vs";  
		}else if(fbtype==2){       
			document.form1.action="sendInductionInteractItem.vs";  
		}
      
		document.form1.submit();  
    
  }


  //精准投放
  function send_accurate(){
	  //获取所有选用户
		var checkboxuids=document.getElementsByName("curruserid");
		//计数
		var ucount=0;
		//拼接用户id
		var cgids="";
	    for(var i=0;i<checkboxuids.length;i++){
	       if(checkboxuids[i].checked){
	    	   
	    	   if(ucount==0){
	    		   cgids=checkboxuids[i].value;
	    	   }else{
	        	   cgids=cgids+"_"+checkboxuids[i].value; 
	           }
	    	   ucount++;   
	       }
	    }


	    //选择终端
	    var ids=document.getElementsByName('qx'); 
		var clientids="";
		for(var i=0;i<ids.length;i++) 
	    { 
	      if(ids[i].checked==true) 
	      { 
	         if(clientids.length==0){
	        	 clientids=ids[i].value;
	         }else{
	        	 clientids=clientids+"_"+ids[i].value;
	         } 
	      } 
	    } 
	    if(clientids.length==0&&cgids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
	          return ; 
	    }


      document.getElementById("clientids").value=clientids;
	  document.getElementById("cgids").value=cgids;
	  
	  layer.open({
			type: 2,
	        area: ['650px', '300px'],
	        offset: '10px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: "toItemAccurateFb.vs?itemIdStr="+$("#itemsids").val(),
	        scrollbar: false,
	        end: function(){ 
			   if(window.returnValue==undefined||window.returnValue==""){
				    window.returnValue=""; 			            
			   }else{
                    //获取初始化数据
					 var protocolPlayAccurateJson=window.returnValue;

					 //获取发布类型
					 var fbtype=$("#fbtype").val();
					 if(fbtype==1){
					    	  
					    document.form1.action="sendAccurateitem.vs";
					    
					 }else if(fbtype==2){
						        
				        document.form1.action="sendAccurateInteractItem.vs";
				          
					 }

                     $("#sendPlayBasisJson").val(protocolPlayAccurateJson);   
					 document.form1.submit();  
						
					
				
				 }	 		         
			 }
	     });

  }



  /*发送节目*/
  function revoked_item(){
 	    //获取所有选用户
 		var checkboxuids=document.getElementsByName("curruserid");
 		//计数
 		var ucount=0;
 		//拼接用户id
 		var cgids="";
 	    for(var i=0;i<checkboxuids.length;i++){
 	       if(checkboxuids[i].checked){
 	    	   
 	    	   if(ucount==0){
 	    		   cgids=checkboxuids[i].value;
 	    		  
 	           }else{
 	        	   cgids=cgids+"_"+checkboxuids[i].value; 
 	           }
 	    	   ucount++;   
 	       }
 	    }
 	 
 	    //选择终端
 	    var ids=document.getElementsByName('qx'); 
 		var clientids="";
 		for(var i=0;i<ids.length;i++) 
 	    { 
 	      if(ids[i].checked==true) 
 	      { 
 	         if(clientids.length==0){
 	        	 clientids=ids[i].value;
 	         }else{
 	        	 clientids=clientids+"_"+ids[i].value;
 	         } 
 	      } 
 	    } 
 	    
 		if(clientids.length==0&&cgids.length==0) 
 	    { 
 	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
 	          return ; 
 	    }

 	    document.getElementById("clientids").value=clientids;
 	    document.getElementById("cgids").value=cgids;

 	    document.form1.action="fbDllItem.vs";
        document.form1.submit(); 
   } 



  /*发送节目*/
  function warning_item(){
 	    //获取所有选用户
 		var checkboxuids=document.getElementsByName("curruserid");
 		//计数
 		var ucount=0;
 		//拼接用户id
 		var cgids="";
 	    for(var i=0;i<checkboxuids.length;i++){
 	       if(checkboxuids[i].checked){
 	    	   
 	    	   if(ucount==0){
 	    		   cgids=checkboxuids[i].value;
 	    		  
 	           }else{
 	        	   cgids=cgids+"_"+checkboxuids[i].value; 
 	           }
 	    	   ucount++;   
 	       }
 	    }
 	 
 	    //选择终端
 	    var ids=document.getElementsByName('qx'); 
 		var clientids="";
 		for(var i=0;i<ids.length;i++) 
 	    { 
 	      if(ids[i].checked==true) 
 	      { 
 	         if(clientids.length==0){
 	        	 clientids=ids[i].value;
 	         }else{
 	        	 clientids=clientids+"_"+ids[i].value;
 	         } 
 	      } 
 	    } 
 	    
 		if(clientids.length==0&&cgids.length==0) 
 	    { 
 	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
 	          return ; 
 	    }

 	    document.getElementById("clientids").value=clientids;
 	    document.getElementById("cgids").value=cgids;

 	    document.form1.action="fbWarningItem.vs";
        document.form1.submit(); 
   } 




   //条件发布
   
     function send_conditional(){
  
       
	  //获取所有选用户
		var checkboxuids=document.getElementsByName("curruserid");
		//计数
		var ucount=0;
		//拼接用户id
		var cgids="";
	    for(var i=0;i<checkboxuids.length;i++){
	       if(checkboxuids[i].checked){
	    	   
	    	   if(ucount==0){
	    		   cgids=checkboxuids[i].value;
	    	   }else{
	        	   cgids=cgids+"_"+checkboxuids[i].value; 
	           }
	    	   ucount++;   
	       }
	    }


	    //选择终端
	    var ids=document.getElementsByName('qx'); 
		var clientids="";
		for(var i=0;i<ids.length;i++) 
	    { 
	      if(ids[i].checked==true) 
	      { 
	         if(clientids.length==0){
	        	 clientids=ids[i].value;
	         }else{
	        	 clientids=clientids+"_"+ids[i].value;
	         } 
	      } 
	    } 
	    if(clientids.length==0&&cgids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
	          return ; 
	    }

        document.getElementById("clientids").value=clientids;

	    document.getElementById("cgids").value=cgids;

        document.form1.action="fbConditionItem.vs";  
      
		document.form1.submit();  
    
  }
     
    
  	 
</script>
</head>
<body onload="init_self()">
 <form  name="form1" method="post" >
<div class="title bottom">
		
		<div class="t_container">
			
			<div class="loc">
			        &nbsp;&nbsp;<ww:property value='#session.local.a00065' /> :
			        <span class="function"><ww:property value='#session.local.a00246' /></span>
			        <span class="material_bg"><ww:property value='#session.local.a00414' /></span>
			</div>
			
		
		</div>
</div>

<div class="c_middle" style="width: 1090px;">
	<div class="c_left">
	  	<div align="left" >
	  		<ul id="leftTree" class="ztree"></ul>
		</div>
		<!-- mask -->
		<em class="mtbox mxt2"></em>
		<em class="mtbox mxb2"></em>
	</div>
	<div class="c_right"  style="height: 550px;">
	 	<div class="c_right_header" >
	 	
	 	     <div class="row">
			     <div class="col-xs-1">
	                    <select  id="sel" name="sel"  class="form-control input-sm" style="width: 90px;" >
			             <!-- 搜索条件 -->
			             <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00031' /></option>
			             <!-- 终端名 -->
			             <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00038' /></option>
						 <!-- 终端IP-->
						 <option  <ww:if test="sel==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.a00039' /></option>
						 <!-- 标识码 -->
						 <option  <ww:if test="sel==3"> selected="selected" </ww:if>   value="3"><ww:property value='#session.local.a00040' /></option>
					    </select>  
				  </div>
				  <div class="col-xs-2" style="margin-left: 25px;">
				     <input  name="ser"  id="ser"  value="<ww:property value='ser' />" class="form-control input-sm" type="text" placeholder="" style="width: 110px;" />
				  </div> 
				  <div class="col-xs-3" style="margin-left: -28px;" >
				     	<button  onclick="select_ser_client('ajaxclientitem.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
				  </div> 
				  
				  <div class="btn-group" style="margin-left:370px;margin-top:-24px;
				     <ww:if test="#session.version_onoff.warning==1">
				       
				     </ww:if>
				     
				   ">
				      
				     <ww:if test="#session.itemsend==1"> 
					      <ww:if test="fbtype==1">
	                          <!-- <button class="btn btn-sm btn-primary" onclick="yxitem()" type="button"><ww:property value='#session.local.a00638' /></button>-->
							  <button id="step2" onclick="validity_send()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00421' /></button>
				          </ww:if>
						  <ww:elseif test="fbtype==2">
						      <ww:if test="#session.itemsendInteractive==1||#session.urid==1">  
						         <button onclick="send_item()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00421' /></button>
						      </ww:if>
						  </ww:elseif>
						  <ww:if test="#session.version_onoff.inductionShow==1">
						 
							   <ww:if test="#session.itemsendInduction==1||#session.urid==1">
							        <button onclick="send_induction()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.b00086' /></button>
					           </ww:if>
				          
				          </ww:if>
				        
					      <ww:if test="#session.version_onoff.accurateSendShow==1">
					             
					           <ww:if test="#session.itemsendPrecise==1||#session.urid==1">  
					               <button onclick="send_accurate()"  type="button"   class="btn btn-sm btn-primary"><ww:property value='#session.local.b00145' /></button>
					           </ww:if>
					      
					      </ww:if>
					      
					     <!-- 条件节目发布 -->
					     <ww:if test="#session.version_onoff.conditionalOnOff==1">
					            <button onclick="send_conditional()"  type="button"   class="btn btn-sm btn-primary"><ww:property value='#session.local.b00370' /></button>
					     </ww:if>
					     
					   </ww:if>
				      <!-- 发布插件节目(控件) -->
				      <ww:if test="#session.dllItemSend==1">
				          <button onclick="revoked_item()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.b00117' /></button>
				       </ww:if>
				       
				         <ww:if test="#session.version_onoff.warning==1">
				       <!-- 发布预警节目 -->
				       <ww:if test="#session.itemsendWarning==1||#session.urid==1">  
				          <button onclick="warning_item()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.b00275' /></button>
				       </ww:if>
				       </ww:if>
				       
				           <select id="orderv" name="orderv"  class="form-control input-sm" style="width: 90px;"   onchange="select_orderby_client('ajaxclientitem.vs')">
				             <!-- 默认排序 -->
				             <option  <ww:if test="orderv=='id'"> selected="selected" </ww:if>   value="id"><ww:property value='#session.local.a00562' /></option>
				             <!-- 连接时间 -->
				             <option  <ww:if test="orderv=='zxstate'"> selected="selected" </ww:if>   value="zxstate"><ww:property value='#session.local.a00043' /></option>
							 <!-- 设备名称-->
							 <option  <ww:if test="orderv=='name'"> selected="selected" </ww:if>   value="name"><ww:property value='#session.local.a00563' /></option>
				          </select>  
				       
			       
			       </div>
			       
			      
			       		  
			 </div>
	         
		
			
		 </div> 
		 <!--显示内容-->
		<div id="showsonlist"> 
		        <div style="height: 400px;"  >
		             
		            <!-- 固定标题 -->
                    <div style="padding-right:17px;margin: 0px;">
                         <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
                            <tr class="cell_element cell_first">
							<td style="width: 10%;" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
							<td style="width: 15%;"><ww:property value='#session.local.a00563' /></td>
							<td style="width: 15%;"><ww:property value='#session.local.d00024' /></td>
							<td style="width: 20%;"><ww:property value='#session.local.a00041' /></td>
							<td style="width: 20%;"><ww:property value='#session.local.a00040' /></td>
							<td style="width: 20%;"><ww:property value='#session.local.a00043' /></td> <!-- 在线状态 -->
							</tr>
						  </table>	
                    </div>
					<div id="step1" style="height: 400px;overflow: auto;overflow-y:scroll;">
						<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
						<ww:iterator value="clients" status="status">
						
							<tr class="cell_element cell_show">
							  <td style="width: 10%;" align="center">
			                      <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
							  </td>
							  <td style="width: 15%;" title="<ww:property value='name' />">
							        <ww:if test="name.length()>26"><ww:property  value="name.substring(0,25)"/>...</ww:if>
			   				        <ww:else><ww:property value='name' /></ww:else> 
							  </td>
							  <td style="width: 15%;">
							     <span>
							     	<ww:iterator value="clientNumber" status="num" id="ber">
							     		
							     		<ww:if test="#status.index==#num.index"> 
							     			<span><ww:property/></span> 
							      			<ww:if test="value.length()>18"><ww:property  value="value.substring(0,17)"/>...</ww:if>
			   				       	    	<ww:else></ww:else> 
			   				       	   </ww:if> 
							     	</ww:iterator>
							     </span>
	
							  </td>
							  <td style="width: 20%;"><ww:property value="ip"/></td>
							  <td style="width: 20%;"><ww:property value="mark"/></td>
							  <td style="width: 20%;">
							  
						     	    <ww:if test="standbystate==2">
									    <span style="color: red;">
									                 (<ww:property value="#session.local.a00522"/>)
									    </span>
						             </ww:if>
						             <ww:else>
						           
								           <ww:if test="zxstate==0"><span  style="color:#FF0000">
								                 <ww:property value="#session.local.a00045" /></span>
										   </ww:if>
										   <ww:else><span style="color:#0033FF"><ww:property value="#session.local.a00044" /></span></ww:else>
										   <ww:if test="disabledstate==1">
											      (<ww:property value="#session.local.a00231"/>) 
										   </ww:if>
										   <ww:if test="standbystate==0">
						                   </ww:if>
						                   <ww:elseif test="standbystate==1">
								                 <span style="color: red;">
								                   (<ww:property value="#session.local.a00488"/>)
								                 </span>
								           </ww:elseif>		
						    
						             </ww:else>
							  
							  </td>
							  <!--
							  <td>
							    <a href="javascript:open_user_up(<ww:property value='id' />)">[<ww:property value='#session.local.a00017' />]</a>
							  </td>
							-->
						 </tr>
						</ww:iterator>
						
						</table>
					</div>
				</div>
				 <!--分页-->
				<div class="nav">
					<ul class="pg">
		                <!-- 上一页-->
						<li><a href="javascript:pageto_client(<ww:property value='qian' />,'ajaxclientitem.vs');" class="pg_f"></a></li>
			            <!--页码显示上-->
						<ww:iterator id="q"  value="ps.qs">
			                  <li><a href="javascript:pageto_client(<ww:property value='#q'/>,'ajaxclientitem.vs');" ><ww:property value="#q"  /></a> </li>
			            </ww:iterator>
			            
			            <!--当前页码-->
			            <li><a href="javascript:pageto_client(<ww:property value='#request.id'  />,'ajaxclientitem.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
			            
			             <!--页码显示下-->
			            <ww:iterator id="h"  value="ps.hs">
			                  <li><a href="javascript:pageto_client(<ww:property value='#h'/>,'ajaxclientitem.vs')"><ww:property value="#h"  /></a></li>
			            </ww:iterator>
			            
		                <!--下一页-->
			            <li><a href="javascript:pageto_client(<ww:property value='hou' />,'ajaxclientitem.vs');" class="pg_e"></a></li>
					</ul>
				    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo_client('ajaxclientitem.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
				    
					<div class="pg_count">
					     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
					     <a href="javascript:setpagetype_client(10,'ajaxclientitem.vs');" <ww:if test='pagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
					     <a href="javascript:setpagetype_client(20,'ajaxclientitem.vs');" <ww:if test='pagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
					     <a href="javascript:setpagetype_client(30,'ajaxclientitem.vs');" <ww:if test='pagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
					     <a href="javascript:setpagetype_client(<ww:property value='total'/>,'ajaxclientitem.vs');" <ww:if test='pagetype==total'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
					</div>
					<!--隐藏域 -->
		            
		            <!--当前页码-->
					<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
		            <!--总页码-->
		            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
		            <!--每页显示页数-->
		            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='pagetype'/>" />
		           
		            <!--分组id-->
		            <input type="hidden" name="cgid"  id="cgid" value="<ww:property value='cgid'/>"/>
		            <!--分组-->
		            <input type="hidden" name="type"  id="type" value="<ww:property value='type'/>"/>
				</div>
       
	   </div>
	</div>
</div>
<input type="hidden" value="<ww:property value='itemsids'/>" name="itemsids" id="itemsids"/>          <!-- 节目ids -->  
<input type="hidden" value="<ww:property value='clientids'/>" name="clientids"  id="clientids" />     <!-- 终端ids -->
<input type="hidden" value="<ww:property value='cgids'/>" name="cgids" id="cgids"/>                   <!-- 终端分组ids -->
<input type="hidden" value="<ww:property value='fbtype'/>" name="fbtype" id="fbtype"/>                <!-- 发布类型 --> 
<input type="hidden" value=""   name="sendPlayBasisJson"  id="sendPlayBasisJson"/>

</form>
<iframe id="id_iframe" name="id_iframe" style="display:none;"></iframe> 

<script>
var groupArray = new Array();
//检查某个分组是否加载下一级数据
function checkLoad(cgid){
  for(var i=0;i<groupArray.length;i++)
     {
           if (cgid == groupArray[i]){
        	   return true;
           }
     }
  return false;
}

var setting = {
		view: {
			showIcon: true
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onExpand: zTreeOnExpand,
			onCheck: zTreeOnCheck
		}
	};

	function zTreeOnCheck(event, treeId, treeNode) {
		$('#zpid').val(treeNode.id+","+treeNode.level);
	}

	function zTreeOnExpand(event, treeId, treeNode) {
		if (checkLoad(treeNode.tId)){
			return;
		}
		$('#'+treeNode.tId+'_ico').removeClass("ico_open");
		$('#'+treeNode.tId+'_ico').addClass("ico_loading");
	    $.ajax({
		 	 url:'ajaxsontreeitem.vs',
			 data:{
	    			cgid : treeNode.id,
					type : treeNode.level
				 },
				 type:'post',  
			     cache:false,  
			     dataType:'json',  
			     success:function(data) {
					groupArray.push(treeNode.tId);
				    var id = "";
				    var areaName = "";
				    var pId = "";
				    var click = "";
				    var isParent = "";
				    var json = eval(data.cgslist);
				    for(var i=0; i<json.length; i++)
				    {
				    	id = json[i].id;
					    areaName = json[i].name;
					    pId = json[i].pid;
					    click = json[i].click;
					    isParent = json[i].isParent;
				    	var newNode = {id:id,name:areaName,pId:pId,click:click,isParent:isParent};
						newNode = zTree.addNodes(treeNode, newNode);
				    }
				    $('#'+treeNode.tId+'_ico').removeClass("ico_loading");
					$('#'+treeNode.tId+'_ico').addClass("ico_open");
				 }
		 });
	};	

	//创建ztree树  
	function  getTree(){
		$.ajax({
		 	 url:'ajaxztreerootitemaction.vs',
			 type:'post',  
		     cache:false,  
		     dataType:'json',  
		     success:function(data) {
			 	var zNodes = eval(data.cgslist);
			 	$.fn.zTree.init($("#leftTree"), setting, zNodes);
				zTree = $.fn.zTree.getZTreeObj("leftTree");
			 }
		});			
	} 
    
	function showIconForTree(treeId, treeNode) {
		return !treeNode.isParent;
	};

	var zTree;
	var ztreeNode;
	$(document).ready(function(){
		getTree();		
	});

</script>
</body>
</html>
