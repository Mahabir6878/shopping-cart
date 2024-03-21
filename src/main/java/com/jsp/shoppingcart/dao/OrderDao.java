package com.jsp.shoppingcart.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.shoppingcart.dto.Orders;

@Repository
public class OrderDao {

	@Autowired
	EntityManagerFactory emf;
	
	public void saveOrder(Orders i) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.persist(i);
		et.commit();
	}
	public void updateOrder(Orders i) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.merge(i);
		et.commit();
	}
	public void deleteOrderById(int id) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		Orders i=em.find(Orders.class, id);
		et.begin();
		em.remove(i);
		et.commit();
	}
	public Orders findOrderById(int id) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Orders i=em.find(Orders.class,id);
		return i;
	}
	
}
