package com.testgen.dto;

import java.util.HashMap;

public class Grade {
	private int gradeid;//成绩id
    private int userid;//用户id
    private String companyname;//应聘的公司名称
    private String companyproject;//应聘的公司项目
    private String companyposition;//应聘的公司职位
    private int score;//考试总得分
    private HashMap<Integer,Integer>question;//所有题目的得分情况
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getCompanyproject() {
		return companyproject;
	}
	public void setCompanyproject(String companyproject) {
		this.companyproject = companyproject;
	}
	public String getCompanyposition() {
		return companyposition;
	}
	public void setCompanyposition(String companyposition) {
		this.companyposition = companyposition;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public HashMap<Integer, Integer> getQuestion() {
		return question;
	}
	public void setQuestion(HashMap<Integer, Integer> question) {
		this.question = question;
	}
	public int getGradeid() {
		return gradeid;
	}
	public void setGradeid(int gradeid) {
		this.gradeid = gradeid;
	}
	
    
}
