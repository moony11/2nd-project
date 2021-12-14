package com.br.book.vo;

public class bookScoreVO {
	private int member_id;
	private int b_id;
	private int book_score;
	
	public bookScoreVO() {
		super();
	}
	
	public bookScoreVO(int member_id, int b_id, int book_score) {
		super();
		this.member_id = member_id;
		this.b_id = b_id;
		this.book_score = book_score;
	}
	
	public bookScoreVO(int member_id, int b_id) {
		this.member_id = member_id;
		this.b_id = b_id;
	}
	
	public int getMember_id() {
		return member_id;
	}
	
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	
	public int getB_id() {
		return b_id;
	}
	
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	
	public int getBook_score() {
		return book_score;
	}
	
	public void setBook_score(int book_score) {
		this.book_score = book_score;
	}
	
	@Override
	public String toString() {
		return "bookScoreVO [member_id=" + member_id + ", b_id=" + b_id + ", book_score=" + book_score + "]";
	}
	
	
}
