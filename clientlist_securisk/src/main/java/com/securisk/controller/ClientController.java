package com.securisk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.securisk.entity.ClientEntity;
import com.securisk.service.ClientServiceImpl;

@RestController
@RequestMapping("client")
@CrossOrigin
public class ClientController {
	@Autowired
	private ClientServiceImpl impl;

	@PostMapping("/addClient")
	public ResponseEntity<String> addClient(@RequestBody ClientEntity client) {
		String res = "";
		boolean addClient = impl.addClient(client);
		if (addClient) {
			res = "Client registered...";
		} else {
			res = "Client not registered..";
		}
		return ResponseEntity.ok().body(res);
	}

	@GetMapping("/allClients")
	public ResponseEntity<List<ClientEntity>> getAllClients() {
		List<ClientEntity> allClients = impl.allClients();
		return ResponseEntity.ok().body(allClients);

	}

	@PutMapping("/updateClient")
	public ResponseEntity<String> updateClient(@RequestBody ClientEntity entity) {
		boolean updateClient = impl.updateClient(entity);
		String msg = "";
		if (updateClient) {
			msg = "Updated Client Details...";
		} else {
			msg = "Not Updated ...";
		}
		return ResponseEntity.ok().body(msg);

	}

	@DeleteMapping("/deleteClient/{id}")
	public ResponseEntity<String> deleteClient(@PathVariable Integer id) {
		boolean deleteClient = impl.deleteClient(id);
		String msg = "";
		if (deleteClient) {
			msg = "Client Deleted..";
		} else {
			msg = "Not deleted..";
		}
		return ResponseEntity.ok().body(msg);
	}
}
