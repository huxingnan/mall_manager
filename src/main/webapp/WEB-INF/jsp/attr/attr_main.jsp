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
<h2>商品属性管理</h2>
<form method="post" id="attr_product_form"action="${pageContext.request.contextPath}/attr/saveProductInfoAndImage.do" enctype="multipart/form-data">
  <hr>
  <span>一级分类<span>
   <select id="attr_class_number_1"  name="class_number_1" onchange="getClassNumber2(this.value)">
 
   </select>
   <span>二级分类<span>
  <select id="attr_class_number_2" name="class_number_2" onchange="addAttrForProduct()" >
     <option >默认</option>
  </select>

  <br/>
  <hr/>
  <div id="attr_list_area">
		

  </div>
 <hr/>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-3.2.0.js"></script>
<script type="text/javascript">

   var index =0;
    
   function submitForm(){
	   $("#attr_product_form").submit();
   }
   
  var selectEle1 = $("#attr_class_number_1");
  
  $.getJSON("${pageContext.request.contextPath}/js/json/class_number_1.js",function(data){
	  $.each(data,function(i,n){
		  selectEle1.append('<option value="'+n.id+'">'+n.class_name_1+'</option>');
	  })
	  getClassNumber2(selectEle1.val());
  });
  
  function addAttrForProduct(){
	//  $("#attr_class_number_2 :selected") ||
	  var option =  $("#attr_class_number_2 :selected");
	  //console.log(option);
	// var option = $(select_2 ).find("option").first();
	   // select_2.
	   
	  console.log(option);
	  $.post("${pageContext.request.contextPath}/attr/attr_add.do",{"class_number_2":option.val(),"class_name_2":option.text()}, function(data){
		   $("#attr_list_area").html(data);
	  });
  }
  
  
  function getClassNumber2(class_number_1_id){
    var selectEle2	=  $("#attr_class_number_2");
    var attr_brand_class_select	=  $("#attr_brand_class");
    selectEle2.empty();
    attr_brand_class_select.empty();
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
    selectEle2.change();
  }
  
  
</script>
</html>