package org.jymf.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.math.BigDecimal;

import javax.annotation.Resource;

import org.jymf.dao.CompanyMonitorMapper;
import org.jymf.dao.CustomsMonitorMapper;
import org.jymf.entity.CompanyMonitor;
import org.jymf.entity.CustomsMonitor;
import org.jymf.service.ICompanyMonitorService;
import org.jymf.utils.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 监管管理操作实现类
 * @author cqs
 * @date   2014年05月09日
 */
@Service("companyMonitorService")
public class CompanyMonitorServiceImpl implements ICompanyMonitorService{
    @Autowired
    private CompanyMonitorMapper companyMonitorDao;
    
    @Resource
    private CustomsMonitorMapper customsMonitorDao;

    @Override
    public PageView query(PageView pageView, CompanyMonitor companyMonitor) {
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("paging", pageView);
        map.put("t", companyMonitor);
        
        List<CompanyMonitor> list = companyMonitorDao.query(map);
        pageView.setRecords(list);
        return pageView;
    }

    @Override
    public CompanyMonitor findById(long id) {
        return companyMonitorDao.selectByPrimaryKey(new BigDecimal(id));
    }

    /**
     * 更新监管关系
     */
    @Override
    public void update(CompanyMonitor companyMonitor) {
        companyMonitorDao.updateByPrimaryKeySelective(companyMonitor);
    }

    /**
     * 添加监管关系
     */
    @Override
    public void add(CompanyMonitor companyMonitor) {
        companyMonitorDao.insert(companyMonitor);
    }
    
    /**
     * 查询最大的ID
     */
    @Override
    public int findMaxId(){
    	return companyMonitorDao.findMaxId();
    }
    
    /**
     * 通过用户名查找用户
     */
    public CompanyMonitor selectCompanyMonitor(String account){
    	CompanyMonitor mo = companyMonitorDao.selectByCompanyMonitor(account);
    	return mo;
    }
    
    /**
     * 通过部门名查找用户
     */
    public CompanyMonitor selectCompanyMonitorByName(String name){
    	CompanyMonitor mo = companyMonitorDao.selectByCompanyMonitorName(name);
    	return mo;
    }
    
    /**
     * 通过用户名查询密码
     */
    @Override
	public Boolean findByAccountAndPassword(String account,String pwd){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("account", account);
		map.put("pwd", pwd);
		return this.companyMonitorDao.selectByAccountAndPassword(map)!=null;
	}
    

    /**
     * 修改当前用户的密码
     */
    @Override
    public int updateByPrimaryKey(CompanyMonitor companyMonitor){
    	return companyMonitorDao.updateByPrimaryKey(companyMonitor);
    }

    /**
     * 通过监管用户资源表ID查询该监管者用户信息
     */
	@Override
	public CompanyMonitor selectCompanyMonitorByLibId(String id) {
		return companyMonitorDao.selectCompanyMonitorByLibId(id);
	}

	/**
	 * @author add by sungj
	 * 
	 * 获取所有监管部门的信息
	 */
	@Override
	public List<CustomsMonitor> queryAllMonitors() {
		return customsMonitorDao.findAllCustomsMonitor();
	}
    
}
