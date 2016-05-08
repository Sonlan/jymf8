package org.jymf.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.jymf.entity.CompanyMonitor;

public interface CompanyMonitorMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(CompanyMonitor record);

    int insertSelective(CompanyMonitor record);

    CompanyMonitor selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(CompanyMonitor record);

	List<CompanyMonitor> query(Map<Object, Object> map);
	
	/**
	 * 查出最大的ID信息
	 * @return
	 */
	int findMaxId();
	
	/**
	 * 根据用户名查找信息
	 * @param account
	 * @return
	 */
    CompanyMonitor selectByCompanyMonitor(String account);
    
    /**
     * 根据监管部门名(例如：海淀出入检验检验局)查找信息
     * @param name
     * @return
     */
    CompanyMonitor selectByCompanyMonitorName(String name);
    
    /**
	 * 查询用户，通过用户名/密码
	 * @param map
	 * @return
	 */
    CompanyMonitor selectByAccountAndPassword(Map<String, Object> map);
    
    /**
     * 修改当前用户的密码
     */
    
    int updateByPrimaryKey(CompanyMonitor record);

	CompanyMonitor selectCompanyMonitorByLibId(String id);
}