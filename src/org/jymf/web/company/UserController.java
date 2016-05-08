package org.jymf.web.company;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jymf.entity.CompanyUser;
import org.jymf.service.IAuthorityService;
import org.jymf.service.ICompanyUserService;
import org.jymf.service.impl.BusinessLogger;
import org.jymf.utils.Common;
import org.jymf.utils.Constants;
import org.jymf.utils.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 企业用户管理Controller
 * @author cqs
 * @date   2014年7月15日
 */
@Controller
@RequestMapping(value = "/company/user")
public class UserController{
	
	@Autowired
	private ICompanyUserService companyUserService;
	
	@Autowired
	private BusinessLogger businessLogger;
	
	@Autowired
	private IAuthorityService authorityService;
	
	/**
	 * 进入企业用户一览显示画面
	 * @return
	 */
	@RequestMapping(value = "main")
	public String init(Model model, CompanyUser user,HttpSession session) {
		PageView pageView = new PageView(1);
		CompanyUser companyUser = (CompanyUser)session.getAttribute(Constants.SESSION_COMPANY_USER);
		user.setCompanyId(companyUser.getCompanyId());
		user.setId(companyUser.getId());
		pageView = companyUserService.query(pageView, user);
		model.addAttribute("pageView", pageView);
		model.addAttribute("user", user);
		
        return "/company/user/main";
	}
	
	/**
	 * 检索查询
     * @param model
     * 存放返回界面的model
     * @return
     */
    @RequestMapping("query")
    public String query(Model model, CompanyUser user, String pageNow,HttpSession session) {
        PageView pageView = null;
        if (Common.isEmpty(pageNow)) {
            pageView = new PageView(1);
        } else {
            pageView = new PageView(Integer.parseInt(pageNow));
        }
        CompanyUser companyUser = (CompanyUser)session.getAttribute(Constants.SESSION_COMPANY_USER);
        user.setCompanyId(companyUser.getCompanyId());
        user.setId(companyUser.getId());
        pageView = companyUserService.query(pageView, user);
        model.addAttribute("pageView", pageView);
        model.addAttribute("user", user);
        
        //头部样式变换条件
      	model.addAttribute("mode", companyUser.getWorkMode());
        
        return "/company/user/main";
    }

	/**
	 * 进入企业用户添加画面
	 * @return
	 */
	@RequestMapping(value = "add")
	public String add(Map<String, Object> map,Model model,HttpSession session) {
		Map<Integer, String> authorityMap = new HashMap<Integer, String>(); 
		authorityMap.put(0, "领导用户"); 
		authorityMap.put(1, "普通用户");
		map.put("authorityMap", authorityMap);
		
		CompanyUser user = new CompanyUser();
		map.put("user", user);
		
		//取到当前用户所有的权限
		CompanyUser companyUser = (CompanyUser)session.getAttribute(Constants.SESSION_COMPANY_USER);
		Map<String,Object> map1 = new HashMap<String, Object>();
		map1.put("userId", companyUser.getId());
		map1.put("authType", 1);
		model.addAttribute("rights", authorityService.jsonAuthority(map1));
        return "/company/user/add";
	}
	
	/**
	 * 将企业用户添加画面，添加的内容写入数据库
	 * @param company
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="add", method = RequestMethod.POST)
	public String add(CompanyUser user, HttpSession session, HttpServletRequest request) {
		CompanyUser companyUser = (CompanyUser)session.getAttribute(Constants.SESSION_COMPANY_USER);
		user.setCompanyId(companyUser.getCompanyId());
		user.setAuthority(new BigDecimal(1));
		companyUserService.add(user);
		String logStr = String.format("UserId:%s,Authority:%s", user.getId(), user.getAuthority());
		businessLogger.log("companyUser_add", companyUser.getId(), user.getCompanyId(), logStr,user);
		
		//用户权限信息
		String auth = request.getParameter("auth");
		String[] authArr = auth.split("#");
		authorityService.addAuthority(authArr,user.getId(),1);
		
		
        return "redirect:/company/user/main";
	}
    
    /**
     * 进入企业用户更新画面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") String id, Map<String, Object> map,Model model, HttpSession session) {
    	CompanyUser companyUser = (CompanyUser)session.getAttribute(Constants.SESSION_COMPANY_USER);
    	CompanyUser user = companyUserService.findById(String.format("%s_%s",id,companyUser.getCompanyId()));
    	user.setId(id);
    	map.put("user", user);
	    String logStr = String.format("UserId:%s,Authority:%s,Status:%s",
                                      user.getId(),
                                      user.getAuthority(),
                                      user.getStatus());
	    
        businessLogger.log("companyUser_update_before",logStr,user);
       
        //取到当前用户所有的权限
  		Map<String,Object> map1 = new HashMap<String, Object>();
  		map1.put("userId", companyUser.getId());
  		map1.put("authType", 1);
  		model.addAttribute("allRights", authorityService.jsonAuthority(map1));
  		
  		//用户的使用状态
		Map<Integer, String> flagMap = new HashMap<Integer, String>(); 
		flagMap.put(0, "启用");
		flagMap.put(1, "禁用"); 
		map.put("flagMap", flagMap);
        
  		Map<String,Object> map2 = new HashMap<String, Object>();
  		map2.put("userId", id+"_"+companyUser.getCompanyId());
  		map2.put("authType", 1);
  		model.addAttribute("userRights", authorityService.jsonAuthority(map2));
  		
     	return "company/user/edit";
    }
    
	/**
	 * 更新企业用户信息
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(CompanyUser user, HttpSession session,HttpServletRequest request) {
		CompanyUser companyUser = (CompanyUser)session.getAttribute(Constants.SESSION_COMPANY_USER);
		user.setId(String.format("%s_%s", user.getId(),companyUser.getCompanyId()));
	    companyUserService.update(user, "");// 修改时企业管理员不能修改账户的密码
	    String logStr = String.format("Authority:%s,Status:%s", user.getAuthority(), user.getStatus());
        businessLogger.log("companyUser_update", companyUser.getId(), companyUser.getCompanyId(), logStr,user);
		
        //用户权限信息
  		String auth = request.getParameter("auth");
  		String[] authArr = auth.split("#");
  		authorityService.addAuthority(authArr,user.getId(),1);
        
        return "redirect:/company/user/main";
	}
	
	/**
	 * 检测输入的企业用户ID是否重复
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "checkId")
	@ResponseBody
	public String checkId(@RequestParam("id") String id, HttpSession session) {
		CompanyUser companyUser = (CompanyUser)session.getAttribute(Constants.SESSION_COMPANY_USER);
		String userId=String.format("%s_%s", id,companyUser.getCompanyId());
		
		companyUser = companyUserService.findById(userId);
		
		if (null == companyUser) {
			return "true";
		}else{
			return "false";
		}
	}
	
    /**
     * 进入企业用户更新画面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "initPwd/{id}", method = RequestMethod.GET)
    public String initPwd(@PathVariable("id") String id, HttpSession session) {
    	CompanyUser companyUser = (CompanyUser)session.getAttribute(Constants.SESSION_COMPANY_USER);
    	CompanyUser user = new CompanyUser();
    	user.setId(String.format("%s_%s", id,companyUser.getCompanyId()));
    	companyUserService.update(user, "123456");
    	
    	String logStr = String.format("UserId:%s,密码初始化。", user.getId());
    	
        businessLogger.log("companyUser_pwd_init", logStr,user);
       
        return "redirect:/company/user/main";
    }
}
