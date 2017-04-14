package com.testgen.entity;

public class ErrorAnswer {
	private String question;
	private String correctAnswer;
	
	
	public ErrorAnswer(String question, String correctAnswer) {
		super();
		this.question = question;
		this.correctAnswer = correctAnswer;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getCorrectAnswer() {
		return correctAnswer;
	}
	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}
	
	
}
