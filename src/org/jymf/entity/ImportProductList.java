package org.jymf.entity;

import java.math.BigDecimal;

public class ImportProductList {

	private BigDecimal id;
	
	private BigDecimal productId;
	
	private BigDecimal startId;
	
	private BigDecimal endId;
	
	private Integer status;
	
	private String productName;
	
	private BigDecimal count;
	
	private BigDecimal companyId;
	
	private String hsnum;
	
	
	
	public String getHsnum() {
		return hsnum;
	}

	public void setHsnum(String hsnum) {
		this.hsnum = hsnum;
	}

	public BigDecimal getCompanyId() {
		return companyId;
	}

	public void setCompanyId(BigDecimal companyId) {
		this.companyId = companyId;
	}

	public BigDecimal getCount() {
		return count;
	}

	public void setCount(BigDecimal count) {
		this.count = count;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public BigDecimal getId() {
		return id;
	}

	public void setId(BigDecimal id) {
		this.id = id;
	}

	public BigDecimal getProductId() {
		return productId;
	}

	public void setProductId(BigDecimal productId) {
		this.productId = productId;
	}

	public BigDecimal getStartId() {
		return startId;
	}

	public void setStartId(BigDecimal startId) {
		this.startId = startId;
	}

	public BigDecimal getEndId() {
		return endId;
	}

	public void setEndId(BigDecimal endId) {
		this.endId = endId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
}
