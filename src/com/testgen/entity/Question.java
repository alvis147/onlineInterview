package com.testgen.entity;

import java.util.ArrayList;
import java.util.HashMap;

public class Question {
    private long id; //问题ID；
    private String content;//问题的名称
    private String answer;//正确答案
    private String option1;//问题的选项
    private String option2;
    private String option3;
    private String option4;
    private int level;//分四个等级   20个题，5＊2＋5＊4＋5＊6＋5＊8＝100 ，1->2，2->4，3->6，4->8
/*	private ArrayList<Technology>category;//题目所属类别，关联positionid
*/
    
	public long getId() {
		return id;
	}
	public Question(long id, String content, String answer, String option1, String option2, String option3,
		String option4, int level) {
	super();
	this.id = id;
	this.content = content;
	this.answer = answer;
	this.option1 = option1;
	this.option2 = option2;
	this.option3 = option3;
	this.option4 = option4;
	this.level = level;
}
	public void setId(long id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}  
    
	
    
}
