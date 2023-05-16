package com.cms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.daoImpl.CustomerDaoImpl;
import com.cms.pojo.Customer;

public class UpdateServlet extends HttpServlet {
CustomerDaoImpl impl=new CustomerDaoImpl();
	public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException {
		String id=req.getParameter("id");
		int id1=Integer.parseInt(id);
		String name=req.getParameter("name");
		String address=req.getParameter("add");
		Customer c=new Customer(id1,name,address);
		int count=impl.update(c);
		String msg="";
		if(count!=0) {
			res.sendRedirect("dispaly");
		}
		else {
			msg="NOt Updated!!!";
		}
		
	}
}
