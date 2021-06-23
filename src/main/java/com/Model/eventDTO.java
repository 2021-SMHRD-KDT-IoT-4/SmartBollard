package com.Model;

public class eventDTO {

	private String ename;
	private String day;
	private String host;
	private String etime;
	private int people;
	private String sstreet;
	private String estreet;
	private int eno;
	
	
	
	public int getEno() {
		return eno;
	}



	public void setEno(int eno) {
		this.eno = eno;
	}



	public eventDTO(String ename, String day, String host, String etime, int people, String sstreet, String estreet, int eno) {
		super();
		this.ename = ename;
		this.day = day;
		this.host = host;
		this.etime = etime;
		this.people = people;
		this.sstreet = sstreet;
		this.estreet = estreet;
		this.eno = eno;
	}






	public eventDTO(String ename, String day, String host, String etime, int people, String sstreet, String estreet) {
		super();
		this.ename = ename;
		this.day = day;
		this.host = host;
		this.etime = etime;
		this.people = people;
		this.sstreet = sstreet;
		this.estreet = estreet;
	}



	public String getEname() {
		return ename;
	}



	public void setEname(String ename) {
		this.ename = ename;
	}



	public String getDay() {
		return day;
	}



	public void setDay(String day) {
		this.day = day;
	}



	public String getHost() {
		return host;
	}



	public void setHost(String host) {
		this.host = host;
	}



	public String getEtime() {
		return etime;
	}



	public void setEtime(String etime) {
		this.etime = etime;
	}



	public int getPeople() {
		return people;
	}



	public void setPeople(int people) {
		this.people = people;
	}



	public String getSstreet() {
		return sstreet;
	}



	public void setSstreet(String sstreet) {
		this.sstreet = sstreet;
	}



	public String getEstreet() {
		return estreet;
	}



	public void setEstreet(String estreet) {
		this.estreet = estreet;
	}
	
	
	
}
