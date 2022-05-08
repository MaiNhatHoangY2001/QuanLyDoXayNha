package com.se.security.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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

	@GetMapping("/listProduct/{productId}")
	public String getProduct(@PathVariable int productId, Model theModel) {
		Product product = productService.getProductById(productId);
		List<Product> tam = productService.getProducts();
		List<Product> listProduct = new ArrayList<Product>();
		int tong = 4;
		
		for (int i = 1; i <= tong; i++) {
			if (i != productId) {
				listProduct.add(tam.get(i));
			} else {
				tong++;
			}
		}
		theModel.addAttribute("theProduct", product);
		theModel.addAttribute("products", listProduct);
		
		return "info-product";
	}
}
