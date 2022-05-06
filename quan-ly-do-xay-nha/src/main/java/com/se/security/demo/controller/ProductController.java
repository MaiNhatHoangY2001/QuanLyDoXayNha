package com.se.security.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.se.security.demo.entity.Product;
import com.se.security.demo.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	
	@GetMapping("/listProduct")
	public String listProducts(Model theModel) {
		// get products from the service
		List<Product> products = productService.getProducts();
//		// add the customers to the model
		theModel.addAttribute("products", products);
		return "list-product";
	}
}
