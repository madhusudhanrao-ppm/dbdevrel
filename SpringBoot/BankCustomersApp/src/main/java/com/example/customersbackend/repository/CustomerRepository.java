package com.example.customersbackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
 
import com.example.customersbackend.entity.Customer;
 
/* 
JpaRepository is a core interface within Spring Data Java Persistence API, designed to simplify data access 
and persistence operations in Java applications using the Java Persistence API (JPA). 
It acts as a powerful abstraction layer, significantly reducing the amount of boilerplate code 
required for common database interactions.
*/


public interface CustomerRepository extends JpaRepository<Customer, Long> {
    
}
