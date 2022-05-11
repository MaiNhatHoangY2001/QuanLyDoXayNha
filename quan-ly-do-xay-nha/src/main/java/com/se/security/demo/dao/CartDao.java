package com.se.security.demo.dao;

import java.util.List;

import com.se.security.demo.entity.Cart;
import com.se.security.demo.entity.CartDetail;

public interface CartDao {
	public Cart getOrderByIdCustomer(int idKH);
	public List<CartDetail> getOrderDetailByOrder(int idOrder);
	public void saveCart(Cart cart);
	public void saveCartDetail(CartDetail cartDetail);
	public void updateCartDetail(CartDetail cartDetail);
	public void deleteCartDetail(int idProduct, int idCart);
	public void updateCart(Cart cart);

}
