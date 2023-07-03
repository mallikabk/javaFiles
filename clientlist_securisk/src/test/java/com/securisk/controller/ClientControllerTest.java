package com.securisk.controller;



import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;

import org.springframework.http.MediaType;




import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import org.springframework.test.web.servlet.MockMvc;

import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.securisk.entity.ClientEntity;
import com.securisk.repo.ClientRepo;
import com.securisk.service.ClientServiceImpl;

@ExtendWith(MockitoExtension.class)
public class ClientControllerTest {

	private MockMvc mockMvc;
	ObjectMapper objectMapper = new ObjectMapper();
	ObjectWriter objectWriter = objectMapper.writer();

	@Mock
	ClientServiceImpl impl;

	@InjectMocks
	ClientController clientController;

	ClientEntity clientEntity_1 = new ClientEntity(1, "LIC", "EB", "Fresh", "hyd", "TpaList", "StarHealth");
	ClientEntity clientEntity_2 = new ClientEntity(2, "HHM", "NONEB", "Renewal", "hyd", "TpaList", "StarHealth");
	ClientEntity clientEntity_3 = new ClientEntity(3, "XYZ", "EB", "Both", "hyd", "TpaList", "StarHealth");

	@BeforeEach
	public void setUp() {
		this.mockMvc = MockMvcBuilders.standaloneSetup(clientController).build();
	}

	@Test
	public void addClient_success() throws Exception {
		// Create a ClientEntity object
		ClientEntity clientEntity_4 = new ClientEntity(4, "XYZ", "EB", "Both", "hyd", "TpaList", "StarHealth");

		// Set up the mock behavior for the clientRepo.save() method
		Mockito.when(impl.addClient(clientEntity_4)).thenReturn(true);

		// Convert the clientEntity_4 to JSON string
		String content = objectWriter.writeValueAsString(clientEntity_4);

		// Build the mock request using MockMvcRequestBuilders.post()
		MockHttpServletRequestBuilder mockRequest = MockMvcRequestBuilders.post("/client/addClient")
				.contentType(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).content(content);

		mockMvc.perform(mockRequest).andExpect(status().isOk()).andExpect(content().string("Client registered..."));
	}
	@Test
	public void addClient_failure() throws Exception {
		// Create a ClientEntity object
		ClientEntity clientEntity_4 = new ClientEntity();
		

		// Set up the mock behavior for the clientRepo.save() method
		Mockito.when(impl.addClient(clientEntity_4)).thenReturn(false);

		// Convert the clientEntity_4 to JSON string
		String content = objectWriter.writeValueAsString(clientEntity_4);

		// Build the mock request using MockMvcRequestBuilders.post()
		MockHttpServletRequestBuilder mockRequest = MockMvcRequestBuilders.post("/client/addClient")
				.contentType(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).content(content);

		mockMvc.perform(mockRequest).andExpect(status().isNotFound()).andExpect(content().string("Client not registered.."));
	}
	

}
