package com.br.book.vo;

public class bookVO {
	private int b_id;
	private String b_wr_id;
	private String b_category;
	private String b_name;
	private String b_info;
	private String b_index;
	
	public bookVO() {
		super();
	}

	public bookVO(int b_id, String b_wr_id, String b_category, String b_name, String b_info, String b_index) {
		super();
		this.b_id = b_id;
		this.b_wr_id = b_wr_id;
		this.b_category = b_category;
		this.b_name = b_name;
		this.b_info = b_info;
		this.b_index = b_index;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public String getB_wr_id() {
		return b_wr_id;
	}

	public void setB_wr_id(String b_wr_id) {
		this.b_wr_id = b_wr_id;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_info() {
		return b_info;
	}

	public void setB_info(String b_info) {
		this.b_info = b_info;
	}

	public String getB_index() {
		return b_index;
	}

	public void setB_index(String b_index) {
		this.b_index = b_index;
	}

	@Override
	public String toString() {
		return "bookVO [b_id=" + b_id + ", b_wr_id=" + b_wr_id + ", b_category=" + b_category + ", b_name=" + b_name + "]";
	}
	
}
