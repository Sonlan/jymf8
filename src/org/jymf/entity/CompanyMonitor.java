package org.jymf.entity;

import java.math.BigDecimal;
import java.util.List;

public class CompanyMonitor {
    private BigDecimal id;

    private String name;

    private String pwd;

    private String tel;

    private BigDecimal status;

    private String account;
    
    private Integer monitorMode;
    
	/**
     * 被监管的企业列表
     */
    private List<Cmr> crms;
    
    /**
     * 监管者资源表ID
     */
    private String monitorLibId;
    
    
    
    
    public String getMonitorLibId() {
		return monitorLibId;
	}

	public void setMonitorLibId(String monitorLibId) {
		this.monitorLibId = monitorLibId;
	}

	public List<Cmr> getCrms() {
		return crms;
	}

	public void setCrms(List<Cmr> crms) {
		this.crms = crms;
	}

	public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public BigDecimal getStatus() {
        return status;
    }

    public void setStatus(BigDecimal status) {
        this.status = status;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }
    

    public Integer getMonitorMode() {
		return monitorMode;
	}

	public void setMonitorMode(Integer monitorMode) {
		this.monitorMode = monitorMode;
	}

}