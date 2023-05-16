package com.cms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.daoImpl.CustomerDaoImpl;
import com.cms.pojo.Customer;
@WebServlet("/register")
public class RegisterController extends HttpServlet {
	CustomerDaoImpl cimpl=new CustomerDaoImpl();
	public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
	int count=0;
	CustomerDaoImpl cimpl=new CustomerDaoImpl();
	String id=req.getParameter("id");
	int id1=Integer.parseInt(id);
	String name=req.getParameter("name");
	String add=req.getParameter("add");
	Customer cus=new Customer(id1,name,add);
	boolean b=cimpl.register(cus);
	String msg="";
	if(b) {
		msg="Registered Successfully!!!";
	}
	else {
		msg="Not Registered!!!";
	}
	RequestDispatcher rd=null;
	req.setAttribute("msg", msg);
	if(b!=false) {
		rd=req.getRequestDispatcher("/reg1.jsp");
		rd.forward(req, res);
	}else {
		rd=req.getRequestDispatcher("/reg2.jsp");
		rd.forward(req, res);

	}
}
}