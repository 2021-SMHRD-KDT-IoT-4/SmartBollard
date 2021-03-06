package com.Model;

public class BoladDTO {	//볼라드 관련 DTO
	
	private	int bolno;
	private String street;
	private String product;
	private String bstatus;
	private int heartbeat;
	
	
	

	public BoladDTO(int bolno) {
		this.bolno = bolno;
	}

	public BoladDTO(int bolno, String street, String product, String bstatus, int heartbeat) {
		this.bolno = bolno;
		this.street = street;
		this.product = product;
		this.bstatus = bstatus;
		this.heartbeat = heartbeat;
	}

	public BoladDTO(String street, String product) {
		this.street = street;
		this.product = product;
	}


	public BoladDTO(String street) {
		this.street = street;
	}

	public int getBolno() {
		return bolno;
	}

	public void setBolno(int bolno) {
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
	public int getHeartbeat() {
		return heartbeat;
	}



	public void setHeartbeat(int heartbeat) {
		this.heartbeat = heartbeat;
	}
	
	
}
