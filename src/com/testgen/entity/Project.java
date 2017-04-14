package com.testgen.entity;

import java.util.ArrayList;

public class Project  {
    private int projectid;//项目id
    private String projectname;//项目名称
    private String projectcontent;//项目内容
    private ArrayList<Position> projectposition;//项目需要的职位
    
	public int getProjectid() {
		return projectid;
	}
	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public String getProjectcontent() {
		return projectcontent;
	}
	public void setProjectcontent(String projectcontent) {
		this.projectcontent = projectcontent;
	}
	public ArrayList<Position> getProjectposition() {
		return projectposition;
	}
	public void setProjectposition(ArrayList<Position> projectposition) {
		this.projectposition = projectposition;
	}
   
}
