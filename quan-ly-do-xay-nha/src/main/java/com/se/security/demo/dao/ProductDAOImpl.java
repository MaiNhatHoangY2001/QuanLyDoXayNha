package com.se.security.demo.dao;


import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.type.StringNVarcharType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.security.demo.entity.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Product getProductById(int id) {
		Session session;

		try {
		    session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
		    session = sessionFactory.openSession();
		}
		Product product = session.get(Product.class, id);
		return product;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getProductsByPage(Integer offset, Integer maxResults, String title) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Product> theQuery = currentSession
				.createQuery("from Product as prd where prd.title like :title", Product.class)
				.setParameter( "title", "%" + title + "%", StringNVarcharType.INSTANCE )
				.setFirstResult(offset!=null?offset:0)
				.setMaxResults(maxResults!=null?maxResults:15);
		List<Product> products = theQuery.getResultList();
		return products;
	}


	@Override
	public Long count(String title) {
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		Query<Long> query = currentSession.createQuery(
		        "select count(*) from Product as prd where prd.title  like :title")
				.setParameter( "title", "%" + title + "%", StringNVarcharType.INSTANCE );
		Long count = (Long)query.uniqueResult();
		return count;
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