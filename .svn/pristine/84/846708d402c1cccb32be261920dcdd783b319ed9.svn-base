package org.jymf.service.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jymf.dao.ImportPlanMapper;
import org.jymf.dao.ImportProductListMapper;
import org.jymf.dao.LabelIndexMapper;
import org.jymf.entity.CompanyUser;
import org.jymf.entity.ImportPlan;
import org.jymf.entity.ImportProductList;
import org.jymf.entity.LabelIndex;
import org.jymf.service.IImportPlanService;
import org.jymf.utils.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.jymf.common.LableUtil;

@Service("iImportPlanService")
@Scope("prototype")
public class ImportPlanServiceImpl implements IImportPlanService{

	@Autowired
	private ImportPlanMapper importPlanDao;
	
	@Autowired
	private LabelIndexMapper labelIndexDao;
	
	@Autowired
	private ImportProductListMapper productListDao;
	
	@Override
	public PageView query(PageView pageView, ImportPlan plan,BigDecimal companyId,
			BigDecimal workMode) {
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("paging", pageView);
        map.put("t", plan);
        map.put("companyId", companyId);
        
        List<ImportPlan> list = importPlanDao.query(map);
        pageView.setRecords(list);
		return pageView;
	}

	@Override
	public BigDecimal getAvailableProductLabelCount(String id,CompanyUser companyUser,
			BigDecimal workMode) {
		
		Map<Object,Object> map = new HashMap<Object, Object>();
		
		LabelIndex labelIndex = new LabelIndex();
		labelIndex.setCompanyId(companyUser.getCompanyId());
		labelIndex.setProductId(new BigDecimal(id));
		map.put("t", labelIndex);
		
		List<LabelIndex> list = labelIndexDao.findPreLabel(map);
		
		BigDecimal availableCount = new BigDecimal(0);
		
		for(LabelIndex l : list){
			availableCount = availableCount.add(l.getCount().subtract(l.getUseCount()));
		}
		
		return availableCount;
	}

	@Override
	public void add(ImportPlan plan, CompanyUser companyUser,
			BigDecimal workMode) {
		plan.setCompanyId(companyUser.getCompanyId());
		importPlanDao.add(plan);
		
	}
	
	private BigDecimal getLabelId(BigDecimal id){
		String labelId = LableUtil.getCheckNum(id.toString());
		return new BigDecimal(labelId);
	}
		
	@Override
	public PageView queryProductInfo(PageView pageView,ImportProductList product,
			CompanyUser companyUser, BigDecimal workMode) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pageView", pageView);
		map.put("t", product);
		List<ImportProductList> list = productListDao.queryProductInfo(map);
		
		for(ImportProductList productList : list){
	        productList.setStartId(this.getLabelId(productList.getStartId()));
	        productList.setEndId(this.getLabelId(productList.getEndId()));
	    }
		
		pageView.setRecords(list);
		return pageView;
	}

	@Override
	public ImportPlan findPlan(ImportPlan plan, CompanyUser companyUser, BigDecimal workMode) {
		
		//根据ID查找plan
		plan.setCompanyId(companyUser.getCompanyId());
	    List<ImportPlan> planList = importPlanDao.findPlan(plan);
		plan = planList.get(0);
	   
		ImportProductList productInfo = new ImportProductList();
		productInfo.setId(plan.getId());
		productInfo.setCompanyId(companyUser.getCompanyId());
	    List<ImportProductList> list = productListDao.findProductInfo(productInfo);
	    
		return plan;
	}

	@Override
	public void update(ImportPlan plan, BigDecimal workMode) {
		importPlanDao.update(plan);
	}
	
   
}
