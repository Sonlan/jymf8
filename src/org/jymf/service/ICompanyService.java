package org.jymf.service;

import java.math.BigDecimal;
import java.util.List;

import org.jymf.entity.Company;
import org.jymf.entity.CompanyCount;
import org.jymf.utils.PageView;

/**
 * 企业信息操作接口
 * @author cqs
 * @date   2014年5月7日
 */
public interface ICompanyService{
	/**
	 * 通过主键获取记录
	 * @param id
	 * @param isImg 是否需要图片
	 * @return
	 */
    Company findById(BigDecimal id,Boolean isImg);
    /**
     * 获取所有公司信息（每次获取一页）
     * @param pageView
     * @param company
     * @return
     */
    PageView query(PageView pageView, Company company);
    
    /**
     * 检索出所有没被指定监管部门（monitorId）下的公司
     * @param pageView
     * @param company
     * @param monitorId
     * @return
     */
    PageView queryCompanyMonitor(PageView pageView, Company company,long monitorId);
    
    /**
     * 检索出所有没被指定代理商（agentId）代理的公司
     * @param pageView
     * @param company
     * @return
     */
    PageView queryAgentCompany(PageView pageView, Company company,long monitorId);
    
    
    /**
     * 分页处理,监管ID查找企业信息
     * @param pageView
     * @param company
     * @return
     */
    PageView queryMonitorCompany(PageView pageView, Company company,long monitorId);
    
    /**
     * 分页处理,代理商关系
     * @param pageView
     * @param company
     * @return
     */
    PageView queryAgentUpdate(PageView pageView, Company company,long agentId);
    /**
     * 更新企业信息
     * @param company
     * @param cacheFolder 服务器上传图片的暂存绝对路径
     */
    boolean update(Company company,String cacheFolder);
	
	/**
	 * 添加企业信息
	 * @param company
	 * @param cacheFolder 服务器上传图片的暂存绝对路径
	 */
	void add(Company company, String cacheFolder);
	
	/**
	 * 获取审核有效的企业
	 * @param id
	 * @return
	 */
	Company getAuditble(long id);
    
    /**
     * 统计一段时间内企业的包凭证使用信息，按照产品进行分类统计
     * @param workMode 根据追溯模式不同，会访问不同的DB
     * @return
     */
    PageView queryCountByCompany(PageView pageView, CompanyCount companyCount,BigDecimal workMode);
    
    /**
     * 统计标签使用的情况根据产品ID
     * @param workMode 根据追溯模式不同，会访问不同的DB
     * @return
     */
    PageView queryLabelByCompany(PageView pageView, CompanyCount companyCount,BigDecimal workMode);
    
    /**
     * 创建企业用表
     * @param company
     * @param workMode 根据追溯模式不同，会访问不同的DB
     */
    void createTable(Company company,BigDecimal workMode);
    
    /**
     * 获取所有公司
     * @return
     */
    List<Company> findAllCompany();
	
    /**
     * 注册进出口企业信息，由管理员审核注册信息
     */
    void register(Company company);
    
    /**
     * 管理员审核进出口企业注册信息
     */
    boolean audit(Company company, String cacheFolder);
    
    /**
     * 验证公司机构ID是否已经注册
     */
    boolean checkCpCode(String lceNum);
    
    /**
     * 验证公司名称是否已经存在
     */
    boolean checkCpName(String cpName);
    
    /**
     * 更新状态
     */
    boolean updateAuditCompany(Company company);
}
