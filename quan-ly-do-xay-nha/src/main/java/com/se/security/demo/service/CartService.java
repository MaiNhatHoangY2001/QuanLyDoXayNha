package com.se.security.demo.service;

import java.util.List;

import com.se.security.demo.entity.Cart;
import com.se.security.demo.entity.CartDetail;

public interface CartService {
	public Cart getOrderByIdCustomer(int idKH);
	public List<?> getOrderDetailByOrder(int idOrder);
}
