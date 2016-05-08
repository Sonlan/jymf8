package org.jymf.web.monitor;

import java.math.BigDecimal;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jymf.entity.Company;
import org.jymf.entity.CompanyMonitor;
import org.jymf.entity.MonitorCount;
import org.jymf.service.IAreaService;
import org.jymf.service.ICompanyMonitorService;
import org.jymf.service.ICompanyService;
import org.jymf.service.ICustomsMonitorService;
import org.jymf.service.IMonitorCountService;
import org.jymf.utils.Common;
import org.jymf.utils.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/monitor/count")
public class MonitorCountController {

	@Autowired
	private IMonitorCountService monitorCountService;
	
	@Autowired
	private IAreaService areaService;	
	
	@Autowired
	private ICustomsMonitorService customsMonitorService;
	
	@Autowired
	private ICompanyMonitorService companyMonitorService;
	
	@Resource
	private ICompanyService companyService;
	
	@RequestMapping("hs")
	public String initHs(MonitorCount count,HttpSession session, Model model){
		PageView pageView = new PageView(1);
		CompanyMonitor monitor = (CompanyMonitor) session.getAttribute("companyMonitors");
		List<Company> list = monitorCountService.findAllMonitorCompany(monitor);
		count.setStartDate(Common.yesterdayModthFirstday());
		count.setEndDate(Common.yesterday());
		if (null != list && list.size() > 0) {
			pageView = monitorCountService.queryByHs(pageView,count, list,new BigDecimal(8));
		}
		model.addAttribute("pageView", pageView);
		model.addAttribute("count", count);
		return "/monitor/count/hs";
	}
	
