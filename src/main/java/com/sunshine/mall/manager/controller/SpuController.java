package com.sunshine.mall.manager.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sunshine.mall.manager.bean.T_Product;
import com.sunshine.mall.manager.service.ProductService;
import com.sunshine.mall.manager.util.MyStringUtil;
import com.sunshine.mall.manager.util.MyUploadUtil;

@Controller
@RequestMapping("/spu")
public class SpuController {

	@Autowired
	ProductService productService;
	
	@RequestMapping("/main")
	public String toMain() {
		return "/spu/spu_main";
	}
	
	@RequestMapping("/saveProductInfoAndImage")
	public ModelAndView saveProductInfoAndImage(T_Product product ,@RequestParam("files") MultipartFile[] files){
		List<String> filenamelist =MyUploadUtil.saveFile(files);
		String spu_main_Image = filenamelist.get(0);
		product.setProduct_image(spu_main_Image);
		productService.saveProduct(product,filenamelist);//主键返回 
	   return MyStringUtil.WrappAndURLEncodingModel("spu/main.do", "spu商品信息管理", "redirect:/main.do");
	}
	
	@RequestMapping("/goto_add_spu_page")
	public String gotoAddSpuPage() {
		return "/spu/spu_add";
	}
	
	@RequestMapping("/goto_process_spu_page")
	public String gotoProcessSpuPage() {
		return "/spu/spu_process";
	}
	
	@ResponseBody
	@RequestMapping("/getSpuInfoAll")
	public Object getSpuInfoAll() {
		productService.getSpuInfoAll();
		return "/spu/spu_process";
	}
}
