package com.se.security.demo.dao;

import java.util.List;

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
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Cart> theQuery = currentSession.createQuery("from Cart", Cart.class);
		
	//where id_kh = " + idKH + " AND thanh_toan like :thanhToan
				//.setParameter("thanhToan", "chưa thanh toán", StringNVarcharType.INSTANCE);
		
		List<Cart> cart = theQuery.getResultList();
		
		return cart.get(0);
	}

	@Override
	public List<?> getOrderDetailByOrder(int idOrder) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery(
				"select detail.so_luong, detail.gia, product.title, product.price, product.status from OrderDetail detail INNER JOIN detail.products product where detail.id_order = "
						+ idOrder);
		List<?> orderDetails = theQuery.list();
		return orderDetails;
	}

}
