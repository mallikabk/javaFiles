package com.cms.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cms.daoImpl.CustomerDaoImpl;
import com.cms.pojo.Customer;

@WebServlet("/display")
public class ViewAllServlet extends HttpServlet {
	CustomerDaoImpl imp = new CustomerDaoImpl();

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Customer> list = imp.viewall();
		System.out.println(list);
		
		req.setAttribute("view", list);
	req.getRequestDispatcher("table.jsp").forward(req, res);
		

	}

}