	@RequestMapping("queryHs")
	public String queryHs(MonitorCount count,HttpServletRequest request,HttpSession session, String pageNow, Model model){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView=new PageView(1);
		}else{
			pageView=new PageView(Integer.parseInt(pageNow));
		}
		CompanyMonitor monitor = (CompanyMonitor) session.getAttribute("companyMonitors");
		List<Company> list = monitorCountService.findAllMonitorCompany(monitor);
		if (null != list && list.size() > 0) {
			pageView = monitorCountService.queryByHs(pageView,count, list,new BigDecimal(8));
		}
		model.addAttribute("pageView", pageView);
		model.addAttribute("count", count);
		return "/monitor/count/hs";
	}
	
	@RequestMapping("excelHs")
	public void excelHs(HttpSession session,MonitorCount count,HttpServletRequest request,HttpServletResponse response){
		CompanyMonitor monitor = (CompanyMonitor) session.getAttribute("companyMonitors");
		List<Company> list = monitorCountService.findAllMonitorCompany(monitor);
		List<MonitorCount> MonitorCountList = monitorCountService.findAllByHs(count, list,new BigDecimal(8));
		
		String webRoot = session.getServletContext().getRealPath("/");
		monitorCountService.excelHs(MonitorCountList,webRoot,request,response);
		
	}
	
	
	@RequestMapping("departCountry")
	public String departCountry(MonitorCount count,HttpSession session, Model model){
		PageView pageView = new PageView(1);
		CompanyMonitor monitor = (CompanyMonitor) session.getAttribute("companyMonitors");
		List<Company> list = monitorCountService.findAllMonitorCompany(monitor);
		count.setStartDate(Common.yesterdayModthFirstday());
		count.setEndDate(Common.yesterday());
		if (null != list && list.size() > 0) {
			pageView = monitorCountService.queryBydepartCountry(pageView,count, list,new BigDecimal(8));
		}
		model.addAttribute("pageView", pageView);
		model.addAttribute("count", count);
		model.addAttribute("worldAreas", areaService.findWorldArea());
		return "/monitor/count/departCountry";
	}

	@RequestMapping("queryDepartCountry")
	public String queryDepartCountry(MonitorCount count,HttpSession session,String pageNow, Model model){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView=new PageView(1);
		}else{
			pageView=new PageView(Integer.parseInt(pageNow));
		}
		CompanyMonitor monitor = (CompanyMonitor) session.getAttribute("companyMonitors");
		List<Company> list = monitorCountService.findAllMonitorCompany(monitor);
		if (null != list && list.size() > 0) {
			pageView = monitorCountService.queryBydepartCountry(pageView,count, list,new BigDecimal(8));
		}
		model.addAttribute("pageView", pageView);
		model.addAttribute("count", count);
		model.addAttribute("worldAreas", areaService.findWorldArea());
		return "/monitor/count/departCountry";
	}
	
	@RequestMapping("arrivalPort")
	public String arrivalPort(MonitorCount count,HttpSession session, Model model){
		PageView pageView = new PageView(1);
		CompanyMonitor monitor = (CompanyMonitor) session.getAttribute("companyMonitors");
		List<Company> list = monitorCountService.findAllMonitorCompany(monitor);
		count.setStartDate(Common.yesterdayModthFirstday());
		count.setEndDate(Common.yesterday());
		if (null != list && list.size() > 0) {
			pageView = monitorCountService.queryByArrivalPort(pageView,count, list,new BigDecimal(8));
		}
		model.addAttribute("pageView", pageView);
		model.addAttribute("count", count);
		model.addAttribute("ports", areaService.findPort());
		return "/monitor/count/arrivalPort";
	}
	@RequestMapping("queryArrivalPort")
	public String queryArrivalPort(MonitorCount count,HttpSession session,String pageNow, Model model){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView=new PageView(1);
		}else{
			pageView=new PageView(Integer.parseInt(pageNow));
		}
		CompanyMonitor monitor = (CompanyMonitor) session.getAttribute("companyMonitors");
		List<Company> list = monitorCountService.findAllMonitorCompany(monitor);
		if (null != list && list.size() > 0) {
			pageView = monitorCountService.queryByArrivalPort(pageView,count, list,new BigDecimal(8));
		}
		model.addAttribute("pageView", pageView);
		model.addAttribute("count", count);
		model.addAttribute("ports", areaService.findPort());
		return "/monitor/count/arrivalPort";
	}
	
	
	@RequestMapping("destAddr")
	public String destAddr(MonitorCount count,HttpSession session, Model model){
		PageView pageView = new PageView(1);
		CompanyMonitor monitor = (CompanyMonitor) session.getAttribute("companyMonitors");
		List<Company> list = monitorCountService.findAllMonitorCompany(monitor);
		count.setStartDate(Common.yesterdayModthFirstday());
		count.setEndDate(Common.yesterday());
		if (null != list && list.size() > 0) {
			pageView = monitorCountService.queryByDestAddr(pageView,count, list,new BigDecimal(8));
		}
		model.addAttribute("pageView", pageView);
		model.addAttribute("count", count);
		model.addAttribute("cities", areaService.findCity());
		return "/monitor/count/destAddr";
	}
	@RequestMapping("queryDestAddr")
	public String queryDestAddr(MonitorCount count,HttpSession session,String pageNow, Model model){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView=new PageView(1);
		}else{
			pageView=new PageView(Integer.parseInt(pageNow));
		}
		CompanyMonitor monitor = (CompanyMonitor) session.getAttribute("companyMonitors");
		List<Company> list = monitorCountService.findAllMonitorCompany(monitor);
		if (null != list && list.size() > 0) {
			pageView = monitorCountService.queryByDestAddr(pageView,count, list,new BigDecimal(8));
		}
		model.addAttribute("pageView", pageView);
		model.addAttribute("count", count);
		model.addAttribute("cities", areaService.findCity());
		return "/monitor/count/destAddr";
	}
	
	/**
	 * 以分局来统计
	 * @param count
	 * @param session
	 * @param re
	 * @param model
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("customsMonitor")
	public String customsMonitor(MonitorCount count,HttpSession session, HttpServletRequest re, Model model){
		PageView pageView = new PageView(1);
		CompanyMonitor monitor = (CompanyMonitor) session.getAttribute("companyMonitors");
		List<Company> list = monitorCountService.findAllMonitorCompany(monitor);
		Map<BigDecimal, String> map = new HashMap<BigDecimal, String>();
		for(Company com : list) {
			map.put(com.getId(), com.getMonitorId()+"_"+com.getMonitorName());
		}
		count.setStartDate(Common.yesterdayModthFirstday());
		count.setEndDate(Common.yesterday());
		if (null != list && list.size() > 0) {
			pageView = monitorCountService.queryByFenju(pageView,count, list,new BigDecimal(8));
		}
		Iterator<?> iter = map.entrySet().iterator(); 
		if (null != pageView.getRecords() && !pageView.getRecords().isEmpty()){
			List<MonitorCount> list1 = pageView.getRecords();
			while(iter.hasNext()) {
				Entry entry = (Entry) iter.next(); 
				Object key = entry.getKey();
				String val = (String)entry.getValue(); 
				for(MonitorCount obj : list1) {
					if (obj.getCompanyId().equals(key.toString())) {
						obj.setMonitorId(val.split("_")[0]);
						obj.setMonitorName(val.split("_")[1]);
					}
				}
			}
			sort(list1);
		}
		model.addAttribute("pageView", pageView);
		model.addAttribute("count", count);
		model.addAttribute("customsMonitor", customsMonitorService.getJsonCustomsMonitor(monitor.getMonitorLibId()));
		return "/monitor/count/customsMonitor";
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("queryCustomsMonitor")
	public String queryCustomsMonitor(MonitorCount count,HttpSession session,String pageNow, Model model){
		PageView pageView = null;
		if(Common.isEmpty(pageNow)){
			pageView=new PageView(1);
		}else{
			pageView=new PageView(Integer.parseInt(pageNow));
		}
		
		CompanyMonitor monitor = null;
		//
		if(count.getMonitor().getId().equals("")){
			monitor=(CompanyMonitor) session.getAttribute("companyMonitors");
		}else{
			monitor= companyMonitorService.selectCompanyMonitorByLibId(count.getMonitor().getId());
		}
		//如无数据,模拟空值
		if(null==monitor){
			List<MonitorCount> list = new ArrayList<MonitorCount>();
			count.setHsname("");
			count.setHsnum("");
			count.setHscount(new BigDecimal(0));
			for(int i=0;i<10;i++){
				list.add(count);
			}
			pageView.setRecords(list);
		}else{
			List<Company> list = monitorCountService.findAllMonitorCompany(monitor);
			Map<BigDecimal, String> map = new HashMap<BigDecimal, String>();
			
			// 	地市级监管局
			if ("2".equals(count.getMonitor().getpId())) {
				for(Company com : list) {
					if (count.getMonitor().getName().equals(com.getMonitorName())) {
						map.put(com.getId(), com.getMonitorId()+"_"+com.getMonitorName());
					}
				}
			// 省一级监管局和国家局
			} else {
				for(Company com : list) {
					map.put(com.getId(), com.getMonitorId()+"_"+com.getMonitorName());
				}
			}
			
			if (null != list && list.size() > 0) {
				pageView = monitorCountService.queryByFenju(pageView,count, list,new BigDecimal(8));
			}
			Iterator<?> iter = map.entrySet().iterator(); 
			if (null != pageView.getRecords() && !pageView.getRecords().isEmpty()){
				List<MonitorCount> list1 = pageView.getRecords();
				while(iter.hasNext()) {
					Entry entry = (Entry) iter.next();
					Object key = entry.getKey();
					String val = (String)entry.getValue(); 
					for(MonitorCount obj : list1) {
						if (obj.getCompanyId().equals(key.toString())) {
							obj.setMonitorId(val.split("_")[0]);
							obj.setMonitorName(val.split("_")[1]);
						}
					}
				}
				sort(list1);
			}
		}
		model.addAttribute("pageView", pageView);
		model.addAttribute("count", count);
		model.addAttribute("customsMonitor", customsMonitorService.getJsonCustomsMonitor(
				((CompanyMonitor) session.getAttribute("companyMonitors")).getMonitorLibId()));
		return "/monitor/count/customsMonitor";
	}
	
	/**
	 * 按照监管名和HS编码排序
	 * @param list
	 */
	public static void sort(List<MonitorCount> list) {
		
		Comparator<MonitorCount> cmp = new Comparator<MonitorCount>() {  
			  
		    public int compare(MonitorCount o1, MonitorCount o2) {  
		        Comparator<Object> cmp = Collator.getInstance(java.util.Locale.CHINA);  
		  
		        String[] strs1 = new String[2];  
		        strs1[0] = o1.getMonitorName();  
		        strs1[1] = o2.getMonitorName();  
		  
		        String[] strs2 = new String[2];  
		        strs2[0] = o1.getHsnum(); 
		        strs2[1] = o2.getHsnum();
		  
		        Arrays.sort(strs1, cmp);
		        Arrays.sort(strs2, cmp); 
		  
		        if (strs1[0].equals(strs1[1])) {
		            if (strs2[0].equals(strs2[1])) {  
		                return 0;  
		            }
		            if (strs2[0].equals(o1.getHsnum())) {  
		                return -1;
		            } else {
		                return 1;  
		            }
		        } else {
		            if (strs1[0].equals(o1.getMonitorName())) {  
		                return -1;
		            } else if (strs1[0].equals(o2.getMonitorName())) {  
		                return 1;  
		            }  
		        }  
		        return 0;  
		    }  
		}; 
		Collections.sort(list, cmp); 
		
	}
}
