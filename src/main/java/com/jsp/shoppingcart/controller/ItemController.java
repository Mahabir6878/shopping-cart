package com.jsp.shoppingcart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shoppingcart.dao.CartDao;
import com.jsp.shoppingcart.dao.CustomerDao;
import com.jsp.shoppingcart.dao.ItemDao;
import com.jsp.shoppingcart.dao.ProductDao;
import com.jsp.shoppingcart.dto.Cart;
import com.jsp.shoppingcart.dto.Customer;
import com.jsp.shoppingcart.dto.Item;
import com.jsp.shoppingcart.dto.Product;


@Controller
public class ItemController {

	@Autowired
	ItemDao dao;
	
	@Autowired
	ProductDao pdao;
	
	@Autowired
	CartDao cartdao;
	
	@Autowired
	CustomerDao cdao;
	
	@RequestMapping("customer/addcart")
	public ModelAndView addItem(@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
		
		Product p=pdao.findProductById(id);
		mv.addObject("product",p);
		mv.setViewName("customer/ItemForm");
		
		return mv;
	}
	@RequestMapping("customer/addToCart")
	public ModelAndView addToCart(ServletRequest req,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		int quantity=Integer.parseInt(req.getParameter("stock"));
		Product p=pdao.findProductById(Integer.parseInt(req.getParameter("id")));
		
		if(quantity>p.getStock()) {
			mv.addObject("msg","we have only "+p.getStock()+" quantity please select less than that.");
			mv.addObject("product",p);
			mv.setViewName("customer/ItemForm");
			return mv;
		}
		Item i=new Item();
		i.setBrand(req.getParameter("brand"));
		i.setModel(req.getParameter("model"));
		i.setP_id(Integer.parseInt(req.getParameter("id")));
		i.setPrice(quantity*Double.parseDouble(req.getParameter("price")));
		i.setQuantity(quantity);
		
		Customer c=(Customer)session.getAttribute("customerinfo");
		Cart cart=c.getCart();
		if(cart==null) {
			cart=new Cart();
			List<Item> items=new ArrayList();
			items.add(i);
			
			cart.setItems(items);
			cart.setName(c.getName());
			cart.setTotal_price(i.getPrice());
			
			c.setCart(cart);
			dao.saveItem(i);
			cartdao.saveCart(cart);
			
			cdao.updateCustomer(c);
		}else {
			List<Item> items=cart.getItems();
			if(items.size()>0) {
				items.add(i);
				cart.setItems(items);
				double t_price=0;
				for(Item ii:items)
					t_price+=ii.getPrice();
				cart.setTotal_price(t_price);
				c.setCart(cart);
				dao.saveItem(i);
				cartdao.updateCart(cart);
				cdao.updateCustomer(c);
			}else {
				items=new ArrayList();
				items.add(i);
				
				cart.setItems(items);
				cart.setTotal_price(i.getPrice());
				
				dao.saveItem(i);
				cartdao.updateCart(cart);
				
				cdao.updateCustomer(c);
			}
			
			
		}
		mv.setViewName("redirect://customer/AllProductCus");
		
		
		return mv;
	}
}
