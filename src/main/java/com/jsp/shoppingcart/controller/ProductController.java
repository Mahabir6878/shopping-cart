package com.jsp.shoppingcart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.shoppingcart.dao.MerchantDao;
import com.jsp.shoppingcart.dao.ProductDao;
import com.jsp.shoppingcart.dto.Merchant;
import com.jsp.shoppingcart.dto.Product;

@Controller
public class ProductController {
	
	@Autowired
	ProductDao dao;
	
	@Autowired
	MerchantDao mdao;

	@RequestMapping("/merchant/addproduct")
	public ModelAndView addProduct() {
		ModelAndView mv=new ModelAndView();
		Product p=new Product();
		mv.addObject("productobj",p);
		mv.setViewName("merchant/ProductForm");
		return mv;
		
	}
	
	@RequestMapping("/merchant/saveproduct")
	public ModelAndView saveProduct(@ModelAttribute("productobj") Product p,HttpSession session) {
		Merchant m=(Merchant)session.getAttribute("merchantinfo");
		List<Product> product =m.getProducts();
		
		if(product.size()>0) {
			product.add(p);
			m.setProducts(product);
		}else {
			List<Product> productlist=new ArrayList<Product>();
			productlist.add(p);
			m.setProducts(productlist);
			
		}
		dao.saveProduct(p);
		mdao.updateMerchant(m);
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("msg", "product save successfully");
		mv.setViewName("merchant/MerchantOption");
		return mv;
	}
	@RequestMapping("/merchant/deleteproduct")
	public ModelAndView  deleteProduct(@RequestParam("id")int id,HttpSession session) {
		Merchant m=(Merchant)session.getAttribute("merchantinfo");
		m=mdao.deleteProductFromMerchant(m.getId(), id);
		session.setAttribute("merchantinfo", m);
		ModelAndView mv=new ModelAndView();
		mv.addObject("msg", "product delete successfully");
		mv.setViewName("merchant/VeiwAllProduct");
		
		return mv;
		
		
	}
	@RequestMapping("/merchant/updateproduct")
	public ModelAndView  updateProduct(@RequestParam("id")int id) {
		Product p=dao.findProductById(id);
		ModelAndView mv=new ModelAndView();
		mv.addObject("productinfo",p);
		mv.setViewName("merchant/UpdateProduct");
		return mv;		
	}
	
	@RequestMapping("/merchant/updateProductDetail")
	public ModelAndView  updateProductdetail(@ModelAttribute("productinfo") Product p,ServletRequest req,HttpSession session) {
		p.setBrand(req.getParameter("brand"));
		p.setCategory(req.getParameter("category"));
		p.setModel(req.getParameter("model"));
		p.setStock(Integer.parseInt( req.getParameter("stock")));
		p.setPrice(Double.parseDouble( req.getParameter("price")));
		dao.updateProduct(p);
		ModelAndView mv=new ModelAndView();
		Merchant m=(Merchant)session.getAttribute("merchantinfo");
		session.setAttribute("merchantinfo", m);
		mv.addObject("msg","update product successfully");
		mv.setViewName("merchant/VeiwAllProduct");
		return mv;
		
		
	}
	
	@RequestMapping("/customer/AllProductCus")
	public ModelAndView veiwAllProductCus() {
		ModelAndView mv=new ModelAndView();
		
		List<Product> p=dao.findAllProducts();
		mv.addObject("products", p);
		
		mv.setViewName("customer/VeiwProductCus");
		
		return mv;
	}
	
	@RequestMapping("/customer/productByBrand")
	public ModelAndView veiwBrandProductCus(ServletRequest req) {
		ModelAndView mv=new ModelAndView();
		
		List<Product> p=dao.findProductByBrand(req.getParameter("brand"));
		
		
		mv.addObject("products", p);
		
		mv.setViewName("customer/VeiwProductCus");
		
		return mv;
	}
	
	
	
	
	
	
}
