package com.ojas.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "BOOK")
public class BookEntity {
	@Id
	@Column(name = "BID")
	private int bid;
	@Column(name = "BNAME")
	private String bname;
	@Column(name = "PRICE")
	private int price;
	@Column(name = "author")
	private String author;
}
