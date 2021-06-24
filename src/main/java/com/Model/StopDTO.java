package com.Model;

public class StopDTO {
	
	int capno;
	String street;
	String captime;
	String carno;
	String capture;
	int bolno;
	
	public StopDTO(int capno, String street, String captime, String carno, String capture, int bolno) {
		this.capno = capno;
		this.street = street;
		this.captime = captime;
		this.carno = carno;
		this.capture = capture;
		this.bolno = bolno;
	}

	public StopDTO(String street, String carno, String capture, int bolno) {
		this.street = street;
		this.carno = carno;
		this.capture = capture;
		this.bolno = bolno;
	}

	public int getCapno() {
		return capno;
	}

	public void setCapno(int capno) {
		this.capno = capno;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}
	public String getCaptime() {
		return captime;
	}
	
	public void setCaptime(String captime) {
		this.captime = captime;
	}

	public String getCarno() {
		return carno;
	}

	public void setCarno(String carno) {
		this.carno = carno;
	}

	public String getCapture() {
		return capture;
	}

	public void setCapture(String capture) {
		this.capture = capture;
	}

	public int getBolno() {
		return bolno;
	}

	public void setBolno(int bolno) {
		this.bolno = bolno;
	}
	
	
}
