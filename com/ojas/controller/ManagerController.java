package com.ojas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
@RestController
public class ManagerController {
	@Autowired
	private DiscoveryClient client;

	@GetMapping("/manager/{name}")
	public String getDetails(@PathVariable String name) {
		List<ServiceInstance> instances = client.getInstances("CUSTOMER-SERVICE");
		// List<ServiceInstance> instances2 = client.getInstances("HELLO-SERVICE");
//		System.out.println(instances);
		ServiceInstance si = instances.get(0);
		// ServiceInstance si2 = instances.get(0);
		String url = si.getUri() + "/customer" + "/" + name;
		// String url2 = si.getUri() + "/hello" + "/" + name;
		RestTemplate rest = new RestTemplate();
		// RestTemplate rest2 = new RestTemplate();
		String msg = rest.getForObject(url, String.class);
		// String msg2 = rest.getForObject(url2,String.class);
		return "This is : " + msg;

	}
}
