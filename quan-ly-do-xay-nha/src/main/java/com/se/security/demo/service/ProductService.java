package com.se.security.demo.service;

import java.util.List;

import com.se.security.demo.entity.Product;

public interface ProductService {
	public List<Product> getProducts();
	public Product getProductById(int id);
}
