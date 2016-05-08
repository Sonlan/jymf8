package org.jymf.web.company;

import java.math.BigDecimal;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.jymf.entity.CompanyUser;
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
@RequestMapping(value = "/company/label")
public class CompanyLabelIndexController {
    @Autowired
    private ILabelIndexService labelIndexService;
    @Autowired
    private BusinessLogger businessLogger;
    
    @RequestMapping(value = "main")
    public String init(Model model, LabelIndex labelIndex,HttpSession session) {
		PageView pageView = new PageView(1);
		
		CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
		labelIndex.setCompanyId(companyUser.getCompanyId());
		pageView = labelIndexService.queryPreLabel(pageView, labelIndex, companyUser.getWorkMode());
		
		
		model.addAttribute("pageView", pageView);
		model.addAttribute("LabelIndex", labelIndex);

		model.addAttribute("mode", companyUser.getWorkMode());
		
        return "/company/label/main";
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
        CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
        labelIndex.setCompanyId(companyUser.getCompanyId());
        pageView = labelIndexService.queryPreLabel(pageView, labelIndex, companyUser.getWorkMode());
        model.addAttribute("pageView", pageView);
        model.addAttribute("labelIndex", labelIndex);
        model.addAttribute("mode", companyUser.getWorkMode());
        return "/company/label/main";
    }
    
    /**
     * 进入标签索引添加画面
     * @return
     */
    @RequestMapping(value="add", method = RequestMethod.GET)
    public String add(Model model,HttpSession session) {
    	CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
    	model.addAttribute("mode", companyUser.getWorkMode());
    	model.addAttribute("companyId", companyUser.getCompanyId());
        return "/company/label/add";
    }

    /**
     * 将标签索引画面添加内容写入数据库
     * @param labelIndex
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value="add", method = RequestMethod.POST)
    public String add(Model model,LabelIndex labelIndex, HttpSession session) {
    	CompanyUser companyUser = (CompanyUser) session.getAttribute(Constants.SESSION_COMPANY_USER);
    	labelIndex.setWorkMode(companyUser.getWorkMode());
    	labelIndex.setCompanyId(companyUser.getCompanyId());
    	// 标签状态默认为1，有效
    	labelIndex.setStatus(new BigDecimal(0));
    	
    	BigDecimal count =  labelIndex.getCount().multiply(new BigDecimal(10000));
		BigDecimal maxId = labelIndexService.findMaxLabelId();
		BigDecimal startId = maxId.add(new BigDecimal(1));
		BigDecimal endId = maxId.add(count);
    	
		labelIndex.setStartTid(startId);
		labelIndex.setEndTid(endId);
    	
    	//加入labelIndex
    	labelIndexService.add(labelIndex);
    	//加入预申请单
        labelIndexService.addPreLabel(labelIndex,companyUser.getWorkMode());
		
        String logStr = String.format("StartId:%s,EndId:%s", labelIndex.getStartTid(), labelIndex.getEndTid());
		
		businessLogger.log("label_index_add", String.valueOf(companyUser.getCompanyId()), labelIndex.getCompanyId(), logStr, labelIndex);
        return "redirect:/company/label/main";
    }

    
}
