package com.app.utils;

public class SecurityQuestions {
	
	private String questionNo;
	
	private String questionName;

	public SecurityQuestions(String questionNo, String questionName) {
		super();
		this.questionNo = questionNo;
		this.questionName = questionName;
	}

	public String getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(String questionNo) {
		this.questionNo = questionNo;
	}

	public String getQuestionName() {
		return questionName;
	}

	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}

	@Override
	public String toString() {
		return "SecurityQuestions [questionNo=" + questionNo + ", questionName=" + questionName + "]";
	}
	
	

}
