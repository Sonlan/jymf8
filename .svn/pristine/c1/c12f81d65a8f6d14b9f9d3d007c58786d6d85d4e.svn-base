package org.jymf.service;

import java.util.List;

import org.jymf.entity.CompanyMonitor;
import org.jymf.entity.CustomsMonitor;
import org.jymf.utils.PageView;

/**
 * 监管管理操作接口
 * @author cqs
 * @date   2014年05月09日
 */
public interface ICompanyMonitorService{
    /**
     * 通过主键获取记录
     * @param id
     * @return
     */
    CompanyMonitor findById(long id);
    /**
     * 分页处理
     * @param pageView
     * @param companyMonitor
     * @return
     */
    PageView query(PageView pageView, CompanyMonitor companyMonitor);
    /**
     * 监管管理信息
     * @param companyMonitor
     */
    void update(CompanyMonitor companyMonitor);
    
    /**
     * 添加监管管理
     * @param companyMonitor
     */
    void add(CompanyMonitor companyMonitor);
    
    /**
     * 获取最大的ID
     * @return
     */
    int findMaxId();
    
    /**
	 * 通过用户名查找信息
	 */
	CompanyMonitor selectCompanyMonitor(String account);
	
	/**
	 * 通过监管部门名查找信息
	 */
	CompanyMonitor selectCompanyMonitorByName(String name);
	
	/**
	 * 通过建管理资源表ID 查找该监管用户信息
	 */
	CompanyMonitor selectCompanyMonitorByLibId(String id);
	
    /**
	 * 查找用户，通过用户名和密码
	 * @param account
	 * @param password
	 * @return
	 *        True 用户存在
	 *       False 用户不存在
	 */
	Boolean findByAccountAndPassword(String account,String pwd);
	
	/**
	 * 修改当前用户的密码
	 */
	int updateByPrimaryKey(CompanyMonitor companyMonitor);
	
	/**
	 * 获取所有监管部门
	 */
	List<CustomsMonitor> queryAllMonitors();
    
}
