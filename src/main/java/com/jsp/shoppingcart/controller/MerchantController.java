package com.jsp.shoppingcart.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shoppingcart.dao.MerchantDao;
import com.jsp.shoppingcart.dto.Merchant;

@Controller
public class MerchantController {
	
	@Autowired
	MerchantDao dao;

	@RequestMapping("/merchant/addMerchant")
	public ModelAndView addMerchant() {
		Merchant m=new Merchant();
		ModelAndView mv=new ModelAndView();
		mv.addObject("merchantObj",m);
		mv.setViewName("merchant/MerchantForm");
		
		return mv;
	}
	@RequestMapping("/merchant/saveMerchant")
	public ModelAndView saveMerchant(@ModelAttribute("merchantObj") Merchant m) {
		ModelAndView mv=new ModelAndView();
		dao.saveMerchant(m);
		mv.addObject("msg","data save successfully");
		mv.setViewName("merchant/Menu");
		return mv;
		
	}
	@RequestMapping("/merchant/loginValidation")
	public ModelAndView loginMerchant(ServletRequest req ,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		Merchant m=dao.login(email, password);
		
		if(m==null) {
			mv.addObject("msg","invalid credential");
			mv.setViewName("merchant/MerchantLogin");
		}else {
			mv.addObject("msg","Login success");
			mv.setViewName("merchant/MerchantOption");
			session.setAttribute("merchantinfo", m);
		}
		
		return mv;
	}
	
	
	
	
	
	
	
}
