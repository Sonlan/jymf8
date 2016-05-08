package org.jymf.web.monitor;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jymf.entity.Company;
import org.jymf.entity.CompanyBase;
import org.jymf.entity.CompanyUser;
import org.jymf.entity.ImportPlan;
import org.jymf.entity.OptAction;
import org.jymf.entity.Product;
import org.jymf.service.ICompanyService;
import org.jymf.service.ICompanyUserService;
import org.jymf.service.IImportPlanService;
import org.jymf.service.IOptActionService;
import org.jymf.service.IProductService;
import org.jymf.utils.Common;
import org.jymf.utils.Constants;
import org.jymf.utils.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 产品类型Controller
 * @author cqs
 * @date   2014年7月29日
 */
@Controller
@RequestMapping(value = "/monitor/company")
public class MonitorCompanyController{
	
	@Autowired
    private IProductService productService;
	
	@Autowired
	private IOptActionService optActionService;
	
    @Autowired
	private ICompanyService companyService;
    
    @Autowired
    private ICompanyUserService companyUserService;
    
    @Autowired
    private IImportPlanService iImportPlanService;
    
	/**
	 * 进入指定企业画面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public String company(@PathVariable("id") BigDecimal id,Model model, 
						  HttpSession session,Map<String, Object> map) {
		Company company = companyService.findById(id, true);
		CompanyBase companyBase = new CompanyBase();
		companyBase.setId(id);
		companyBase.setWorkMode(company.getWorkMode());
		companyBase.setName(company.getName());
		
		session.setAttribute(Constants.SESSION_COMPANY_BASE, companyBase);
		
		CompanyUser companyUser = new CompanyUser();
		companyUser.setLicense(company.getLicenseNum());
		
		session.setAttribute("companyuser", companyUser);
		
		map.put("company", company); 
  		model.addAttribute("mode",companyBase.getWorkMode());
		
		return "/monitor/icompany";
	}
	
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(HttpSession session,Map<String, Object> map,Model model) {
		CompanyBase companyBase = (CompanyBase)session.getAttribute(Constants.SESSION_COMPANY_BASE);
		Company company = companyService.findById(companyBase.getId(), true);
						
		map.put("company", company); 
		
		return "/monitor/company/view";
	}
	
    /**
     * 返回企业列表页面
     */
    @RequestMapping(value= "back")
    public String back(HttpSession session){
    	session.removeAttribute(Constants.SESSION_COMPANY_BASE);
    	session.removeAttribute("companyuser");
    	session.removeAttribute("productback");
    	return "/monitor/index"; 
    }    
	/**
	 * 进入产品显示画面
	 * @return
	 */
	@RequestMapping(value = "product")
	public String init(Model model, Product product,HttpSession session) {
		PageView pageView = new PageView(1);
		CompanyBase companyBase = (CompanyBase)session.getAttribute(Constants.SESSION_COMPANY_BASE);
		product.setCompanyId(companyBase.getId());
		pageView = productService.query(pageView, product,companyBase.getWorkMode());
		model.addAttribute("pageView", pageView);
		model.addAttribute("product", product);
		session.setAttribute(Constants.SESSION_PRODUCT_BACK, null);
		//获取当前登录的监管用户
		
		model.addAttribute("mode",companyBase.getWorkMode());
		
		return String.format("/monitor/company/product/%s/main",companyBase.getWorkMode());
	}

	/**
     * @param model
     * 监管模式下，产品列表查询画面
     * 目前查询条件：产品名称/产品ID
     * @return
     */
    @RequestMapping("product/query")
    public String query(Model model, Product product, String pageNow,HttpSession session) {
    	//获取当前登录的监管用户
        PageView pageView = null;
        if (Common.isEmpty(pageNow)) {
            pageView = new PageView(1);
        } else {
            pageView = new PageView(Integer.parseInt(pageNow));
        }
        CompanyBase companyBase = (CompanyBase)session.getAttribute(Constants.SESSION_COMPANY_BASE);
		product.setCompanyId(companyBase.getId());
        pageView = productService.query(pageView, product,companyBase.getWorkMode());
        model.addAttribute("pageView", pageView);
        model.addAttribute("product", product);
        //http://127.0.0.1:8080/jymf/admin/company/query?pageNow=2&name=&id= 
        String productback =String.format("?pageNow=%s&name=%s&id=",pageView.getPageNow(),product.getName());
        if(null != product.getId()){
        	productback =String.format("%s%s",productback,product.getId());
        }
        session.setAttribute(Constants.SESSION_PRODUCT_BACK, productback);
        
    	model.addAttribute("mode",companyBase.getWorkMode());
    	System.out.println(String.format("monitor/company/product/%s/main", companyBase.getWorkMode()));
        return String.format("/monitor/company/product/%s/main",companyBase.getWorkMode());
    }
   
