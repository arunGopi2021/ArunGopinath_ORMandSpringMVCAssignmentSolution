package mainapp.services;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mainapp.entities.Customer;



@Repository
public class CustomerServiceImpl implements CustomerService {
	
	private SessionFactory sessionFactory;
	
	
	
	
	//Constructors
	public CustomerServiceImpl() {
		super();
	}
	
	
	
	@Autowired
	public CustomerServiceImpl(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	
	
	//Implemented methods from the CustomerService I/F

	public List<Customer> getAllCustomers() {
		
		Session sessionObj = sessionFactory.getCurrentSession();
		Transaction tx = sessionObj.beginTransaction();
		List<Customer> customers = null;
		try {
			customers = sessionObj.createQuery("from Customer", Customer.class).list();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}finally {
			sessionObj.close();
		}//finally-ends
		
		return customers;
	}
	
	

	
	
	public List<Customer> getCustomersByFirstNameEmail(String firstName, String email) {
		
		Session sessionObj = sessionFactory.getCurrentSession();
		Transaction tx = sessionObj.beginTransaction();
		List<Customer> customers = null;
		
		// create query
		String query ="";
		if(firstName.length()!=0 && email.length()!=0) {
			query = "from Customer where FirstName like '%"+firstName+"%' or email like '%"+email+"%'";
		}else if(firstName.length()!=0) {
			query = "from Customer where FirstName like '%"+firstName+"%'";
		}else if(email.length()!=0){
			query = "from Customer where email like '%"+email+"%'";
		}else {
			return customers;
		}
		
		
		try {
			customers = sessionObj.createQuery(query, Customer.class).list();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}finally {
			sessionObj.close();
		}
		
		return customers;
	}

	public Customer getCustomerById(int id) {
		
		Session sessionObj = sessionFactory.getCurrentSession();
		Transaction tx = sessionObj.beginTransaction();
		Customer customer = null;
		try {
			customer = sessionObj.get(Customer.class, id);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}finally {
			sessionObj.close();
		}//finally-ends
		
		return customer;
	}
	
	
	
	
	

	public Boolean save(Customer customer) {
		
		Boolean bool = false;
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
			session.saveOrUpdate(customer);
			tx.commit();
			bool = true;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			bool = false;
		}finally {
			session.close();
		}
		
		
		return bool;
	}
	
	
	
	

	public Boolean deleteById(int id) {
		Boolean bool = false;
		
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
			Customer customer = session.get(Customer.class, id);
			if(customer != null) {
				session.delete(customer);
				bool=true;
			}else {
				bool = false;
			}
			tx.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			bool = false;
		}finally {
			session.close();
		}
		
		return bool;
	}

}// class ends
