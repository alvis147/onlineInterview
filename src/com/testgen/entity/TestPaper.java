package com.testgen.entity;

import java.util.HashMap;

public class TestPaper {
    private int testpaperid; //试卷id
    private HashMap<Integer,Question>allquestion;//试卷的所有题目
	public int getTestpaperid() {
		return testpaperid;
	}
	public void setTestpaperid(int testpaperid) {
		this.testpaperid = testpaperid;
	}
	public HashMap<Integer, Question> getAllquestion() {
		return allquestion;
	}
	public void setAllquestion(HashMap<Integer, Question> allquestion) {
		this.allquestion = allquestion;
	}
    
}
