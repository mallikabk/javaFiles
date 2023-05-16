package com.cms.pojo;

public class Customer {
	private int cid;
	private String name;
	private String  add;
	public Customer(int cid, String name, String add) {
		super();
		this.cid = cid;
		this.name = name;
		this.add = add;
	}
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Customer(String name, String add) {
		super();
		this.name = name;
		this.add = add;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAdd() {
		return add;
	}
	public void setAdd(String add) {
		this.add = add;
	}
	

}
