<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css" >
  .big_input_contaner input{
     margin: 5px;
     width: 400px;
  }
  
  .myui_easyui-layout_west{
      width: 220px;
      margin-top: 30px;
      padding-left: 20px;
  }
  
  
</style>

	<div class="easyui-layout" data-options="fit:true">
	<form method="post"
	action="${pageContext.request.contextPath}/sku/saveSkuInfo.do">
		<div class="myui_easyui-layout_west" data-options="region:'west',split:true,border:false" >
		
			<span>一级分类</span> <br/>
			<select id="sku_class_number_1" class="easyui-combobox" style="width: 160px" name="class_number_1" >
                 <option>请选择</option>
			</select> <br/>
			<span>二级分类</span>  <br/>
			<select id="sku_class_number_2" class="easyui-combobox"  style="width: 160px" name="class_number_2" >
				<option>请选择</option>
			</select> <br/>
			<span>品牌</span> <br/>
			<select id="sku_brand_class" name="brand_id" class="easyui-combobox" style="width: 160px"  onclick="getProductByClassNumber2AndBrandId()">
				<option>请选择</option>
			</select><br/>
			 <span>商品</span> <br/>
			 <select id="sku_product_class"  style="width: 160px" class="easyui-combobox"  name="product_id">
				<option>请选择</option>
			</select>
		</div>
		<div    data-options="region:'center',border:false" style="width: 220px;margin-top: 30px;padding-left: 40px;padding-right: 40px" >
			<br />
			<div class="big_input_contaner">
			SKU名字:<input type="text" name="sku_name" /><br /> 
			库存数量:<input type="text" name="product_amount" /><br /> 
			商品单价:<input type="text" name="price"><br />
			</div>
			<hr />
			选择属性名:<div id="sku_attr_name_list_area" style="height: 50px" ></div>
			<hr />
			选择属性值:<div id="sku_attr_value_list_area" style="height: 150px"></div>
            <hr />
			<button onclick="sku_submit(this)" style="mar">添加SKU</button>
		</div>
		</form>
	</div>

