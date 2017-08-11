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
		<hr>
	   <form action="do_add_attr.do" method="post">
		   ${class_number_2} ${class_name_2}<br>
			<input type="hidden" name="class_name_2" value="${class_name_2}"/>
			<input type="hidden" name="class_number_2"  value="${class_number_2}"/>
			添加${class_name_2}分类属性<br>
			<a href="javascript:attr_add_table();">添加属性</a>
			<table border="1" style="margin-bottom: 20px">
				<tr><td>属性名:<input type="text" /></td><td></td><td><a href="javascript:void(0);" onclick="attr_add_table_tr(this)">添加属性值</a></td></tr>
				<tr><td>属性值:<input type="text"/></td><td>属性值名:<input type="text" /></td><td><a href="javascript:;" onclick="remove_tr(this)" >删除</a></td></tr>
			</table>
			<br/>
			 <a href="javascript:;" onclick="delete_attr_table(this)">删除属性</a>
			<br>
			<input id="add_attr_submit_button" onclick="attr_add_submit(this)" type="button" value="发布分类属性"/>
		</form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-3.2.0.js"></script>
<script type="text/javascript">

   function attr_add_table(){
	   var context = "";
	    context+='<table border="1"  style="margin-bottom: 20px" >';
		context+='<tr><td>属性名:<input type="text" /></td><td></td><td><a href="javascript:void(0);" onclick="attr_add_table_tr(this)">添加属性值</a></td></tr>';
		context+='<tr><td>属性值:<input type="text" /></td><td>属性值名:<input type="text"/></td><td><a href="javascript:;" onclick="remove_tr(this)" >删除</a></td></tr>';
	    context+='</table>';
	    $("#add_attr_submit_button").prevAll("table").last().after(context);
   }
   
   function attr_add_table_tr(ele){
	   var context="";
	   context+=' <tr><td>属性值:<input type="text" /></td><td>属性值名:<input type="text" /></td><td><a href="javascript:;" onclick="remove_tr(this)" >删除</a></td></tr>';
	   $(ele).parents("tr").first().nextAll().last().after(context);
   }
   
   function remove_tr(ele){
	   if($(ele).parents("tr").siblings("tr").length >=2){
	   $(ele).parents("tr").first().remove();
	   }else{
		   alert("至少保留一行");
	   }
   }
   
   function delete_attr_table(ele){
	  //console.log($(ele).prevAll("table").first().siblings("table").length);
	  if($(ele).prevAll("table").first().siblings("table").length > 0){
	    $(ele).prevAll("table").first().remove();
	  }else{
		  alert("至少保留一个table");
	  }
   }
   
   function attr_add_submit(ele){
	  var attr_tables = $(ele).siblings("table");
	  $(attr_tables).each(function(i,n){
		var trs =$(n).find("tr");
		$(trs).each(function(index,element){
			var inputs = $(element).find("input");
			if(index == 0){
				inputs.first().attr("name","object_T_Attr_List["+i+"].attr_name");
			}else{
				inputs.first().attr("name","object_T_Attr_List["+i+"].t_Attr_Value_list["+(index-1)+"].attr_value");
				inputs.eq(1).attr("name","object_T_Attr_List["+i+"].t_Attr_Value_list["+(index-1)+"].attr_value_name");
			}
		});
	  });
	  $(ele).parents("form").first().submit();
   }
  
</script>
</html>