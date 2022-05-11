package com.se.security.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.se.security.demo.entity.Product;
import com.se.security.demo.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("/listProduct/info/{productId}")
	public String getProduct(@PathVariable int productId, Model theModel) {
		Product product = productService.getProductById(productId);
		List<Product> listProduct = new ArrayList<Product>();
		
		int[] ints = new Random().ints(1, 101).distinct().limit(4).toArray();
		for(int i : ints) {
			Product temp = productService.getProductById(i);
			listProduct.add(temp);
		}
		
		theModel.addAttribute("theProduct", product);
		theModel.addAttribute("products", listProduct);

		return "info-product";
	}

	@GetMapping("/listProduct/{title}")
	public String listProducts(@PathVariable(value = "title") String title, Model theModel, Integer offset,
			Integer maxResults) {
		List<Product> list = productService.getProductsByPage(offset, maxResults, title);
		List<String> titles = new ArrayList<String>();
		theModel.addAttribute("count", productService.count(title));
		theModel.addAttribute("offset", offset);
		theModel.addAttribute("products", list);
		theModel.addAttribute("titles", titles);
		theModel.addAttribute("title", title);
		return "list-product";
	}

	@RequestMapping(value = "/search")
	@ResponseBody
	public List<String> autoName(@RequestParam(value = "term", required = false, defaultValue = "") String term) {
		List<String> titles = productService.search(term);
		return titles;
	}
}