<script type="text/javascript">
	var index = 0;
	var sku_attr_all;

	  $("#sku_class_number_1").combobox({    
		    url:"${pageContext.request.contextPath}/js/json/class_number_1.js",  
		    valueField:"id",    
		    textField:"class_name_1",
		    value:"请选择",
		    onSelect:function (){
		    	var class_number_1 = $(this).combobox('getValue');
		    	//console.log(class_number_1);
		    	 $("#sku_class_number_2").combobox({ 
		    		 url:"${pageContext.request.contextPath}/js/json/class_number_2_"+class_number_1+".js",
		    		    valueField:"id",    
		    		    textField:"class_name_2",
		    		    value:"请选择",
		    		    onSelect:sku_getAttrByClassNumber2
		    	 });
		    	 
		    	 $("#sku_brand_class").combobox({ 
		    		    url:"${pageContext.request.contextPath}/js/json/brand_class_"+class_number_1+".js",
		    		    valueField:"id",    
		    		    textField:"brand_name",
		    		    value:"请选择",
		    		    onSelect:sku_brand_class_onselect
		    	 });
		    }
		});  
	
	  function sku_brand_class_onselect(){
		    	var sku_class_number_2 = $("#sku_class_number_2").combobox("getValue");
	    		var sku_brand_class = $("#sku_brand_class").combobox("getValue");
	    		if (!sku_class_number_2 || !sku_brand_class) {
	    			alert("请选择二级分类 或者 品牌");
	    			return;
	    		} else {
	    		$.getJSON(
	    		"${pageContext.request.contextPath}/sku/getProductByClassNumber2AndBrandId.do",
	    		{"class_number_2" : sku_class_number_2,"brand_id" : sku_brand_class},
	    		function(json) {
	    			$("#sku_product_class").combobox({ 
	    				data:json,
   		    		    valueField:"id",    
		    		    textField:"product_name",
		    		    value:"请选择"
	    			});
	    		});
	    	  } 
	  }
	  
	function sku_submit(submit_btn) {
		// alert("aa");
		var attr_name_checkeds = $("#sku_attr_name_list_area").find(":checked");
		//console.log(attr_name_checkeds);
		$.each(attr_name_checkeds, function(i, n) {
			$(n).attr("name", "sku_Attr_Value_list[" + i + "].attr_name_id");
		});
		var attr_value_radioGroups = $("#sku_attr_value_list_area").find("span");
		// console.log(attr_value_radioGroups);

		$.each(attr_value_radioGroups, function(i, n) {
			$(n).find("input").attr("name",
					"sku_Attr_Value_list[" + i + "].attr_value_id");
		});
		$(submit_btn).prevAll("form").first().submit();
	}
	var selectEle1 = $("#sku_class_number_1");

	//通过二级分类 和  品牌 id  获取 产品
	/* function getProductByClassNumber2AndBrandId() {
		var sku_class_number_2 = $("#sku_class_number_2 :selected");
		var sku_brand_class = $("#sku_brand_class :selected");
		if (!sku_class_number_2 || !sku_brand_class) {
			alert("请选择二级分类 或者 品牌");
		} else {
			$.getJSON(
		"${pageContext.request.contextPath}/sku/getProductByClassNumber2AndBrandId.do",
		{"class_number_2" : sku_class_number_2.val(),"brand_id" : sku_brand_class.val()},
		function(data) {var context = "";
		$.each(data, function(i, n) {context += '<option value='+n.id+'>'+ n.product_name + '</option>'});
		$("#sku_product_class").html(context);});
		}
	} */
	//获取一级分类信息
	/* $.getJSON("${pageContext.request.contextPath}/js/json/class_number_1.js",
	function(data) {
		$.each(data, 
			function(i, n) {selectEle1.append('<option value="'+n.id+'">'+ n.class_name_1 + '</option>');
			})
getClassNumber2(selectEle1.val());}); */

	//一级分类下拉选择框 change 事件  根据 一级分类ID 获取 二级分类 以及 品牌
	/* function getClassNumber2(class_number_1_id) {
		var selectEle2 = $("#sku_class_number_2");
		// var attr_brand_class_select	=  $("#sku_brand_class");
		var sku_brand_class_select = $("#sku_brand_class");
		selectEle2.empty();
		sku_brand_class_select.empty();
		selectEle2.empty();
		// attr_brand_class_select.empty();
		$.getJSON(
		"${pageContext.request.contextPath}/js/json/class_number_2_"+ class_number_1_id + ".js",
		function(data) {
			$.each(data,function(i, n) {
			if (i == 0) {
			selectEle2.append('<option selected="selected" value="'+n.id+'">'+ n.class_name_2+ '</option>');
			} else {	
			selectEle2.append('<option value="'+n.id+'">'+ n.class_name_2+ '</option>');
			}
		});
	}); */
		//selectEle2.change();
		/* $.getJSON("${pageContext.request.contextPath}/js/json/brand_class_"
				+ class_number_1_id + ".js", function(data) {
			$.each(data, function(i, n) {
				sku_brand_class_select.append('<option value="'+n.id+'">'
						+ n.brand_name + '</option>');
			})
		});
	} */

	function sku_getAttrByClassNumber2() {
		var option = $("#sku_class_number_2").combobox("getValue");
		$.getJSON(
		"${pageContext.request.contextPath}/sku/getAttrByClassNumber2.do",
		{"class_number_2" : option},
		function(data) {
			context1 = "";
			sku_attr_all = data;
			$.each(data,function(i, n) {
			context1 += n.attr_name+ ':<input onclick="toggleShowAttrValue(this)" type="checkbox"  id="'+ i + '" value="'+ n.id + '" />'
		    });
		    $("#sku_attr_name_list_area").html(context1);});
	}

	function toggleShowAttrValue(ele) {
		var checked = $(ele).parents("div").first().find("input:checked");
		context2 = "";
		$.each(checked, function(i, n) {
			var attr_id = $(n).val();
			var index = $(n).attr("id");
			context2 += getAttrValueByAttrId(attr_id, index);
		});
		$("#sku_attr_value_list_area").html(context2);
	}

	function getAttrValueByAttrId(attr_id, index) {
		var attrvalues = sku_attr_all[index].attrValueList;
		//console.log(attrvalues);
		context = sku_attr_all[index].attr_name + ": <span>";
		$.each(attrvalues,
		function(i, n) {context += '<input type="radio" name="'+index+'" value="'+n.id+'"  />'+ n.attr_value + "" + n.attr_value_name+"";
        });
		return context += '</span><br/>';
	}
</script>
