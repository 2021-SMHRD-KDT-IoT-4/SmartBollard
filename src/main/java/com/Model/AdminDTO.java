package com.Model;

public class AdminDTO {		// 관리자 관련 DTO

	private String id;
	private String pw;
	private String name;
	private String zone;
	private String police;
	
	public AdminDTO(String id, String pw, String name, String zone, String police) {
		
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.zone = zone;
		this.police = police;
	}

	public AdminDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getPolice() {
		return police;
	}

	public void setPolice(String police) {
		this.police = police;
	}
	
	
	
	
	
	
}
