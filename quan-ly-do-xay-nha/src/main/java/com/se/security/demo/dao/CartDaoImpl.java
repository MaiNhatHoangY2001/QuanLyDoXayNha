package com.se.security.demo.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.type.StringNVarcharType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.security.demo.entity.Cart;
import com.se.security.demo.entity.CartDetail;

@Repository
public class CartDaoImpl implements CartDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Cart getOrderByIdCustomer(int idKH) {
		try {
			Session currentSession = sessionFactory.getCurrentSession();
			Query<Cart> theQuery = currentSession
					.createQuery("from Cart where id_kh = " + idKH + " AND thanh_toan like :thanhToan", Cart.class)
					.setParameter("thanhToan", "chưa thanh toán", StringNVarcharType.INSTANCE);

			Cart cart = theQuery.getSingleResult();
			return cart;
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public List<CartDetail> getOrderDetailByOrder(int idOrder) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<CartDetail> theQuery = currentSession.createQuery("from CartDetail where id_order = " + idOrder,
				CartDetail.class);
		List<CartDetail> orderDetails = theQuery.getResultList();
		return orderDetails;
	}
	
	@Override
	public void saveCart(Cart cart) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(cart);
	}

	@Override
	public void saveCartDetail(CartDetail cartDetail) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(cartDetail);
	}

}
