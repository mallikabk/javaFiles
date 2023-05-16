package com.cms.dao;

import java.util.List;

import com.cms.pojo.Customer;

public interface CustomerDao {
	public boolean register(Customer cus);

	public List<Customer> viewall();

	public int update(Customer c);

	public int delete(int cid);

	public Customer edit(int cid);
}
