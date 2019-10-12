package com.xzit.sso.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.xzit.sso.pojo.Employee;

public interface EmployeeRepository extends JpaRepository<Employee,Integer> {

	Employee findByEmpUsernameAndEmpPassword(String empUsername,String empPassword);
	
}
