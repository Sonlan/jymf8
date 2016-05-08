package org.jymf.dao;

import java.util.List;
import java.util.Map;

import org.jymf.entity.ImportProductList;


public interface ImportProductListMapper {

	void add(ImportProductList productList);

	List<ImportProductList> queryProductInfo(Map<String, Object> map);

	List<ImportProductList> findProductInfo(ImportProductList productInfo);
	
   
}