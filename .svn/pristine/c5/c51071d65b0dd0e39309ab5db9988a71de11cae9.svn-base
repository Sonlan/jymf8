package org.jymf.web;

import org.jymf.entity.Company;
import org.jymf.entity.Depict;
import org.jymf.interceptor.Token;
import org.jymf.service.ICompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {
	
	@Autowired
	private ICompanyService companyService;
	
	@RequestMapping(value = "/monitor/login")
	public String montitorLogin() {
		return "/index";
	}
	
	@RequestMapping(value = "/admin/login")
	public String adminLogin() {
		return "/index";
	}
	
	@RequestMapping(value = "/company/login")
	public String companyLogin() {
		return "/index";
	}
	
	@RequestMapping(value = "/agent/login")
	public String agentMonitorLogin() {
		return "/index";
	}
	
	@RequestMapping(value = "/companyMonitor/login")
	public String companyMonitorLogin() {
		return "/index";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "/index";
	}
	
	/**
	 * 进入进出口公司注册页面
	 */
	@RequestMapping(value = "/register",method=RequestMethod.GET)
	@Token(save=true)
	public String register(Model model) {
		model.addAttribute("result", 0);
		return "/register";
	}
	
	/**
	 * 进出口公司注册
	 */
	@RequestMapping(value = "/registerPost",method=RequestMethod.POST)
	@Token(remove=true)
	public String registerPost(Model model, Company company) {
		company.setDepict(new Depict());
		companyService.register(company);
		model.addAttribute("result", 1);
		return "/register";
	}
	
	/**
	 * 验证公司机构ID
	 */
	@RequestMapping(value = "/checkCpCode")
	@ResponseBody
	public String checkCpCode(String licenseNum) {
		if(companyService.checkCpCode(licenseNum))
			return "true";
		else
			return "false";
	}
	
	/**
	 * 验证公司名称是否有已经存在
	 */
	@RequestMapping(value = "/checkCpName")
	@ResponseBody
	public String checkCpName(String name) throws Exception{
		if(companyService.checkCpName(name))
			return "true";
		else
			return "false";
	}
}