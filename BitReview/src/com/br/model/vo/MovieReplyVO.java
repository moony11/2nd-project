package com.br.model.vo;

public class MovieReplyVO {
	private int reply_id;
	private int board_id;
	private int member_id;
	private String reply_content;
	private String reply_date;
	private String nickname;
	
	public MovieReplyVO() {
		super();
	}
	
	public MovieReplyVO(int reply_id, int board_id, int member_id, String reply_content, String reply_date) {
		super();
		this.reply_id = reply_id;
		this.board_id = board_id;
		this.member_id = member_id;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
	}
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	
	
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "MovieReply [reply_id=" + reply_id + ", board_id=" + board_id + ", member_id=" + member_id
				+ ", reply_content=" + reply_content + ", reply_date=" + reply_date + "]";
	}
	
	
	
}


