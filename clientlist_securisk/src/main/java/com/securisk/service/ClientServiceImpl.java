package com.securisk.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.securisk.entity.ClientEntity;
import com.securisk.repo.ClientRepo;

@Service
public class ClientServiceImpl implements ClientService {
	@Autowired
	private ClientRepo clientrepo;

	@Override
	public boolean addClient(ClientEntity client) {
		ClientEntity issaved = clientrepo.save(client);
		if (issaved != null && !issaved.isEmpty()) {
			return true;
		} else

			return false;
	}

	@Override
	public List<ClientEntity> allClients() {
		List<ClientEntity> allClients = clientrepo.findAll();
		return allClients;
	}

	@Override
	public boolean updateClient(ClientEntity client) {
		Optional<ClientEntity> client1 = clientrepo.findById(client.getId());
		ClientEntity clientEntity = client1.get();
		boolean flag = false;
		if (clientEntity != null) {
			clientEntity.setId(client.getId());
			clientEntity.setClientName(client.getClientName());
			clientEntity.setInsurancecompany(client.getInsurancecompany());
			clientEntity.setLocation(client.getLocation());
			clientEntity.setProductType(client.getProductType());
			clientEntity.setUsers(client.getUsers());
			clientEntity.setTpaList(client.getTpaList());
			ClientEntity issaved = clientrepo.save(clientEntity);
			if (issaved != null) {
				flag = true;
			}
		}
		return flag;
	}

	@Override
	public boolean deleteClient(Integer id) {
		Optional<ClientEntity> client = clientrepo.findById(id);
		boolean b = false;
		if (client != null) {
			clientrepo.deleteById(id);
			b = true;
		}
		return b;
	}

	@Override
	public ClientEntity getClientById(Integer id) {
		Optional<ClientEntity> findById = clientrepo.findById(id);
		ClientEntity clientEntity = findById.get();
		return clientEntity;
	}

}
