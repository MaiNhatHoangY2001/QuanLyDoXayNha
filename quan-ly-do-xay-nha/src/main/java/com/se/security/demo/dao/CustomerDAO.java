package com.se.security.demo.dao;
import java.util.List;

import com.se.security.demo.entity.Customer;
public interface CustomerDAO {
    public List<Customer> getCustomers();
    public void saveCustomer(Customer theCustomer);
    public void addCustomer(Customer theCustomer);
    public Customer getCustomer(int theId);
    public void deleteCustomer(int theId);
}
