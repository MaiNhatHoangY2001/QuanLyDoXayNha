package com.se.security.demo.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.type.StringNVarcharType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.se.security.demo.entity.Cart;
import com.se.security.demo.entity.CartDetail;

@Repository
@Transactional
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
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(cart);
	}

	@Override
	public void saveCartDetail(CartDetail cartDetail) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "insert into cart_detail values(?, ?, ?, ?)";
		session.createNativeQuery(sql).setParameter(1, cartDetail.getCart().getId())
				.setParameter(2, cartDetail.getProduct().getId()).setParameter(3, cartDetail.getSoLuong())
				.setParameter(4, cartDetail.getGia()).executeUpdate();
	}

	@Override
	public void updateCartDetail(CartDetail cartDetail) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "update cart_detail set so_luong = " + cartDetail.getSoLuong() + ", gia = N'" + cartDetail.getGia()
				+ "' where id_order = " + cartDetail.getCart().getId() + " and id_product = "
				+ cartDetail.getProduct().getId();
		session.createNativeQuery(sql).executeUpdate();
	}

	@Override
	public void updateCart(Cart cart) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "update cart set ngay_lap = '" + cart.getNgayLap() + "', thanh_tien = N'" + cart.getThanhTien()
				+ "', id_kh = " + cart.getCustomer().getId() + ", thanh_toan = N'" + cart.getThanhToan()
				+ "' where id = " + cart.getId();
		session.createNativeQuery(sql).executeUpdate();
	}
}
