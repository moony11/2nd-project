package com.br.book.vo;

public class bookCriticVO {
	private String b_cr_name;
	private int b_id;
	private String b_c_comm;
	private int b_c_point;
	private int b_cr_id;
	
	public bookCriticVO() {
		super();
	}
	
	public bookCriticVO(String b_cr_name, int b_id, String b_c_comm, int b_c_point, int b_cr_id) {
		super();
		this.b_cr_name = b_cr_name;
		this.b_id = b_id;
		this.b_c_comm = b_c_comm;
		this.b_c_point = b_c_point;
		this.b_cr_id = b_cr_id;
	}

	public String getB_cr_name() {
		return b_cr_name;
	}

	public void setB_cr_name(String b_cr_name) {
		this.b_cr_name = b_cr_name;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public String getB_c_comm() {
		return b_c_comm;
	}

	public void setB_c_comm(String b_c_comm) {
		this.b_c_comm = b_c_comm;
	}

	public int getB_c_point() {
		return b_c_point;
	}

	public void setB_c_point(int b_c_point) {
		this.b_c_point = b_c_point;
	}

	public int getB_cr_id() {
		return b_cr_id;
	}

	public void setB_cr_id(int b_cr_id) {
		this.b_cr_id = b_cr_id;
	}

	@Override
	public String toString() {
		return "bookCriticVO [b_cr_name=" + b_cr_name + ", b_id=" + b_id + ", b_c_comm=" + b_c_comm + ", b_c_point="
				+ b_c_point + ", b_cr_id=" + b_cr_id + "]";
	}
	
	
}
