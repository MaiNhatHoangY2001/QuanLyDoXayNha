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
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Product> theQuery = currentSession.createQuery("from Product", Product.class);
		List<Product> products = theQuery.getResultList();
		return products;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getProductsByPage(Integer offset, Integer maxResults) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Product> theQuery = currentSession
				.createQuery("from Product", Product.class)
				.setFirstResult(offset!=null?offset:0)
				.setMaxResults(maxResults!=null?maxResults:15);
		List<Product> products = theQuery.getResultList();
		return products;
	}


	@Override
	public Long count() {
		return (Long) sessionFactory.openSession().createCriteria(Product.class).setProjection(Projections.rowCount())
				.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> search(String keyword) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<String> theQuery = currentSession.createQuery("SELECT prd.title from Product as prd where prd.title like '%"+keyword+"%'");
		List<String> titles =(List<String>) theQuery.list();
		return titles;
	}
}
