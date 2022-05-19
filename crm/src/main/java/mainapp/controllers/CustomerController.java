package mainapp.controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mainapp.entities.Customer;
import mainapp.services.CustomerService;



@Controller
@RequestMapping("/customers")
public class CustomerController {
	
	@Autowired
	private CustomerService customerServiceObject;
		
	// list all the customers in DB
	@RequestMapping("/list")
	public String getCustomersList(Model model) {
		
		List<Customer> listOfCustomers = customerServiceObject.getAllCustomers();
		model.addAttribute("listCustomers", listOfCustomers);
		
		return "list-customers";
	}
	
	
	//Add functionality -> show form for adding a customer -> save the data to DB
	@RequestMapping("/add")
	public String showFormAddNewCustomer(Model model) {
		Customer newCustomer = new Customer();
		model.addAttribute("newCustomer", newCustomer);
		return "form-customer";
	}
	
	
	
	
	@PostMapping("/save") 
	public String saveCustomer(@RequestParam(name = "firstName") String firstName, @RequestParam(name = "lastName") 
	String lastName, @RequestParam(name = "email") String email, @RequestParam(name="id") int id, Model model) {
		Boolean update;
		boolean isSuccess;
		if(id!=0) {
			Customer customer = customerServiceObject.getCustomerById(id);
			customer.setFirstName(firstName);
			customer.setLastName(lastName);
			customer.setEmail(email);
			isSuccess = customerServiceObject.save(customer);
			
			
			if(isSuccess) {
				update = true;
				model.addAttribute("update", update);
			}else {
				update = false;
				model.addAttribute("update", update);
			}
			
		}else {
			isSuccess = customerServiceObject.save(new Customer(firstName,lastName,email));
			update=false;
			model.addAttribute("update", update);
		}
		
		model.addAttribute("isSuccess", isSuccess);
		model.addAttribute("firstName", firstName);
		model.addAttribute("lastName", lastName);
		
		
		return "isSaved-customer";
	}
	
	
	
	@RequestMapping("/update")
	public String showFormUpdate(@RequestParam(name = "id") int id, Model model) {
		
		//This will pre-populate the form with the data present in customer object that is fetched below
		Customer customer = customerServiceObject.getCustomerById(id);		
		model.addAttribute("newCustomer", customer);
		model.addAttribute("isUpdate", true);
		return "form-customer";
	}
	
	
	@RequestMapping("/search")
	public String searchCustomer(@RequestParam(name = "firstName", defaultValue = "" ) String firstName, 
			@RequestParam(name = "email", defaultValue = "" ) String email, Model model) {
		
		List<Customer> listCustomers = customerServiceObject.getCustomersByFirstNameEmail(firstName, email);
		model.addAttribute("listCustomers", listCustomers);
		return "search-results";
	}
	
	
	@RequestMapping("/delete")
	public String deleteCustomer(@RequestParam(name="id")int id) {
		customerServiceObject.deleteById(id);
		return "redirect:list";
	}
	
	

}
