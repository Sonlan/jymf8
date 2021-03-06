package org.jymf.dao;

import java.math.BigDecimal;
import java.util.List;

import org.jymf.entity.Area;

public interface AreaMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(Area record);

    int insertSelective(Area record);

    Area selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(Area record);

    int updateByPrimaryKey(Area record);
    
    /**
     * 查询所有区域
     */
    List<Area> findAll();
    
    List<Area> findCity();
    /**
     * 查询三级
     */
    List<Area> findToCounty();
}