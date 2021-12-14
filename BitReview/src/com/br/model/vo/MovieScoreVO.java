package com.br.model.vo;

public class MovieScoreVO {
	private int member_id;
	private int  movie_id;
	private int  movie_score;
	private int  wish;
	
	
	
	public MovieScoreVO() {}
	
	public MovieScoreVO(int member_id, int movie_id, int movie_score, int wish) {
		super();
		this.member_id = member_id;
		this.movie_id = movie_id;
		this.movie_score = movie_score;
		this.wish = wish;
	}
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public int getMovie_score() {
		return movie_score;
	}
	public void setMovie_score(int movie_score) {
		this.movie_score = movie_score;
	}
	public int getWish() {
		return wish;
	}
	public void setWish(int wish) {
		this.wish = wish;
	}
	@Override
	public String toString() {
		return "MovieScoreVO [member_id=" + member_id + ", movie_id=" + movie_id + ", movie_score=" + movie_score
				+ ", wish=" + wish + "]";
	}
	
	
	
	
	
}
