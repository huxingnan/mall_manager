<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        <span>添加商品信息</span><br/>
    
  商品名称：<input name="product_name" type="text"/>
 <br/>
 商品描述：<input name="product_description" type="text"/>
 <br/>
 <hr/>
 <span>上传商品图片</span><br/>
   <img onclick="spu_uploadImage(this)" flag="0" style="width: 100px;height: 100px" src="${pageContext.request.contextPath}/image/small_image/upload_hover.png"/>
   <input type="file" flag="0" style="display: none" name="files" onchange="spu_displayImage(this)" class="fileupload_input" /> &nbsp;&nbsp;
<hr/>
<button id="spu_submit_Button" onclick="spu_submitForm()" >提交</button>
<script type="text/javascript" >
function spu_uploadImage(ele){
	   var fileupload_input =$(ele).nextAll("input").first();
	   fileupload_input.click();
}
function spu_displayImage(ele){
	   var imgObj= $(ele)[0].files[0];
	   var URL = window.URL || window.webkitURL;
	   var imgURL = URL.createObjectURL(imgObj);
	   $(ele).prev().attr("src",imgURL);
	   var len =$(ele).attr("flag");
	  if(len == index && index < 4){
		index++;
	    spu_addImagElement(index,ele);
   }
}

function spu_addImagElement(index,ele){
	   var context="";
	      context +=' <img onclick="spu_uploadImage(this)" flag="'+index+'" style="width: 100px;height: 100px" src="${pageContext.request.contextPath}/image/small_image/upload_hover.png"/>'
	      context +=' <input type="file" style="display: none" flag="'+index+'" name="files" onchange="spu_displayImage(this)" class="fileupload_input" /> &nbsp;&nbsp;'
      $(ele).after(context);
   }
</script>