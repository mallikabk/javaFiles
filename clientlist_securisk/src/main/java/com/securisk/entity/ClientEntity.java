package com.securisk.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import antlr.StringUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClientEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "client_Id")
	private Integer id;
	@Column(name="client_name")
	private String clientName;
	@Column(name="product_type")
	private String productType;
	@Column(name="users")
	private String users;
	@Column(name="location")
	private String location;
	@Column(name="tpa_list")
	private String tpaList;
	@Column(name="insurancecompany")
	private String insurancecompany;
	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return false;
	}

}
