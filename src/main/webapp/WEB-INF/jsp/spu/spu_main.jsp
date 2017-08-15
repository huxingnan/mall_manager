
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
<form method="post" id="spu_product_form"action="${pageContext.request.contextPath}/spu/saveProductInfoAndImage.do" enctype="multipart/form-data">
<div data-options="region:'west',split:true,border:false" style="width:200px;margin-top: 20px;padding-left: 15px">
    <span>一级分类<span>
   <select id="spu_class_number_1"  class="easyui-combobox"  name="class_number_1" onchange="getClassNumber2AndBrand(this.value)" style="width:150px;">
 
   </select><br/>
   <span>二级分类<span>
  <select id="spu_class_number_2" class="easyui-combobox"  name="class_number_2" style="width:150px;" >
     <option>请选择</option>
  </select><br/>
   <span>品牌<span><br/>
  <select id="spu_brand_class" class="easyui-combobox"  name="brand_id" style="width:150px;" >
     <option>请选择</option>
  </select>
  
  <br/>
  <a href="javascript:void(0);" onclick="spu_goto_add_spu_page()" >添加商品SPU</a>
  <br/>
  <a href="javascript:void(0);" onclick="spu_goto_process_spu_page()" >操作商品SPU</a>
</div>
<div data-options="region:'center',border:false" style="margin-top: 20px;padding-left: 40px;padding-right: 40px">
   <div id="spu_display_area">


   </div>
</form>
</div>
<script type="text/javascript">
   var index =0;
   spu_goto_add_spu_page();
   $("#spu_class_number_1").combobox({    
	    url:"${pageContext.request.contextPath}/js/json/class_number_1.js",  
	    valueField:"id",    
	    textField:"class_name_1",
	    value:"请选择",
	    onSelect:function (){
	    	var class_number_1 = $(this).combobox('getValue');
	    	//console.log(class_number_1);
	    	 $("#spu_class_number_2").combobox({ 
	    		 url:"${pageContext.request.contextPath}/js/json/class_number_2_"+class_number_1+".js",
	    		    valueField:"id",    
	    		    textField:"class_name_2",
	    		    value:"请选择",
	    	 });
	    	 
	    	 $("#spu_brand_class").combobox({ 
	    		 url:"${pageContext.request.contextPath}/js/json/brand_class_"+class_number_1+".js",
	    		    valueField:"id",    
	    		    textField:"brand_name",
	    		    value:"请选择",
	    	 });
	    }
	});  
   
   function spu_submitForm(){
	   $("#spu_product_form").submit();
   }
   
   function spu_goto_add_spu_page(){
	   $.post("${pageContext.request.contextPath}/spu/goto_add_spu_page.do",function(context){
		   $("#spu_display_area").html(context);
	   });
   }
   
  function spu_goto_process_spu_page(){
	  $.post("${pageContext.request.contextPath}/spu/goto_process_spu_page.do",function(context){
		   $("#spu_display_area").html(context);
	   });
  }
  /* $.getJSON("${pageContext.request.contextPath}/js/json/class_number_1.js",function(data){
	  $.each(data,function(i,n){
		  selectEle1.append('<option value="'+n.id+'">'+n.class_name_1+'</option>');
	  })
	  getClassNumber2AndBrand(selectEle1.val());
  }); */
  
  //一级分类下拉选择框 change 事件  根据 一级分类ID 获取 二级分类 以及 品牌
  /* function getClassNumber2AndBrand(class_number_1_id){
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
  } */
</script>
