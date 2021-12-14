package com.br.book.vo;

public class bookReviewVO {
	private int r_id;
	private int b_id;
	private int member_id;
	private String nickname;
	private String sp_comm;
	
	public bookReviewVO() {
		super();
	}
	public bookReviewVO(int r_id, int b_id, int member_id, String nickname, String sp_comm) {
		super();
		this.r_id = r_id;
		this.b_id = b_id;
		this.member_id = member_id;
		this.nickname = nickname;
		this.sp_comm = sp_comm;
	}
	
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSp_comm() {
		return sp_comm;
	}
	public void setSp_comm(String sp_comm) {
		this.sp_comm = sp_comm;
	}
	
	@Override
	public String toString() {
		return "bookReviewVO [r_id=" + r_id + ", b_id=" + b_id + ", member_id=" + member_id + ", nickname=" + nickname
				+ ", sp_comm=" + sp_comm + "]";
	}
	
}
