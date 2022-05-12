package com.se.security.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.se.security.demo.dao.CustomerDAO;
import com.se.security.demo.entity.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {
    // need to inject customer dao
    @Autowired
    private CustomerDAO customerDAO;
    @Override
    @Transactional
    public void saveCustomer(Customer theCustomer) {
            customerDAO.saveCustomer(theCustomer);    }
 
    @Override
    @Transactional
    public Customer getCustomer(int theId) {
            return customerDAO.getCustomer(theId);   }
    @Override
    @Transactional
    public void deleteCustomer(int theId) {
            customerDAO.deleteCustomer(theId);   }
   
    @Override
    @Transactional
    public List<Customer> getCustomers() {
            return customerDAO.getCustomers();
    }

	@Override
	@Transactional
	public void addCustomer(Customer theCustomer) {
		customerDAO.addCustomer(theCustomer);
	}
    
}





