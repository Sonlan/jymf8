package org.jymf.web.monitor;

import javax.servlet.http.HttpSession;

import org.jymf.entity.CompanyBase;
import org.jymf.entity.CompanyCount;
import org.jymf.entity.OutPutCount;
import org.jymf.service.ICompanyService;
import org.jymf.service.IOutPutCountService;
import org.jymf.service.IProductService;
import org.jymf.utils.Common;
import org.jymf.utils.Constants;
import org.jymf.utils.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/monitor/company/count")
public class MonitorCompanyCountController{

	@Autowired
    private ICompanyService companyService;
	
	@Autowired
    private IOutPutCountService outPutCountService;
		
	@Autowired
    private IProductService productService;
	
	/**
	 * 进入企业用户一览显示画面
	 * @return
	 */
	@RequestMapping(value = "main")
	public String init(Model model,CompanyCount companyCount, HttpSession session) {

		PageView pageView = new PageView(1);
		CompanyBase companyBase = (CompanyBase) session.getAttribute(Constants.SESSION_COMPANY_BASE);
		
		companyCount.setCompanyId(companyBase.getId());
		companyCount.setStartDate(Common.yesterdayModthFirstday());
		companyCount.setEndDate(Common.yesterday());
		
		pageView = companyService.queryCountByCompany(pageView, companyCount, companyBase.getWorkMode());
		model.addAttribute("pageView", pageView);
				
		model.addAttribute("companyCount", companyCount);
		
        return String.format("/monitor/company/count/%s/main",companyBase.getWorkMode());
	}
	
	/**
	 * 检索查询
     * @param model
     * 存放返回界面的model
     * @return
     */
    @RequestMapping("query")
    public String query(Model model,CompanyCount companyCount, String pageNow,HttpSession session) {
        PageView pageView = null;
        if (Common.isEmpty(pageNow)) {
            pageView = new PageView(1);
        } else {
            pageView = new PageView(Integer.parseInt(pageNow));
        }

        CompanyBase companyBase = (CompanyBase) session.getAttribute(Constants.SESSION_COMPANY_BASE);
		companyCount.setCompanyId(companyBase.getId());
			
		pageView = companyService.queryCountByCompany(pageView, companyCount, companyBase.getWorkMode());
				
		model.addAttribute("companyCount", companyCount);
        model.addAttribute("pageView", pageView);
        
        return String.format("/monitor/company/count/%s/main",companyBase.getWorkMode());
    }
    
    
    
    /**
	 * 进入企业用户一企业,出库关联的统计
	 * @return
	 */
	@RequestMapping(value = "outPutMain")
	public String outPutMain(Model model,OutPutCount outPutCount, HttpSession session) {
		PageView pageView = new PageView(1);
		CompanyBase companyBase = (CompanyBase) session.getAttribute(Constants.SESSION_COMPANY_BASE);
		
		outPutCount.setCompanyId(companyBase.getId());
		outPutCount.setStartDate(Common.yesterdayModthFirstday());
		outPutCount.setEndDate(Common.yesterday());
		
		pageView = outPutCountService.queryOutPutCount(pageView,outPutCount, companyBase.getWorkMode());
		model.addAttribute("pageView", pageView);
		model.addAttribute("outPutCount", outPutCount);
		
        return String.format("/monitor/company/count/%s/outputcnt",companyBase.getWorkMode());
	}
	
	/**
	 * 变换查询条件后检索结果
	 * @return
	 */
	@RequestMapping(value = "queryOutPutCnt")
	public String queryOutPutCount(Model model,OutPutCount outPutCount,String pageNow, HttpSession session) {
	    PageView pageView = null;
	    if (Common.isEmpty(pageNow)) {
	        pageView = new PageView(1);
	    } else {
	        pageView = new PageView(Integer.parseInt(pageNow));
	    }
	        
	    CompanyBase companyBase = (CompanyBase) session.getAttribute(Constants.SESSION_COMPANY_BASE);
		outPutCount.setCompanyId(companyBase.getId());
		
		pageView = outPutCountService.queryOutPutCount(pageView,outPutCount, companyBase.getWorkMode());
		
		model.addAttribute("pageView", pageView);
		model.addAttribute("outPutCount", outPutCount);
		
		return String.format("/monitor/company/count/%s/outputcnt",companyBase.getWorkMode());
	}
}
