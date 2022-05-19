package mainapp.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import mainapp.config.SpringHibConfig;
import mainapp.entities.Customer;
import mainapp.services.CustomerService;
import mainapp.services.CustomerServiceImpl;

public class Test {

	public static void main(String[] args) {
		// test hibernate
		ApplicationContext ctx  = new AnnotationConfigApplicationContext(SpringHibConfig.class);
		CustomerService cs = ctx.getBean(CustomerServiceImpl.class);

//		List<Customer> list = cs.getCustomersByFirstNameEmail("","");
//		if (list == null) {
//			System.out.println("list is empty");
//		}else {
//			for(Customer c:list) {
//				System.out.println(c);
//			}
//		}
		
		
		Customer c = new Customer();
		System.out.println(c.getId());
	}

}
