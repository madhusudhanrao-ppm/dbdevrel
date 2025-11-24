package com.example.customersbackend.service;

import java.util.List;

import com.example.customersbackend.entity.Customer;
  
public interface CustomerService {

    List<Customer> getAllCustomers();

    Customer saveCustomer(Customer customer);
	
	Customer getCustomerById(Long id);
	
	Customer updateCustomer(Customer customer);
	
	void deleteCustomerById(Long id);
}
