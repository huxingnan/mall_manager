package com.sunshine.mall.manager.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sunshine.mall.manager.bean.T_Product;
import com.sunshine.mall.manager.service.ProductService;
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
	public String saveProductInfoAndImage(T_Product product ,@RequestParam("files") MultipartFile[] files){
		List<String> filenamelist =MyUploadUtil.saveFile(files);
		
		productService.saveProduct(product,filenamelist);//主键返回 
		
		//Integer product_id = product.getId();//获取生成的产品id
		//productService.saveProductImageById(product_id, filenamelist);
		
		return "redirect:/spu/main.do";
	}
	
}
