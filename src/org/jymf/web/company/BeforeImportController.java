package org.jymf.web.company;

import java.math.BigDecimal;
import java.text.ParseException;

import javax.servlet.http.HttpSession;

import org.jymf.entity.CompanyUser;
import org.jymf.entity.ImportPlan;
import org.jymf.service.IAreaService;
import org.jymf.service.IImportPlanService;
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

@Controller
@RequestMapping(value = "/company/beforeImport")
public class BeforeImportController {
    @Autowired
    private IImportPlanService iImportPlanService;
    
    @Autowired
    private IAreaService areaService;
    
    @Autowired
    private BusinessLogger businessLogger;
    
    @RequestMapping(value = "main")
    public String init(Model model, ImportPlan plan,HttpSession session) throws ParseException {
		PageView pageView = new PageView(1);
		
		CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
		pageView = iImportPlanService.query(pageView, plan,companyUser.getCompanyId(), companyUser.getWorkMode());
		
		model.addAttribute("pageView", pageView);
		model.addAttribute("ImportPlan", plan);
		model.addAttribute("shippingType", Constants.shippingType);
		
        return "/company/beforeImport/main";
    }

    @RequestMapping(value="query")
    public String query(Model model, ImportPlan plan,HttpSession session,String pageNow) throws ParseException{
    	 PageView pageView = null;
         if (Common.isEmpty(pageNow)) {
             pageView = new PageView(1);
         } else {
             pageView = new PageView(Integer.parseInt(pageNow));
         }
         CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
         pageView = iImportPlanService.query(pageView, plan,companyUser.getCompanyId(), companyUser.getWorkMode());
         model.addAttribute("pageView", pageView);
         model.addAttribute("shippingType", Constants.shippingType);
         model.addAttribute("plan", plan);
    	 return "/company/beforeImport/main";
    }
    
    @RequestMapping(value="add",method=RequestMethod.GET)
    public String add(Model model,HttpSession session){
    	
    	CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
    	model.addAttribute("companyId", companyUser.getCompanyId());
    	model.addAttribute("shippingType", Constants.shippingType);
    	model.addAttribute("cities", areaService.findCity());
    	model.addAttribute("ports", areaService.findPort());
    	model.addAttribute("worldAreas", areaService.findWorldArea());
    	
    	return "/company/beforeImport/add";
    }
    
    
    @RequestMapping(value="add",method=RequestMethod.POST)
    public String add(ImportPlan plan,HttpSession session,Model model){
    	
    	CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
    	model.addAttribute("companyId", companyUser.getCompanyId());
    	plan.setCreateUser(companyUser.getId());
    	iImportPlanService.add(plan,companyUser,companyUser.getWorkMode());
    	
    	return "redirect:/company/beforeImport/main";
    }
    
    @RequestMapping(value="update/{id}",method=RequestMethod.GET)
    public String update(@PathVariable("id")String id,Model model,HttpSession session) throws ParseException{
    	CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
    	model.addAttribute("companyId", companyUser.getCompanyId());
    	
    	ImportPlan plan = new ImportPlan();
    	plan.setId(new BigDecimal(id));
    	
    	plan = iImportPlanService.findPlan(plan,companyUser,companyUser.getWorkMode());
    	model.addAttribute("plan", plan);
    	model.addAttribute("shippingType", Constants.shippingType);
    	model.addAttribute("cities", areaService.findCity());
    	model.addAttribute("ports", areaService.findPort());
    	model.addAttribute("worldAreas", areaService.findWorldArea());
    	
    	return "/company/beforeImport/edit";
    }
    
    @RequestMapping(value="update",method=RequestMethod.POST)
    public String update(ImportPlan plan,HttpSession session){
    	
    	CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
    	plan.setCompanyId(companyUser.getCompanyId());
    	iImportPlanService.update(plan,companyUser.getWorkMode());
    	
    	return "redirect:/company/beforeImport/main";
    }
    
    @RequestMapping(value="productInfo/{id}")
    public String productInfo(@PathVariable("id")String id,HttpSession session,Model model){
    	CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
    	
    	ImportPlan plan = new ImportPlan();
    	plan.setId(new BigDecimal(id));
    	plan = iImportPlanService.findPlan(plan,companyUser,companyUser.getWorkMode());
    	model.addAttribute("plan", plan);
    	
    	return "/company/beforeImport/productInfo";
    }
    
}
