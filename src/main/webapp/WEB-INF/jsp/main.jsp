<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/image/small_image/zebre.png" type="image/x-icon" />
<title>sunshine 商城</title>
<style type="text/css"  >
			
		#west_area div{
		   cursor: pointer;
		   
		}	
		#west_area div:hover{
		   cursor: pointer;
		   color: #f00;
		}	
		#west_area div:active{
		   cursor: pointer;
		   color: #0f0;
		}	
</style>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">north region</div>
	<div data-options="region:'west',split:true,title:'West'" style="width:150px;padding:10px;">
					<ul  class="easyui-tree" id="west_area">
						<li>
							<div url="${pageContext.request.contextPath}/spu/main.do" onclick="toggal_tabs(this)">管理spu商品信息</div>
						</li>
						<li>
							   <div url="${pageContext.request.contextPath}/attr/attr_main.do" onclick="toggal_tabs(this)">商品属性信息管理</div>
						</li>
						<li>
							  <div url="${pageContext.request.contextPath}/sku/sku_main.do" onclick="toggal_tabs(this)">SKU信息管理</div>
						</li>
					</ul>
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding: 10px">south region</div>
	<div  data-options="region:'center',title:'Center'" style="overflow: auto">
	  <div id="mall_manager_index_center" class="easyui-tabs"  style="width:700px;height:250px;overflow: auto"  data-options="fit:true">
	  
	  </div>
	       
	        
	</div>
<hr/>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">


  /*  function open_on_tabs(ele){
	   var content;
	  
	   return content;
   } */
   
   var targetpath="${path}";
   if(targetpath != "0"){
	   url="${pageContext.request.contextPath}/"+targetpath;
	   review_path(url,"${title}");
   }
   

   $.getJSON("${pageContext.request.contextPath}/main_getwest.do",function(data){
	  var main_west_context="";
	   $.each(data,function(i,n){
		   main_west_context+=' <li><div index="'+n.id+'" url="${pageContext.request.contextPath}'+n.url+'" onclick="toggal_tabs(this)">'+n.index_name+'</div>';
		   var childrens = n.childrenList;
		   if(childrens.length > 0 ){
			   $.each( childrens,function(index,item){
				   main_west_context+='<ul>';
				   main_west_context+='<li><div index="'+item.id+'" url="${pageContext.request.contextPath}'+item.url+'" onclick="toggal_tabs(this)">'+item.index_name+'</div>';
				   main_west_context+='</ul>';
			   });
		   }
		   main_west_context+='</li>';
	   });
	   $("#west_area").html(main_west_context);
   });
   
   
   function review_path (url,title){
	   
    $.post(url,function(data){
		  // var  title=$(ele).html();
		   $("#mall_manager_index_center").tabs("add",{
			   title:title,
			   content:data,
			   closable:true
		   });
	   });
   }
   function toggal_tabs(ele){
	 //  console.log($(ele).attr("url"));
      if($("#mall_manager_index_center").tabs("exists",$(ele).html())){
		   $("#mall_manager_index_center").tabs("select",$(ele).html());
		   return;
	   }
      var content = "1212";
      $.post($(ele).attr("url"),function(data){
		   
		   var  title=$(ele).html();
		   $("#mall_manager_index_center").tabs("add",{
			   title:title,
			   content:data,
			   closable:true
		   });
	   });
	   
	  /*  if($("#mall_manager_index_center").tabs("exists",$(ele).html()){
		   
		   
		   $("#mall_manager_index_center").tabs("select",$(ele).html());
		   return;
	   }
	   var content = open_on_tabs(ele);
	   var  title=$(ele).html();
	   $("#mall_manager_index_center").tabs("add",{
		   titel:title,
		   content:content,
		   closable:true
	   }); */
   }
</script>
</html>