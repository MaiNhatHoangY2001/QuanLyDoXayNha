package com.se.security.demo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.security.demo.entity.Product;
@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Product> getProducts() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		// create a query ... sort by last name
		Query<Product> theQuery = currentSession.createQuery("from Product", Product.class);
		// execute query and get result list
		List<Product> products = theQuery.getResultList();
		// return the results
		return products;
	}

}
