package org.jymf.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.jymf.entity.ImportPlan;



public interface ImportPlanMapper {
   
	List<ImportPlan> query(Map<String,Object> map);
	/**
	 * 得到某商品当前可用数量 
	 */
	BigDecimal getAvailableProductLabelCount(Map<String, Object> map);

	int add(ImportPlan plan);

	List<ImportPlan> findPlan(ImportPlan plan);

	void update(ImportPlan plan);

	String findMaxPlanId(Map<String,Object> map);
}