package com.br.model.vo;

public class MovieBoardVO {
	private int board_id;
	private int movie_id;
	private int member_id;
	private String subject;
	private String board_content;
	private String board_date;
	private int	hit;
	private String nickname;


	public MovieBoardVO() {
		super();
	}

	public MovieBoardVO(int board_id, int movie_id, int member_id, String subject, String board_content,
			String board_date, int hit) {
		super();
		this.board_id = board_id;
		this.movie_id = movie_id;
		this.member_id = member_id;
		this.subject = subject;
		this.board_content = board_content;
		this.board_date = board_date;
		this.hit = hit;
	}

	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "MovieBoardVO [board_id=" + board_id + ", movie_id=" + movie_id + ", member_id=" + member_id
				+ ", subject=" + subject + ", board_content=" + board_content + ", board_date=" + board_date + ", hit="
				+ hit + ", nickname=" + nickname + "]";
	}
	
	


	

	
	
	
}
