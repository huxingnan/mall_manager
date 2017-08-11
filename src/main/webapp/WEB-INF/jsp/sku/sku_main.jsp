<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/image/small_image/zebre.png" type="image/x-icon" />
<title >sunshine商城</title>
</head>
<body>
<h2>SKU管理</h2>
<form method="post"  action="${pageContext.request.contextPath}/sku/saveSkuInfo.do" >
  <hr>
  <span>一级分类</span>
   <select id="sku_class_number_1"  name="class_number_1" onchange="getClassNumber2(this.value)">
 
   </select>
   <span>二级分类</span>
  <select id="sku_class_number_2" name="class_number_2" onchange="getAttrByClassNumber2()" >
     <option >默认</option>
  </select>
  <span>品牌</span>
   <select id="sku_brand_class" name="brand_id" onclick="getProductByClassNumber2AndBrandId()">
       
  </select>
  <span>商品</span>
   <select id="sku_product_class" name="product_id" >
       
  </select>
  <br/>
  SKU名字:<input type="text" name="sku_name"  /><br/>
   库存数量:<input type="text" name="product_amount" /><br/>
    商品单价:<input type="text" name="price"><br/>
  <hr/>
  <div id="sku_attr_name_list_area">
     
  </div>
  <hr/>
  <div id="sku_attr_value_list_area">
  
  </div>
  </form>
  <button onclick="sku_submit(this)">添加SKU</button>
 <hr/>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-3.2.0.js"></script>
<script type="text/javascript">

   var index =0;
    var sku_attr_all ;
   
   
   function sku_submit(submit_btn){
	  // alert("aa");
	   var attr_name_checkeds=$("#sku_attr_name_list_area").find(":checked");
	   //console.log(attr_name_checkeds);
	   $.each(attr_name_checkeds,function(i,n){
		   $(n).attr("name","sku_Attr_Value_list["+i+"].attr_name_id");
	   });
	   var attr_value_radioGroups = $("#sku_attr_value_list_area").find("p");
	  // console.log(attr_value_radioGroups);
	   
	   $.each(attr_value_radioGroups,function(i,n){
		  $(n).find("input").attr("name","sku_Attr_Value_list["+i+"].attr_value_id");
	   });
	 $(submit_btn).prevAll("form").first().submit();
   }
   
  var selectEle1 = $("#sku_class_number_1");
  
  //通过二级分类 和  品牌 id  获取 产品
   function getProductByClassNumber2AndBrandId(){
	   var sku_class_number_2 = $("#sku_class_number_2 :selected");
	   var sku_brand_class  = $("#sku_brand_class :selected");
	   if(!sku_class_number_2 || !sku_brand_class ){
		   alert("请选择二级分类 或者 品牌");
	   }else{
		   $.getJSON("${pageContext.request.contextPath}/sku/getProductByClassNumber2AndBrandId.do",{"class_number_2":sku_class_number_2.val(),"brand_id":sku_brand_class.val()},function(data){
				 var context="";
				 $.each(data,function(i,n){
					context+='<option value='+n.id+'>'+n.product_name+'</option>' 
				 });
				 $("#sku_product_class").html(context);
		   });
	   }
   }
  
  //获取一级分类信息
  $.getJSON("${pageContext.request.contextPath}/js/json/class_number_1.js",function(data){
	  $.each(data,function(i,n){
		  selectEle1.append('<option value="'+n.id+'">'+n.class_name_1+'</option>');
	  })
	  getClassNumber2(selectEle1.val());
  });
  
  
  
  //一级分类下拉选择框 change 事件  根据 一级分类ID 获取 二级分类 以及 品牌
  function getClassNumber2(class_number_1_id){
    var selectEle2	=  $("#sku_class_number_2");
   // var attr_brand_class_select	=  $("#sku_brand_class");
    
    var sku_brand_class_select	=  $("#sku_brand_class");
    selectEle2.empty();
    sku_brand_class_select.empty();
    
    selectEle2.empty();
   // attr_brand_class_select.empty();
    $.getJSON("${pageContext.request.contextPath}/js/json/class_number_2_"+class_number_1_id+".js",function(data){
  	  $.each(data,function(i,n){
  		  //console.log(i);
  		  if(i == 0){
  			 selectEle2.append('<option selected="selected" value="'+n.id+'">'+n.class_name_2+'</option>');
  		  }else{
  			selectEle2.append('<option value="'+n.id+'">'+n.class_name_2+'</option>');
  		  }
  	  })
    });
    //selectEle2.change();
    
    $.getJSON("${pageContext.request.contextPath}/js/json/brand_class_"+class_number_1_id+".js",function(data){
  	  $.each(data,function(i,n){
  		  sku_brand_class_select.append('<option value="'+n.id+'">'+n.brand_name+'</option>');
  	  })
    });
  }
  
  function getAttrByClassNumber2(){
	  var option = $("#sku_class_number_2 :selected");
	  $.getJSON("${pageContext.request.contextPath}/sku/getAttrByClassNumber2.do",{"class_number_2":option.val()},function(data){
		  context1="";
		  sku_attr_all=data;
		  $.each(data,function(i,n){
	  		 context1+=n.attr_name+':<input onclick="toggleShowAttrValue(this)" type="checkbox"  id="'+i+'" value="'+n.id+'" />'
	  	  })
	  	  $("#sku_attr_name_list_area").html(context1);
		  
		  
	    });
  }
  
  function toggleShowAttrValue(ele){
	  var checked=$(ele).parents("div").first().find("input:checked");
	  context2="";
	  $.each(checked,function(i,n){
		 var attr_id = $(n).val();
		 var index = $(n).attr("id");
		context2+= getAttrValueByAttrId(attr_id,index);
	  })
	  $("#sku_attr_value_list_area").html(context2);
  }
  
  function getAttrValueByAttrId(attr_id,index){
	  var attrvalues=sku_attr_all[index].attrValueList;
	  //console.log(attrvalues);
	  context=sku_attr_all[index].attr_name+": <p>";
	  $.each(attrvalues,function(i,n){
		 // console.log(sku_attr_all[index]);
		 // console.log(attr_id);
		 // if(n.id == attr_id){
		    context+='<input type="radio" name="'+index+'" value="'+n.id+'"  />'+n.attr_value+""+n.attr_value_name;
		//  }
	  });
	  return context+='</p>';
  }
  
  
  
</script>
</html>