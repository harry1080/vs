package com.vshow.control.data;

public class CountPeopleData extends PublicData{

	private int id;
	private String countDate;
	private int countPeople;
	private String mark;
	private String countPeopleDetails;
	private String btime;
	private String etime;
	private String name;
	private int uid;
	private String mac;
	
	
	
	
	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getBtime() {
		return btime;
	}

	public void setBtime(String btime) {
		this.btime = btime;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	private String ip;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCountDate() {
		return countDate;
	}

	public void setCountDate(String countDate) {
		this.countDate = countDate;
	}

	public int getCountPeople() {
		return countPeople;
	}

	public void setCountPeople(int countPeople) {
		this.countPeople = countPeople;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getCountPeopleDetails() {
		return countPeopleDetails;
	}

	public void setCountPeopleDetails(String countPeopleDetails) {
		this.countPeopleDetails = countPeopleDetails;
	}

}
