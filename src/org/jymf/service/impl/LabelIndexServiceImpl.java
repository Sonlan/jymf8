package org.jymf.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.math.BigDecimal;

import org.jymf.dao.LabelIndexMapper;
import org.jymf.entity.LabelIndex;
import org.jymf.service.ILabelIndexService;
import org.jymf.utils.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jymf.common.LableUtil;
/**
 * 标签索引操作实现类
 * @author cqs
 * @date   2014年05月09日
 */
@Service("labelIndexService")
public class LabelIndexServiceImpl implements ILabelIndexService{
    @Autowired
    private LabelIndexMapper labelIndexDao;

    @Override
    public PageView query(PageView pageView, LabelIndex labelIndex) {
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("paging", pageView);
        map.put("t", labelIndex);
        
        List<LabelIndex> list = labelIndexDao.query(map);
        for(LabelIndex label : list){
        	label.setStartTid(this.getLabelId(label.getStartTid()));
        	label.setEndTid(this.getLabelId(label.getEndTid()));
        }
        pageView.setRecords(list);
        return pageView;
    }

    @Override
    public LabelIndex findById(long id) {
    	LabelIndex labelIndex=labelIndexDao.selectByPrimaryKey(new BigDecimal(id));
    	labelIndex.setStartTid(this.getLabelId(labelIndex.getStartTid()));
    	labelIndex.setEndTid(this.getLabelId(labelIndex.getEndTid()));
        return labelIndex;
    }

    @Override
    public void update(LabelIndex labelIndex) {
    	labelIndex.setStartTid(getLabelId12(labelIndex.getStartTid()));
    	labelIndex.setEndTid(getLabelId12(labelIndex.getEndTid()));
        labelIndexDao.updateByPrimaryKeySelective(labelIndex);
    }

    @Override
    public void add(LabelIndex labelIndex) {
    	labelIndex.setStartTid(getLabelId12(labelIndex.getStartTid()));
    	labelIndex.setEndTid(getLabelId12(labelIndex.getEndTid()));
        labelIndexDao.insert(labelIndex);
    }

    /**
     * 判断标签是否被注册过
     * @param labelId
     * @param id 当前记录的ID，Add=0，Update=当前记录
     * @return
     *        True 注册过
     *       False 没有被注册过||当前更新的记录
     */
	@Override
	public boolean checkLableId(BigDecimal labelId,long id) {
		labelId = getLabelId12(labelId);
		LabelIndex labelIndex = labelIndexDao.findByLabelId(labelId);
		// null false
		// !null && labelIndex.id=id false
		// !null && labelIndex.id!= id true
		return null!=labelIndex && 0!=labelIndex.getId().compareTo(new BigDecimal(id));
	}

	private BigDecimal getLabelId(BigDecimal id){
		String labelId = LableUtil.getCheckNum(id.toString());
		return new BigDecimal(labelId);
	}
	
	private BigDecimal getLabelId12(BigDecimal id){
		return new BigDecimal(id.toString().substring(0, 12));
	}

	@Override
	public PageView query(PageView pageView, LabelIndex labelIndex,	long agentId) {
        Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("paging", pageView);
        map.put("t", labelIndex);
        map.put("agentId", agentId);
        
        List<LabelIndex> list = labelIndexDao.query(map);
        for(LabelIndex label : list){
        	label.setStartTid(this.getLabelId(label.getStartTid()));
        	label.setEndTid(this.getLabelId(label.getEndTid()));
        }
        pageView.setRecords(list);
        return pageView;
	}
	
	@Override
	public PageView queryPreLabel(PageView pageView, LabelIndex labelIndex,BigDecimal mode){
		
		Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("paging", pageView);
        map.put("t", labelIndex);
		
        List<LabelIndex> list = labelIndexDao.queryPreLabel(map);
        for(LabelIndex label : list){
        	label.setStartTid(this.getLabelId(label.getStartTid()));
        	label.setEndTid(this.getLabelId(label.getEndTid()));
        }
        pageView.setRecords(list);
        
		return pageView;
	}

	@Override
	public void addPreLabel(LabelIndex labelIndex,BigDecimal mode) {
		//加到tbl_prelabel_XXX
		labelIndexDao.addPreLabel(labelIndex);
	}
	
	@Override
	public BigDecimal findMaxLabelId(){
		Map<String,Object> map = new HashMap<String, Object>();
		Map<String,Object> mapValue = new HashMap<String, Object>();
		//这里固定设死为普通标签
		mapValue.put("labelType", 0);
		map.put("t", mapValue);
		BigDecimal maxId = labelIndexDao.findMaxLabel(map);
		return maxId;
	}

	@Override
	public PageView queryUsablePreLabel(PageView pageView,
			LabelIndex labelIndex, BigDecimal workMode) {
			
		Map<Object, Object> map = new HashMap<Object, Object>();
        map.put("paging", pageView);
        map.put("t", labelIndex);
		
        List<LabelIndex> list = labelIndexDao.queryUsablePreLabel(map);
        pageView.setRecords(list);
        
		return pageView;
	}
	
}
