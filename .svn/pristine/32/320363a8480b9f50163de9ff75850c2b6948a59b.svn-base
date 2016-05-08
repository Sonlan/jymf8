package org.jymf.web.monitor;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.jymf.entity.CompanyBase;
import org.jymf.entity.LabelIndex;
import org.jymf.service.ILabelIndexService;
import org.jymf.service.impl.BusinessLogger;
import org.jymf.utils.Common;
import org.jymf.utils.Constants;
import org.jymf.utils.PageView;

/**
 * 标签索引Controller
 * @author wfj
 * @date   2015年6月17日
 */
@Controller
@RequestMapping(value = "/monitor/company/label")
public class MonitorCompanyLabelIndexController {
    @Autowired
    private ILabelIndexService labelIndexService;
    @Autowired
    private BusinessLogger businessLogger;
    
    @RequestMapping(value = "main")
    public String init(Model model, LabelIndex labelIndex,HttpSession session) {
		PageView pageView = new PageView(1);
		
		CompanyBase companyBase = (CompanyBase) session.getAttribute(Constants.SESSION_COMPANY_BASE);
		labelIndex.setCompanyId(companyBase.getId());
		pageView = labelIndexService.queryPreLabel(pageView, labelIndex, companyBase.getWorkMode());
		
		
		model.addAttribute("pageView", pageView);
		model.addAttribute("LabelIndex", labelIndex);

		model.addAttribute("mode", companyBase.getWorkMode());
		
        return "/monitor/company/label/main";
    }

    /**
     * @param model
     * 存放返回界面的model
     * @return
     */
    @RequestMapping("query")
    public String query(Model model, LabelIndex labelIndex, String pageNow,HttpSession session) {
        PageView pageView = null;
        if (Common.isEmpty(pageNow)) {
            pageView = new PageView(1);
        } else {
            pageView = new PageView(Integer.parseInt(pageNow));
        }
        CompanyBase companyBase = (CompanyBase) session.getAttribute(Constants.SESSION_COMPANY_BASE);
        labelIndex.setCompanyId(companyBase.getId());
        pageView = labelIndexService.queryPreLabel(pageView, labelIndex, companyBase.getWorkMode());
        model.addAttribute("pageView", pageView);
        model.addAttribute("labelIndex", labelIndex);
        model.addAttribute("mode", companyBase.getWorkMode());
        return "/monitor/company/label/main";
    }
   
}
