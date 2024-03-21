package com.jsp.shoppingcart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shoppingcart.dao.CartDao;
import com.jsp.shoppingcart.dao.CustomerDao;
import com.jsp.shoppingcart.dto.Cart;
import com.jsp.shoppingcart.dto.Customer;
import com.jsp.shoppingcart.dto.Item;

@Controller
public class CartController {

	@Autowired
	CartDao dao;
	
	@Autowired
	CustomerDao custdao;
	
	@RequestMapping("/customer/fetchallitemfromcart")
	public ModelAndView fetchItemsFromCart(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		
		Customer c=(Customer)session.getAttribute("customerinfo");
		c=custdao.fetchCustomerById(c.getId());
		Cart cart=c.getCart();
		List<Item> items=cart.getItems();
		
		mv.addObject("itemlist",items);
		mv.addObject("price",cart.getTotal_price());
		
		mv.setViewName("customer/displayCartItem");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
}
