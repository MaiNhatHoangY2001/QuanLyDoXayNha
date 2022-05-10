package com.se.security.demo.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.se.security.demo.entity.Cart;
import com.se.security.demo.entity.CartDetail;
import com.se.security.demo.service.CartService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	@GetMapping("/cart")
	public String listCart(Model model) {
		Cart cart = cartService.getOrderByIdCustomer(1);
		if (cart != null) {
			List<CartDetail> cartDetails = cartService.getOrderDetailByOrder(cart.getId());
			model.addAttribute("listDetail", cartDetails);
			model.addAttribute("cart", cart);
		}

		return "cart";
	}
}
