package com.br.book.vo;

public class bookStoreVO {
	private int b_id;
	private String b_store;
	private int b_price;
	private int b_store_id;
	
	public bookStoreVO() {
		super();
	}
	public bookStoreVO(int b_id, String b_store, int b_price, int b_store_id) {
		super();
		this.b_id = b_id;
		this.b_store = b_store;
		this.b_price = b_price;
		this.b_store_id = b_store_id;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_store() {
		return b_store;
	}
	public void setB_store(String b_store) {
		this.b_store = b_store;
	}
	public int getB_price() {
		return b_price;
	}
	public void setB_price(int b_price) {
		this.b_price = b_price;
	}
	public int getB_store_id() {
		return b_store_id;
	}
	public void setB_store_id(int b_store_id) {
		this.b_store_id = b_store_id;
	}
	@Override
	public String toString() {
		return "bookStoreVO [b_id=" + b_id + ", b_store=" + b_store + ", b_price=" + b_price + ", b_store_id="
				+ b_store_id + "]";
	}
	
	
}
