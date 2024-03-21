package com.jsp.shoppingcart.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shoppingcart.dao.CustomerDao;
import com.jsp.shoppingcart.dao.ProductDao;
import com.jsp.shoppingcart.dto.Customer;
import com.jsp.shoppingcart.dto.Product;

@Controller
public class CustomerController {
	
	@Autowired
	CustomerDao dao;
	
	@Autowired
	ProductDao pdao;

	@RequestMapping("/customer/addCustomer")
	public ModelAndView addCustomer() {
		Customer c=new Customer();
		ModelAndView mv=new ModelAndView();
		mv.addObject("customerObj",c);
		mv.setViewName("customer/CustomerForm");
		
		return mv;
	}
	@RequestMapping("/customer/saveCustomer")
	public ModelAndView saveCustomer(@ModelAttribute("customerObj") Customer c) {
		ModelAndView mv=new ModelAndView();
		dao.saveCustomer(c);
		mv.addObject("msg","data save successfully");
		mv.setViewName("customer/CustomerLogin");
		return mv;
		
	}
	@RequestMapping("/customer/loginValidationCustomer")
	public ModelAndView loginCustomer(ServletRequest req ,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		Customer c=dao.login(email, password);
		
		if(c==null) {
			mv.addObject("msg","invalid credential");
			mv.setViewName("customer/CustomerLogin");
		}else {
			mv.addObject("msg","Login success");
			mv.setViewName("customer/CustomerOption");
			session.setAttribute("customerinfo", c);
		}

		return mv;
	}
	
	@RequestMapping("/customer/veiwallproduct")
	public ModelAndView veiwallproduct() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("redirect://customer/AllProductCus");

		return mv;
	}
	
	
	
	
	
	
	
}
