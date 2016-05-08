package org.jymf.entity;

import java.math.BigDecimal;
import java.util.Date;

public class LabelIndex {
	private BigDecimal id;
	
	private BigDecimal status;

    private BigDecimal companyId;

    private BigDecimal startTid;

    private BigDecimal endTid;

    /**
     * 所属企业名称
     */
    private String name;
    
    /**
     * 标签个数
     */
    private BigDecimal count;
    
    /**
     * 追溯模式
     */
    private BigDecimal workMode;
    
    /**
     * 创建时间
     */
    private Date createDate;
    
    
    private BigDecimal productId;
    
    private String productName;
    
    /**
     * 已使用量
     */
    private BigDecimal useCount;
    
    /**
     * 剩余数量
     */
    private BigDecimal finalCount;
   

	public BigDecimal getFinalCount() {
		return finalCount;
	}

	public void setFinalCount(BigDecimal finalCount) {
		this.finalCount = finalCount;
	}

	public BigDecimal getUseCount() {
		return useCount;
	}

	public void setUseCount(BigDecimal useCount) {
		this.useCount = useCount;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public BigDecimal getProductId() {
		return productId;
	}

	public void setProductId(BigDecimal productId) {
		this.productId = productId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public BigDecimal getWorkMode() {
		return workMode;
	}

	public void setWorkMode(BigDecimal workMode) {
		this.workMode = workMode;
	}

	public BigDecimal getId() {
		return id;
	}

	public void setId(BigDecimal id) {
		this.id = id;
	}

    
	public BigDecimal getStatus() {
        return status;
    }

    public void setStatus(BigDecimal status) {
        this.status = status;
    }

    public BigDecimal getCompanyId() {
        return companyId;
    }

    public void setCompanyId(BigDecimal companyId) {
        this.companyId = companyId;
    }

    public BigDecimal getStartTid() {
        return startTid;
    }

    public void setStartTid(BigDecimal startTid) {
        this.startTid = startTid;
    }

    public BigDecimal getEndTid() {
        return endTid;
    }

    public void setEndTid(BigDecimal endTid) {
        this.endTid = endTid;
    }
    
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getCount() {
		return count;
	}

	public void setCount(BigDecimal count) {
		this.count = count;
	}

}