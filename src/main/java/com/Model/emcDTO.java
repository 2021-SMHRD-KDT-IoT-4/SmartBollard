package com.Model;

public class emcDTO {

	private int emcno;
	private String info;
	private String manager;
	private String street;
	private String ttime;
	private String lightcolor;
	private String zone;

	public emcDTO(int emcno, String info, String manager, String street, String ttime, String lightcolor, String zone) {
		
		this.emcno = emcno;
		this.info = info;
		this.manager = manager;
		this.street = street;
		this.ttime = ttime;
		this.lightcolor = lightcolor;
		this.zone = zone;
	}

	public emcDTO(String info, String manager, String street, String ttime, String zone) {
		this.info = info;
		this.manager = manager;
		this.street = street;
		this.ttime = ttime;
		this.zone = zone;
	}
	

	public int getEmcno() {
		return emcno;
	}

	public void setEmcno(int emcno) {
		this.emcno = emcno;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getTtime() {
		return ttime;
	}

	public void setTtime(String ttime) {
		this.ttime = ttime;
	}

	public String getLightcolor() {
		return lightcolor;
	}

	public void setLightcolor(String lightcolor) {
		this.lightcolor = lightcolor;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

}
