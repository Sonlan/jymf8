package org.jymf.web.company;

import java.math.BigDecimal;
import java.text.ParseException;

import javax.servlet.http.HttpSession;

import org.jymf.entity.CompanyUser;
import org.jymf.entity.ImportPlan;
import org.jymf.entity.ImportProductList;
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
@RequestMapping(value = "/company/afterImport")
public class AfterImportController {
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
        return "/company/afterImport/main";
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
         model.addAttribute("plan", plan);
         model.addAttribute("mode", companyUser.getWorkMode());
    	 return "/company/afterImport/main";
    }
    
    
    @RequestMapping(value="/productInfoQuery/{id}")
    public String productInfoQuery(@PathVariable("id")String id,HttpSession session,
    								ImportProductList productInfo, Model model,String pageNow){
    	
    	CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
    	model.addAttribute("mode", companyUser.getWorkMode());
    	
    	PageView pageView = null;
        if (Common.isEmpty(pageNow)) {
            pageView = new PageView(1);
        } else {
            pageView = new PageView(Integer.parseInt(pageNow));
        }
    	
    	productInfo.setCompanyId(companyUser.getCompanyId());
    	productInfo.setId(new BigDecimal(id));
    	
    	pageView = iImportPlanService.queryProductInfo(pageView,productInfo,companyUser,companyUser.getWorkMode());
    	model.addAttribute("pageView", pageView);
    	model.addAttribute("productInfo", productInfo);
    	return "/company/afterImport/productInfo";
    }
    
    
    @RequestMapping(value="update/{id}",method=RequestMethod.GET)
    public String update(@PathVariable("id")String id,Model model,HttpSession session) throws ParseException{
    	
    	CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
    	model.addAttribute("mode", companyUser.getWorkMode());
    	model.addAttribute("companyId", companyUser.getCompanyId());
    	
    	ImportPlan plan = new ImportPlan();
    	plan.setId(new BigDecimal(id));
    	
    	plan = iImportPlanService.findPlan(plan,companyUser,companyUser.getWorkMode());
    	model.addAttribute("plan", plan);
    	model.addAttribute("cities", areaService.findCity());
    	model.addAttribute("ports", areaService.findPort());
    	model.addAttribute("worldAreas", areaService.findWorldArea());
    	
    	return "/company/afterImport/edit";
    }
    
    @RequestMapping(value="update",method=RequestMethod.POST)
    public String update(ImportPlan plan,HttpSession session){
    	
    	CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
    	plan.setCompanyId(companyUser.getCompanyId());
    	iImportPlanService.update(plan,companyUser.getWorkMode());
    	return "redirect:/company/afterImport/main";
    }
    
}
