<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
  .big_input_contaner input{
     margin: 5px;
     width: 400px;
  }
  
  .myui_easyui-layout_west{
      width: 220px;
      margin-top: 30px;
      padding-left: 20px;
  }
  .myui_easyui_layout_center{
     width: 220px;
     margin-top: 30px;
     padding-left: 40px;
     padding-right: 40px
  }
  
</style>
<div class="easyui-layout" data-options="fit:true">
<div  class="myui_easyui-layout_west"  data-options="region:'west',split:true,border:false" 
     style=" width: 220px;
      margin-top: 30px;
      padding-left: 20px">
      <span>一级分类<span><br/>
     <select id="attr_class_number_1" class="easyui-combobox" style="width: 160px"  name="class_number_1" onchange="getClassNumber2(this.value)">
       <option >请选择</option>
     </select><br/>
    <span>二级分类<span><br/>
   <select id="attr_class_number_2"  class="easyui-combobox" style="width: 160px" name="class_number_2" onchange="addAttrForProduct()" >
     <option >请选择</option>
  </select>
</div>
<div class="myui_easyui-layout_center"    data-options="region:'center',border:false" style="width: 220px;margin-top: 30px;padding-left: 40px;padding-right: 40px;overflow: auto;"  >
   <div id="attr_list_area" style="overflow: auto;height: 450px;">
		

  </div>
</div>
</div>


 

  
<script type="text/javascript">

   var index =0;
    
   function submitForm(){
	   $("#attr_product_form").submit();
   }
   
   $("#attr_class_number_1").combobox({
	   url:"${pageContext.request.contextPath}/js/json/class_number_1.js",
	   valueField:"id",    
       textField:"class_name_1",
	   value:"请选择",
	   onSelect:attr_main_getClassNumber2
	   
   });
   
      function addAttrForProduct(){
		  var option =  $("#attr_class_number_2").combobox("getValue");
		  var text = $("#attr_class_number_2").combobox("getText");
		  $.post("${pageContext.request.contextPath}/attr/attr_add.do",{"class_number_2":option,"class_name_2":text}, 
				  function(data){
			   $("#attr_list_area").html(data);
		  });
	  }
   
   
	  function attr_main_getClassNumber2(){
		 var class_number_1_id=$("#attr_class_number_1").combobox("getValue");
	  $("#attr_class_number_2").combobox({
		 url:" ${pageContext.request.contextPath}/js/json/class_number_2_"+class_number_1_id+".js",
		 valueField:"id",    
	     textField:"class_name_2",
	     value:"请选择",
	     onSelect:addAttrForProduct
	  });
	  }
 // var selectEle1 = $("#attr_class_number_1");
  /* 
  $.getJSON("${pageContext.request.contextPath}/js/json/class_number_1.js",
		  function(data){
	  $.each(data,function(i,n){
		  selectEle1.append('<option value="'+n.id+'">'+n.class_name_1+'</option>');
	  });
	  getClassNumber2(selectEle1.val());
  });
   */
  
  
  
</script>
</html>