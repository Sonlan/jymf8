package org.jymf.service.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.jymf.dao.CompanyMapper;
import org.jymf.dao.MonitorCountMapper;
import org.jymf.entity.Company;
import org.jymf.entity.CompanyMonitor;
import org.jymf.entity.MonitorCount;
import org.jymf.service.IMonitorCountService;
import org.jymf.utils.ExcelUtil;
import org.jymf.utils.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("monitorCountService")
public class MonitorCountServiceImpl implements IMonitorCountService {

	@Autowired
	private MonitorCountMapper monitorCountDao;
	
	@Autowired
	private CompanyMapper companyDao;
	
	private ExcelUtil excelUtil =  new ExcelUtil();
	
	@Override
	public PageView queryByHs(PageView pageView ,MonitorCount count ,List<Company> companyList,BigDecimal workMode) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("pageView", pageView);
		map.put("t", companyList);
		map.put("count", count);
		
		List<MonitorCount> list = monitorCountDao.queryByHs(map);
		pageView.setRecords(list);
		return pageView;
	}
	@Override
	public List<MonitorCount> findAllByHs(MonitorCount count,
			List<Company> companyList, BigDecimal bigDecimal) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("t", companyList);
		map.put("count", count);
		
		List<MonitorCount> list = monitorCountDao.findAllByHs(map);
		return list;
	}
	@Override
	public void excelHs(List<MonitorCount> monitorCountList,String webRoot,
			HttpServletRequest request, HttpServletResponse response) {
		Workbook workbook = excelUtil.setHsnumCountData(monitorCountList);
		String fileName = "HS编码统计"+System.currentTimeMillis()+".xls";
		excelUtil.createFile(workbook, webRoot,fileName, request, response);
	}
	
	
	@Override
	public List<Company> findAllMonitorCompany(CompanyMonitor monitor) {
		Map<Object,Object> map = new HashMap<Object, Object>();
		map.put("monitorId", monitor.getId());
		// 总局的情况
		if ("1".equals(monitor.getMonitorLibId())) {
			map.put("companyMonitorId", "");
		// 总局以外的情况	
		} else {
			map.put("companyMonitorId", monitor.getMonitorLibId());
		}
		List<Company> companyList = companyDao.findCompanyByMonitor(map);
		return companyList;
	}


	@Override
	public PageView queryBydepartCountry(PageView pageView, MonitorCount count,
			List<Company> companyList, BigDecimal bigDecimal) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("pageView", pageView);
		map.put("t", companyList);
		map.put("count", count);
		
		List<MonitorCount> list = monitorCountDao.queryBydepartCountry(map);
		pageView.setRecords(list);
		return pageView;
	}


	@Override
	public PageView queryByArrivalPort(PageView pageView, MonitorCount count,
			List<Company> companyList, BigDecimal bigDecimal) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("pageView", pageView);
		map.put("t", companyList);
		map.put("count", count);
		
		List<MonitorCount> list = monitorCountDao.queryByArrivalPort(map);
		pageView.setRecords(list);
		return pageView;
	}


	@Override
	public PageView queryByDestAddr(PageView pageView, MonitorCount count,
			List<Company> companyList, BigDecimal bigDecimal) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("pageView", pageView);
		map.put("t", companyList);
		map.put("count", count);
		if (null == companyList || companyList.size() == 0) {
			return pageView;
		}
		List<MonitorCount> list = monitorCountDao.queryByDestAddr(map);
		pageView.setRecords(list);
		return pageView;
	}
	
	@Override
	public PageView queryByFenju(PageView pageView, MonitorCount count,
			List<Company> companyList, BigDecimal bigDecimal) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("pageView", pageView);
		map.put("t", companyList);
		map.put("count", count);
		if (null == companyList || companyList.size() == 0) {
			return pageView;
		}
		List<MonitorCount> list = monitorCountDao.queryByFenju(map);
		pageView.setRecords(list);
		return pageView;
	}
	


}
