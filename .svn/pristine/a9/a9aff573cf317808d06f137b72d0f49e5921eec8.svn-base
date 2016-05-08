package org.jymf.web.monitor;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jymf.entity.Company;
import org.jymf.entity.CompanyMonitor;
import org.jymf.service.IAreaService;
import org.jymf.service.ICompanyMonitorService;
import org.jymf.service.ICompanyService;
import org.jymf.service.ICustomsMonitorService;
import org.jymf.utils.Common;
import org.jymf.utils.MD5;
import org.jymf.utils.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 * 监管管理Controller
 * @author lxg
 * @date   2014年7月25日
 */
@Controller
@RequestMapping(value = "/monitor")
public class MonitorLoginController {
	
	@Autowired
    private ICompanyMonitorService companyMonitorService;
    
    @Autowired
	private ICompanyService companyService;
    
    @Autowired
	private IAreaService areaService;
    
    @Autowired
    private ICustomsMonitorService customsMonitorService;
    
    
    /**
     * 进入密码修改页面
     */
    @RequestMapping(value= "editPassWord")
    public String editPassWordMain(){
  		return "/monitor/editPassWord"; 
    }
    
    
    /**
     * 验证当前输入的密码是否正确
     */
    @RequestMapping(value="checkOldPwd")
	@ResponseBody
	public String checkOldPwd(HttpServletRequest request,@RequestParam("oldPwd") String oldPwd) {
    	String pwd=(String) request.getSession().getAttribute("pwd");
    	// 验证当前登陆用户的密码
		try {
			if(pwd.equals(MD5.getInstance().encrypt(oldPwd))){
				return "true";
			}else{
				return "false";
			}
		} catch (Exception e) {
			return "false";
		} 
	}
    
    /**
     * 修改代理商用户的密码,修改成功将重新返回登陆画面,重新登陆
     * @throws UnsupportedEncodingException 
     * @throws NoSuchAlgorithmException 
     */
    @RequestMapping(value = "updatePwd", method = RequestMethod.POST)
	public String updatePwd(HttpServletRequest request){
		
		// 获取登陆时的用户信息
    	CompanyMonitor aMonitor=(CompanyMonitor) request.getSession().getAttribute("companyMonitors");
    	try{
    	//获取前台新输入的密码
    	String newPwd = MD5.getInstance().encrypt(request.getParameter("newPwd"));
    	aMonitor.setPwd(newPwd);
    	companyMonitorService.updateByPrimaryKey(aMonitor);
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return "redirect:/monitor/login";
	}
    
	/**
	 * 根据监管ID ,查找企业信息
	 */
	@RequestMapping(value = "main")
	public String main(Model model, Company company,HttpServletRequest re,String pageNow,HttpSession session) {
		// 公司监管表的监管ID
		BigDecimal monitorId=(BigDecimal) re.getSession().getAttribute("monitorId");
		// 监管用户表的监管ID
		String customMonitorId = (String) re.getSession().getAttribute("customMonitorId");
		PageView pageView = null;
  		if (Common.isEmpty(pageNow)) {
  			pageView = new PageView(1);
  		} else {
  			pageView = new PageView(Integer.parseInt(pageNow));
  		}
  		company.setFlag(new BigDecimal(2));
  		company.setStatus(new BigDecimal(0));
  		
  		if(null!=company.getMonitorId()){
  			CompanyMonitor monitor = companyMonitorService.selectCompanyMonitorByLibId(company.getMonitorId().toString());
  			if(null==monitor){
  				monitorId = new BigDecimal(0);
  			}else{
  	  			monitorId = monitor.getId();
  			}
  		}
  		company.setMonitorId(company.getMonitorId() == null ?new BigDecimal(customMonitorId):company.getMonitorId());
  		pageView = companyService.queryMonitorCompany(pageView, company,monitorId.longValue());
  		model.addAttribute("pageView", pageView);
  		model.addAttribute("company", company);
  		model.addAttribute("customsMonitor", customsMonitorService.getJsonCustomsMonitor(
  				((CompanyMonitor)session.getAttribute("companyMonitors")).getMonitorLibId()));
  		
		return "/monitor/main";
	}
	    
	    
    /**
     * 进入监管部门登陆
     * @param id
     * @param model
     * @return
     * @throws UnsupportedEncodingException 
     * @throws NoSuchAlgorithmException 
     */
    @RequestMapping(value = "logins", method = RequestMethod.POST)
    public String logins(HttpServletRequest re,CompanyMonitor companyMonitor,
    					 RedirectAttributes redirectAttributes) {
    	 
    	// password：把前台得到的密码,进行加密
    	String password ="";
    	try{
    	password =  MD5.getInstance().encrypt(companyMonitor.getPwd());
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	// 根据用户名查找监管部门信息
    	CompanyMonitor companyMonitors = companyMonitorService.selectCompanyMonitor(companyMonitor.getAccount());
    	
		if(companyMonitorService.findByAccountAndPassword(companyMonitor.getAccount(),password)){
			Common.initSession(re.getSession());
			
			re.getSession().setAttribute("monitorId", companyMonitors.getId());
			
			re.getSession().setAttribute("customMonitorId", companyMonitors.getMonitorLibId());
			// 登陆成功保存当前密码,在修改密码时将用到
			re.getSession().setAttribute("pwd", password);
			// 保存当前用户
			re.getSession().setAttribute("companyMonitors", companyMonitors);
			return "/monitor/index";
		}else{
			redirectAttributes.addFlashAttribute("message", "用户名或密码错误!");
			return "redirect:/login";
		}
	}
    
    @RequestMapping(value = "logout")
	public String logout(HttpSession session){
		Common.initSession(session);
		return "redirect:/login";
	}
}
