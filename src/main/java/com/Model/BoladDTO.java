package com.Model;

public class BoladDTO {
	
	String bolno;
	String street;
	String product;
	String bstatus;
	
	public BoladDTO(String bolno, String street, String product, String bstatus) {
		this.bolno = bolno;
		this.street = street;
		this.product = product;
		this.bstatus = bstatus;
	}

	public String getBolno() {
		return bolno;
	}

	public void setBolno(String bolno) {
		this.bolno = bolno;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getBstatus() {
		return bstatus;
	}

	public void setBstatus(String bstatus) {
		this.bstatus = bstatus;
	}
	
	
	
}
