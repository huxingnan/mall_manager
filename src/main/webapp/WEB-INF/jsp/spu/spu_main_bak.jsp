<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title >Insert title here</title>
</head>
<body>

<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'north',split:true,border:false" style="height:50px"></div>
				<div data-options="region:'west',split:true,border:false" style="width:100px"></div>
				<div data-options="region:'center',border:false"></div>
			</div>


<h2>SPU商品管理</h2>
<form method="post" id="spu_product_form"action="${pageContext.request.contextPath}/spu/saveProductInfoAndImage.do" enctype="multipart/form-data">
  <hr>
  <span>一级分类<span>
   <select id="spu_class_number_1"  name="class_number_1" onchange="getClassNumber2AndBrand(this.value)">
 
   </select>
   <span>二级分类<span>
  <select id="spu_class_number_2" name="class_number_2" >
     
  </select>
   <span>品牌<span>
  <select id="spu_brand_class" name="brand_id" >
     
  </select>
  <br/>
  <hr/>
  <span>添加商品信息</span><br/>
  商品名称：<input name="product_name" type="text"/>
 <br/>
 商品描述：<input name="product_description" type="text"/>
 <br/>
 <hr/>
 <span>上传商品图片</span><br/>
   <img onclick="uploadImage(this)" flag="0" style="width: 100px" src="${pageContext.request.contextPath}/image/small_image/upload_hover.png"/>
   <input type="file" flag="0" style="display: none" name="files" onchange="displayImage(this)" class="fileupload_input" /> &nbsp;&nbsp;
<button id="submit_Button" onclick="">提交</button>
</form>
</body>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-3.2.0.js"></script> --%>
<script type="text/javascript">

   var index =0;
    
   function submitForm(){
	   $("#spu_product_form").submit();
   }
   
   function uploadImage(ele){
	   var fileupload_input =$(ele).next();
	   fileupload_input.click();
   }
   
   function displayImage(ele){
	   var imgObj= $(ele)[0].files[0];
	   var URL = window.URL || window.webkitURL;
	   var imgURL = URL.createObjectURL(imgObj);
	   $(ele).prev().attr("src",imgURL);
	   var len =$(ele).attr("flag");
	//  var len = $(".fileupload_input").length;
	  if(len == index && index < 4){
		index++;
	    addImagElement(index,ele);
	   
      }
   }
   
   function addImagElement(index,ele){
	   var context="";
	      context +=' <img onclick="uploadImage(this)" flag="'+index+'" style="width: 100px" src="${pageContext.request.contextPath}/image/small_image/upload_hover.png"/>'
	      context +=' <input type="file" style="display: none" flag="'+index+'" name="files" onchange="displayImage(this)" class="fileupload_input" /> &nbsp;&nbsp;'
         $(ele).after(context);
      }

  var selectEle1 = $("#spu_class_number_1");
  
  
  $.getJSON("${pageContext.request.contextPath}/js/json/class_number_1.js",function(data){
	  $.each(data,function(i,n){
		  selectEle1.append('<option value="'+n.id+'">'+n.class_name_1+'</option>');
	  })
	  getClassNumber2AndBrand(selectEle1.val());
  });
  
  //一级分类下拉选择框 change 事件  根据 一级分类ID 获取 二级分类 以及 品牌
  function getClassNumber2AndBrand(class_number_1_id){
    var selectEle2	=  $("#spu_class_number_2");
    var spu_brand_class_select	=  $("#spu_brand_class");
    selectEle2.empty();
    spu_brand_class_select.empty();
    $.getJSON("${pageContext.request.contextPath}/js/json/class_number_2_"+class_number_1_id+".js",function(data){
  	  $.each(data,function(i,n){
  		  selectEle2.append('<option value="'+n.id+'">'+n.class_name_2+'</option>');
  	  })
    });
    $.getJSON("${pageContext.request.contextPath}/js/json/brand_class_"+class_number_1_id+".js",function(data){
    	  $.each(data,function(i,n){
    		  spu_brand_class_select.append('<option value="'+n.id+'">'+n.brand_name+'</option>');
    	  })
      });
  }
  
  
</script>
</html>