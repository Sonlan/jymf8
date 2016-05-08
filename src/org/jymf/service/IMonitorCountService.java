package org.jymf.service;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jymf.entity.Company;
import org.jymf.entity.CompanyMonitor;
import org.jymf.entity.MonitorCount;
import org.jymf.utils.PageView;

public interface IMonitorCountService{
	
	public PageView queryByHs(PageView pageView,MonitorCount count, List<Company> companyList,BigDecimal workMode);
	
	public List<Company> findAllMonitorCompany(CompanyMonitor monitor);

	public PageView queryBydepartCountry(PageView pageView, MonitorCount count,
			List<Company> list, BigDecimal bigDecimal);

	public PageView queryByArrivalPort(PageView pageView, MonitorCount count,
			List<Company> list, BigDecimal bigDecimal);

	public PageView queryByDestAddr(PageView pageView, MonitorCount count,
			List<Company> list, BigDecimal bigDecimal);

	public List<MonitorCount> findAllByHs(MonitorCount count,
			List<Company> list, BigDecimal bigDecimal);

	public void excelHs(List<MonitorCount> monitorCountList,String webRoot,
			HttpServletRequest request, HttpServletResponse response);

	public PageView queryByFenju(PageView pageView, MonitorCount count,
			List<Company> companyList, BigDecimal bigDecimal);
}
