package com.tiandu.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tiandu.common.controller.BaseController;
import com.tiandu.custom.entity.TdUserSupplier;
import com.tiandu.custom.service.TdUserSupplierService;
import com.tiandu.district.service.TdDistrictService;

/**
 * 店铺
 */
@Controller
@RequestMapping("/seller")
public class CSellerController extends BaseController{

	@Autowired
	TdUserSupplierService tdUserSupplierService;
	
	@Autowired
	private TdDistrictService tdDistrictService;
	
	@RequestMapping("/item{id}")
	public String detail(@PathVariable Integer id,HttpServletRequest req,ModelMap map)
	{
		if(null == id){
			return "redirect:404";
		}
		
		// 系统配置
		map.addAttribute("system", getSystem());
		TdUserSupplier store = tdUserSupplierService.findOne(id);
		if(null==store){
			return "redirect:404";
		}
		map.addAttribute("store", store);
		
		return "/client/seller/detail";
	}
	
}
