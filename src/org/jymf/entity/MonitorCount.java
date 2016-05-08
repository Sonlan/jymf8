package org.jymf.entity;

import java.math.BigDecimal;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 监管用户查询各种统计结果
 */
public class MonitorCount {

	private String hsname;
	private String hsnum;
	private String proName;
	private BigDecimal hscount;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String startDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String endDate;
    private String companyId;
    private String monitorId;
    private String monitorName;
	
    //查询参数 启运国家
    private String departCountry;
    //查询参数 到达口岸
    private String arrivalPort;
    //查询参数 目的地
    private String destAddr;
    //查询条件 监管者ID
    private CustomsMonitor monitor;
    
    
	public String getMonitorId() {
		return monitorId;
	}
	public void setMonitorId(String monitorId) {
		this.monitorId = monitorId;
	}
	public String getMonitorName() {
		return monitorName;
	}
	public void setMonitorName(String monitorName) {
		this.monitorName = monitorName;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public CustomsMonitor getMonitor() {
		return monitor;
	}
	public void setMonitor(CustomsMonitor monitor) {
		this.monitor = monitor;
	}
	public String getDestAddr() {
		return destAddr;
	}
	public void setDestAddr(String destAddr) {
		this.destAddr = destAddr;
	}
	public String getArrivalPort() {
		return arrivalPort;
	}
	public void setArrivalPort(String arrivalPort) {
		this.arrivalPort = arrivalPort;
	}
	public String getDepartCountry() {
		return departCountry;
	}
	public void setDepartCountry(String departCountry) {
		this.departCountry = departCountry;
	}
	public String getHsname() {
		return hsname;
	}
	public void setHsname(String hsname) {
		this.hsname = hsname;
	}
	public String getHsnum() {
		return hsnum;
	}
	public void setHsnum(String hsnum) {
		this.hsnum = hsnum;
	}
	public BigDecimal getHscount() {
		return hscount;
	}
	public void setHscount(BigDecimal hscount) {
		this.hscount = hscount;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
}
