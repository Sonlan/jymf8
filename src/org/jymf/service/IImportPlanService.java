package org.jymf.service;

import java.math.BigDecimal;
import org.jymf.entity.CompanyUser;
import org.jymf.entity.ImportPlan;
import org.jymf.entity.ImportProductList;
import org.jymf.utils.PageView;

public interface IImportPlanService{

	PageView query(PageView pageView, ImportPlan plan,BigDecimal companyId, BigDecimal workMode);

	BigDecimal getAvailableProductLabelCount(String id, CompanyUser companyUser, BigDecimal workMode);

	void add(ImportPlan plan,CompanyUser companyUser, BigDecimal workMode);

	/**
	 * 查询进口进化产品清单 
	 * @param product 
	 */
	PageView queryProductInfo(PageView pageView, ImportProductList product, CompanyUser companyUser,
			BigDecimal workMode);

	ImportPlan findPlan(ImportPlan plan, CompanyUser companyUser, BigDecimal workMode);

	void update(ImportPlan plan, BigDecimal workMode);
   

}