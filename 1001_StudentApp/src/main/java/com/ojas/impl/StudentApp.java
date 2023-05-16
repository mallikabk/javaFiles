package com.ojas.impl;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

import com.mysql.cj.xdevapi.SessionFactory;

public class StudentApp {
public static void main(String[] args) {
	Configuration cfg=new Configuration();
	System.out.println(cfg.getProperty("hibernate.connection.driver_class"));
	cfg.configure().getProperty("com\\ojas\\config\\student.xml");
	System.out.println(cfg.getProperty("hibernate.connection.driver_class"));


	
}
}
