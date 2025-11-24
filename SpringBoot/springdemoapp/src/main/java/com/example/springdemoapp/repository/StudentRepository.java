package com.example.springdemoapp.repository;
 
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.springdemoapp.entity.Student;

public interface StudentRepository extends JpaRepository<Student, Long>{

}