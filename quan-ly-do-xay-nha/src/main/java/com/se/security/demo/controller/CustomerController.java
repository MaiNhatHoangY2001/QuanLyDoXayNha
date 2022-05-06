package com.se.security.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.security.demo.entity.Customer;
import com.se.security.demo.service.CustomerService;

@Controller

public class CustomerController {
	
	@Autowired
	// need to inject our customer service
	private CustomerService customerService;
	
	@GetMapping("/")
	public String listCustomers(Model theModel) {
		// get customers from the service
//		List<Customer> theCustomers = customerService.getCustomers();
//		// add the customers to the model
//		theModel.addAttribute("customers", theCustomers);
		return "home";
	}
//	@GetMapping("/")
//	public String listCustomers(Model theModel) {
//		// get customers from the service
////		List<Customer> theCustomers = customerService.getCustomers();
////		// add the customers to the model
////		theModel.addAttribute("customers", theCustomers);
//		return "customer-form-register";
//	}


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
