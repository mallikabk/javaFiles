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
@WebServlet("/edit")
public class EditServlet extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println(id+"----id from editServlet");
		CustomerDaoImpl c=new CustomerDaoImpl();
		Customer edit = c.edit(id);
		System.out.println(edit.getCid()+"---after getting");
		req.setAttribute("customer", edit);
		req.getRequestDispatcher("edit.jsp").forward(req, res);
	
		
	}

}
