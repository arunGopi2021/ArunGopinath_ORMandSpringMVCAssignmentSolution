package mainapp.services;

import java.util.List;

import org.springframework.stereotype.Service;

import mainapp.entities.Customer;


@Service
public interface CustomerService {
	
	//List all the customers
	public List<Customer> getAllCustomers();
	
	//Search by first name and email
	public List<Customer> getCustomersByFirstNameEmail(String firstName, String email);
	
	//Search by Id
	public Customer getCustomerById(int id);
	
	
	//Save or Update
	public Boolean save(Customer customer);
	
	//Delete
	public Boolean deleteById(int id);
}
