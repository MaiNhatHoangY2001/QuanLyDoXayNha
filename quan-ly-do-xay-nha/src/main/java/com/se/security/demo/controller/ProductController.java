package com.se.security.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.se.security.demo.entity.Product;
import com.se.security.demo.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@GetMapping("/listProduct")
	public String listProducts(Model theModel, Integer offset, Integer maxResults) {
		List<Product> list = productService.getProductsByPage(offset, maxResults);
		List<String> titles = new ArrayList<String>();
		theModel.addAttribute("count", productService.count());
		theModel.addAttribute("offset", offset);
		theModel.addAttribute("products", list);
		theModel.addAttribute("titles", titles);
		return "list-product";
	}


	@RequestMapping(value = "/search")
    @ResponseBody
    public List<String> autoName(@RequestParam(value = "term", required = false, defaultValue = "")String term){
        List<String> titles = productService.search(term);
        return titles;
    }

}
