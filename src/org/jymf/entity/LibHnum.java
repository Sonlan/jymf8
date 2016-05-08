package org.jymf.entity;

public class LibHnum {

	private String id;
	private String productName;
	public String getId() {
		return id = null==id ? "":id.trim();
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductName() {
		return productName = null==productName ? "":productName.trim();
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	
}
