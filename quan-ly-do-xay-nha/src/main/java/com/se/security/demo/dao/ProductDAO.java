package com.se.security.demo.dao;

import java.util.List;

import com.se.security.demo.entity.Product;

public interface ProductDAO {

	public List<Product> getProducts();
	public List<Product> getProductsByPage(Integer offset, Integer maxResults);
	public Long count();
}
