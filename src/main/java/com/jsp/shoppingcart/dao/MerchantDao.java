package com.jsp.shoppingcart.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.shoppingcart.dto.Merchant;
import com.jsp.shoppingcart.dto.Product;

@Repository
public class MerchantDao {
	
	@Autowired
	EntityManagerFactory emf;
	
	@Autowired 
	ProductDao pdao;
	
	
	public void saveMerchant(Merchant merchant) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.persist(merchant);
		et.commit();
	}
	public Merchant login(String email,String password) {
		EntityManager em=emf.createEntityManager();
		
		Query query=em.createQuery("select m from Merchant m where m.email=?1 and m.password=?2");
		
		query.setParameter(1, email);
		query.setParameter(2, password);
		
		
		try {
			Merchant m=(Merchant)query.getSingleResult();
			return m;
		}catch(Exception e) {
			return null;
		}
		
		
	}
	
	public void updateMerchant(Merchant merchant) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.merge(merchant);
		et.commit();
	}
	
	public void deleteMerchant(int id) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Merchant m=em.find(Merchant.class,id);		
		et.begin();
		em.remove(m);
		et.commit();
	}
	
	public Merchant fetchMerchantById(int id) {
		EntityManager em=emf.createEntityManager();
		
		Merchant m=em.find(Merchant.class,id);
		
		
		return m;
	}
	
	public Merchant deleteProductFromMerchant(int m_id,int p_id) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Merchant m=em.find(Merchant.class,m_id);
		List<Product> products=m.getProducts();
//		products.stream().filter(product->product.getId()!=p_id).collect(Collectors.toList());
		
		List<Product> productList=new ArrayList<Product>();
		for(Product p:products) {
			if(p.getId()!=p_id) {
				productList.add(p);
			}
		}
		m.setProducts(productList);
		
		et.begin();
		em.merge(m);
		et.commit();
		
		pdao.deleteProductById(p_id);
		
		return m;
	}
	
	
	

}
