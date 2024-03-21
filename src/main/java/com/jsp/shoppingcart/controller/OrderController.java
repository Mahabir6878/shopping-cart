package com.jsp.shoppingcart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shoppingcart.dao.CartDao;
import com.jsp.shoppingcart.dao.CustomerDao;
import com.jsp.shoppingcart.dao.OrderDao;
import com.jsp.shoppingcart.dao.ProductDao;
import com.jsp.shoppingcart.dto.Cart;
import com.jsp.shoppingcart.dto.Customer;
import com.jsp.shoppingcart.dto.Item;
import com.jsp.shoppingcart.dto.Orders;
import com.jsp.shoppingcart.dto.Product;

@Controller
public class OrderController {

	@Autowired
	OrderDao dao;
	
	@Autowired
	CustomerDao cdao;
	
	@Autowired
	ProductDao pdao;
	
	@Autowired
	CartDao cartdao;
	
	@RequestMapping("/customer/addorder")
	public ModelAndView addOrder(ServletRequest req,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		Customer c=(Customer)session.getAttribute("customerinfo");
		c=cdao.fetchCustomerById(c.getId());
		Cart cart=c.getCart();
		
		Orders order=new Orders();
		
		order.setAddress(req.getParameter("address"));
		order.setName(req.getParameter("name"));
		order.setMobilenumber(req.getParameter("mobile"));
//		order.setTotal_price(cart.getTotal_price());
		
		List<Item> listitem=new ArrayList<Item>();
		List<Item> leftitem=new ArrayList<Item>();
		
		for(Item i:cart.getItems()) {
			Product p=pdao.findProductById(i.getP_id());
			if(i.getQuantity()<p.getStock()) {
				listitem.add(i);
				p.setStock(p.getStock()-i.getQuantity());
				pdao.updateProduct(p);
			}else {
				leftitem.add(i);
			}
		}
//		Set order item and total price
		
		order.setItems(listitem);
		double d1=0;
		for(Item i:listitem)
			d1+=i.getPrice();
		order.setTotal_price(d1);
		
//		set left item in cart and total price
		cart.setItems(leftitem);
		double d=0;
		for(Item i:leftitem)
			d+=i.getPrice();
		cart.setTotal_price(d);
		
		List<Orders> orders=c.getOrder();
		if(orders.size()>0) {
			orders.add(order);
			c.setOrder(orders);
		}else {
			orders=new ArrayList<Orders>();
			orders.add(order);
			c.setOrder(orders);
		}
		cartdao.updateCart(cart);
		c.setCart(cart);
		dao.saveOrder(order);
		cdao.updateCustomer(c);
		mv.addObject("msg","order successfully");
		mv.addObject("orderdetail",order);
		mv.setViewName("customer/CustomerBill");	
		
		
		return mv;
	}
}
