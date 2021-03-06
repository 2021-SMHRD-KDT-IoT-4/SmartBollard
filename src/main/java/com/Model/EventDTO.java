package com.Model;

public class EventDTO {	// 축제및 집회 일정 관련 DTO

	private int eno;
	private String ename;
	private String day;
	private String host;
	private String etime;
	private int people;
	private String sstreet;
	private String estreet;
	
	
	
	public int getEno() {
		return eno;
	}



	public void setEno(int eno) {
		this.eno = eno;
	}



	public EventDTO(int eno, String ename, String day, String host, String etime, int people, String sstreet, String estreet) {
		this.eno = eno;
		this.ename = ename;
		this.day = day;
		this.host = host;
		this.etime = etime;
		this.people = people;
		this.sstreet = sstreet;
		this.estreet = estreet;
	}






	public EventDTO(String ename, String day, String host, String etime, int people, String sstreet, String estreet) {
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
