package com.securisk.service;

import java.util.List;

import com.securisk.entity.ClientEntity;

public interface ClientService {
	public boolean addClient(ClientEntity client);

	public List<ClientEntity> allClients();

	public boolean updateClient(ClientEntity client);

	public boolean deleteClient(Integer id);

	public ClientEntity getClientById(Integer id);

}
