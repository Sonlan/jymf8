package org.jymf.dao;

import java.util.List;
import java.util.Map;
import java.math.BigDecimal;

import org.jymf.entity.LabelIndex;

/**
 * 标签DB操作接口
 * @author lxg
 * @date   2014年7月14日
 */
public interface LabelIndexMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(LabelIndex record);

    int insertSelective(LabelIndex record);

    LabelIndex selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(LabelIndex record);

    int updateByPrimaryKey(LabelIndex record);

	List<LabelIndex> query(Map<Object, Object> map);
	
	LabelIndex findByLabelId(BigDecimal labelId);

	/**
	 * 查询条码预申请单
	 */
	List<LabelIndex> queryPreLabel(Map<Object, Object> map);
	
	BigDecimal findMaxLabel(Map<String,Object> map);
	
	/**
	 * 条码预申请单添加
	 */
	void addPreLabel(LabelIndex labelIndex);

	/**
	 * 查询条码预申请单
	 */
	List<LabelIndex> findPreLabel(Map<Object, Object> map);

	/**
	 * 更新预申请单
	 */
	void updatePreLabel(LabelIndex upLabel);

	/**
	 * 查询可用标签
	 */
	List<LabelIndex> queryUsablePreLabel(Map<Object, Object> map);
	
}