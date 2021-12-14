package com.br.book.vo;

public class bookWriterVO {
	private int b_wr_id;
	private String b_writer;
	private String b_wr_info;
	
	public bookWriterVO() {
		super();
	}
	
	public bookWriterVO(int b_wr_id, String b_writer, String b_wr_info) {
		super();
		this.b_wr_id = b_wr_id;
		this.b_writer = b_writer;
		this.b_wr_info = b_wr_info;
	}

	public int getB_wr_id() {
		return b_wr_id;
	}

	public void setB_wr_id(int b_wr_id) {
		this.b_wr_id = b_wr_id;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public String getB_wr_info() {
		return b_wr_info;
	}

	public void setB_wr_info(String b_wr_info) {
		this.b_wr_info = b_wr_info;
	}

	@Override
	public String toString() {
		return "bookWriterVO [b_wr_id=" + b_wr_id + ", b_writer=" + b_writer + ", b_wr_info=" + b_wr_info + "]";
	}
	
	
}
