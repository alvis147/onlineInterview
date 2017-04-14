package com.testgen.entity;
import java.util.ArrayList;

public class Company {
    private int companyid;//公司id
    private String companyname;//公司名称
    private String companyaddress;//公司地址
    private String companytelephone;//公司电话
    private ArrayList<Project> companyproject;//公司项目
	public int getCompanyid() {
		return companyid;
	}
	public void setCompanyid(int companyid) {
		this.companyid = companyid;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getCompanyaddress() {
		return companyaddress;
	}
	public void setCompanyaddress(String companyaddress) {
		this.companyaddress = companyaddress;
	}
	public String getCompanytelephone() {
		return companytelephone;
	}
	public void setCompanytelephone(String companytelephone) {
		this.companytelephone = companytelephone;
	}
	public ArrayList<Project> getCompanyProject() {
		return companyproject;
	}
	public void setCompanyProject(ArrayList<Project> companyProject) {
		this.companyproject = companyProject;
	}
    
}
