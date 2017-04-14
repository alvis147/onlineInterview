package com.testgen.entity;

public class Accuracy {
	private long id;
	private String accuracy;
	public Accuracy(long id, String accuracy) {
		super();
		this.id = id;
		this.accuracy = accuracy;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getAccuracy() {
		return accuracy;
	}
	public void setAccuracy(String accuracy) {
		this.accuracy = accuracy;
	}
	
	
}
