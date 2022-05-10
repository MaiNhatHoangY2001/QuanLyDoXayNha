package com.se.security.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.security.demo.entity.Cart;
import com.se.security.demo.entity.CartDetail;
import com.se.security.demo.service.CartService;
import com.se.security.demo.service.CustomerService;
import com.se.security.demo.service.ProductService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private ProductService productService;

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
	
	@RequestMapping(value = "saveCartAndCartDetail", method = RequestMethod.GET)
	public void saveCartAndCartDetail(@RequestParam(value = "qty", required = true) int qty, Model model) {
		System.out.println(qty);
	}
	
}
