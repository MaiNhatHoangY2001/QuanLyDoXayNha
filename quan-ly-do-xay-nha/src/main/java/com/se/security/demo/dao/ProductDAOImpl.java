package com.se.security.demo.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getProductsByPage(Integer offset, Integer maxResults) {
		return sessionFactory.openSession()
                .createCriteria(Product.class)
                .setFirstResult(offset!=null?offset:0)
                .setMaxResults(maxResults!=null?maxResults:15)
                .list();
	}


	@Override
	public Long count() {
		return (Long) sessionFactory.openSession().createCriteria(Product.class).setProjection(Projections.rowCount())
				.uniqueResult();
	}
}
