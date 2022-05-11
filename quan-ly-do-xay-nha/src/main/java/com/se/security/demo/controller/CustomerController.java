package com.se.security.demo.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.se.security.demo.entity.Product;
import com.se.security.demo.service.CustomerService;
import com.se.security.demo.service.ProductService;

@Controller
public class CustomerController {
	
	@Autowired
	// need to inject our customer service
	private CustomerService customerService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/")
	public String listCustomers(Model theModel) {
		// get customers from the service
//		List<Customer> theCustomers = customerService.getCustomers();
//		// add the customers to the model
//		theModel.addAttribute("customers", theCustomers);
		
		List<Product> listProduct = new ArrayList<Product>();
		for (int i = 1; i <= 20; i++) {
			Product temp20 = productService.getProductById(i);
			listProduct.add(temp20);
		}
		theModel.addAttribute("products", listProduct);
		
		List<Product> listTwelveProduct = new ArrayList<Product>();
		for (int i = 1; i <= 12; i++) {
			Product temp = productService.getProductById(i);
			listTwelveProduct.add(temp);
		}
		theModel.addAttribute("twelveProducts", listTwelveProduct);

		return "home";
	}
	
	

//	@PostMapping("/saveCustomer")
//	public String saveCustomer(@ModelAttribute("customer") Customer theCustomer) {
//		// save the customer using our service
//		customerService.saveCustomer(theCustomer);
//		return "redirect:/";
//	}
//
//	@GetMapping("/showFormForUpdate")
//	public String showFormForUpdate(@RequestParam("customerId") int theId, Model theModel) {
//		// get the customer from our service
//		Customer theCustomer = customerService.getCustomer(theId);
//		// set customer as a model attribute to pre-populate the form
//		theModel.addAttribute("customer", theCustomer);
//		// send over to our form
//		return "customer-form";
//	}
//
//	@GetMapping("/showFormForAdd")
//	public String showFormForAdd(Model theModel) {
//		// create model attribute to bind form data
//		Customer theCustomer = new Customer();
//		theModel.addAttribute("customer", theCustomer);
//		return "customer-form";
//	}
//
//	@GetMapping("/delete")
//	public String deleteCustomer(@RequestParam("customerId") int theId) {
//
//		// delete the customer
//		customerService.deleteCustomer(theId);
//
//		return "redirect:/";
//	}

}