    /**
     * 进入产品类型查看画面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "product/view/{id}", method = RequestMethod.GET)
    public String view(@PathVariable("id") BigDecimal id, Model model, HttpSession session) {
    	CompanyBase companyBase = (CompanyBase)session.getAttribute(Constants.SESSION_COMPANY_BASE);
    	Product product = productService.findById(id,companyBase.getId(),true,companyBase.getWorkMode());
        model.addAttribute("product", product);
        
    	model.addAttribute("mode",companyBase.getWorkMode());
        return String.format("monitor/company/product/%s/view", companyBase.getWorkMode());
    }
    
    
    /**
     * 查看销售数量信息(初次进入)
     */
    @RequestMapping("product/queryopt/{productId}")
    public String queryOptAction(@PathVariable("productId") BigDecimal productId,
    		                     Model model, 
    		                     OptAction optAction, 
    		                     String pageNow,
    		                     HttpSession session) {
    	//获取当前登录的监管用户
        PageView pageView = null;
        pageView = new PageView(1);
        CompanyBase companyBase = (CompanyBase)session.getAttribute(Constants.SESSION_COMPANY_BASE);
               
        //保存从上级页面获取的产品ID
        optAction.setProductId(productId);
        optAction.setCompanyId(companyBase.getId());
               
        pageView = optActionService.queryOptAction(pageView, optAction, companyBase.getWorkMode());
        model.addAttribute("pageView", pageView);
        model.addAttribute("optAction", optAction);
        
    	model.addAttribute("mode",companyBase.getWorkMode());
        
        return "/monitor/company/product/3/sellMain";
    }
    
    /**
     * 查看销售数量信息(分页，上一页/下一页的处理)
     */
    @RequestMapping("product/queryopt")
    public String queryOptAction(Model model, 
    		                     OptAction optAction, 
    		                     String pageNow,
    		                     HttpSession session) {
    	//获取当前登录的监管用户
        PageView pageView = null;
        if (Common.isEmpty(pageNow)) {
            pageView = new PageView(1);
        } else {
            pageView = new PageView(Integer.parseInt(pageNow));
        }
        CompanyBase companyBase = (CompanyBase)session.getAttribute(Constants.SESSION_COMPANY_BASE);
               
        //保存从上级页面获取的产品ID
        optAction.setCompanyId(companyBase.getId());
               
        pageView = optActionService.queryOptAction(pageView, optAction, companyBase.getWorkMode());
        model.addAttribute("pageView", pageView);
        model.addAttribute("optAction", optAction);
        
    	model.addAttribute("mode",companyBase.getWorkMode());
        
        return "/monitor/company/product/3/sellMain";
    }
    
    
    @RequestMapping(value = "import/main")
    public String init(Model model, ImportPlan importPlan,HttpSession session) throws ParseException {
		PageView pageView = new PageView(1);
		
		CompanyBase companyBase = (CompanyBase) session.getAttribute(Constants.SESSION_COMPANY_BASE);
		importPlan.setStartDate(Common.yesterdayModthFirstday());
		importPlan.setEndDate(Common.yesterday());
		importPlan.setCompanyName(companyBase.getName());
		pageView = iImportPlanService.query(pageView, importPlan,companyBase.getId(), companyBase.getWorkMode());
		
		model.addAttribute("pageView", pageView);
		model.addAttribute("shippingType", Constants.shippingType);
		
        return "/monitor/company/importPlan/main";
    }
    @RequestMapping(value="import/query")
    public String query(Model model, ImportPlan importPlan,HttpSession session,String pageNow) throws ParseException{
    	 PageView pageView = null;
         if (Common.isEmpty(pageNow)) {
             pageView = new PageView(1);
         } else {
             pageView = new PageView(Integer.parseInt(pageNow));
         }
         CompanyBase companyBase = (CompanyBase) session.getAttribute(Constants.SESSION_COMPANY_BASE);
         importPlan.setCompanyName(companyBase.getName());
         pageView = iImportPlanService.query(pageView, importPlan,companyBase.getId(), companyBase.getWorkMode());
         model.addAttribute("pageView", pageView);
         model.addAttribute("shippingType", Constants.shippingType);
    	 return "/monitor/company/importPlan/main";
    }
    
    
    @RequestMapping(value="import/productInfo/{id}")
    public String productInfo(@PathVariable("id")String id,HttpSession session,Model model){
    	CompanyBase companyBase = (CompanyBase) session.getAttribute(Constants.SESSION_COMPANY_BASE);
    	CompanyUser companyUser = new CompanyUser();
    	companyUser.setCompanyId(companyBase.getId());
    	
    	ImportPlan plan = new ImportPlan();
    	plan.setId(new BigDecimal(id));
    	plan = iImportPlanService.findPlan(plan,companyUser,companyBase.getWorkMode());
    	model.addAttribute("plan", plan);
    	
    	return "/monitor/company/importPlan/productInfo";
    }
    
}
