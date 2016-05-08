package org.jymf.dao;

import java.util.List;
import java.util.Map;

import org.jymf.entity.MonitorCount;

public interface MonitorCountMapper {

	public List<MonitorCount> queryByHs(Map<Object,Object> map);

	public List<MonitorCount> queryBydepartCountry(Map<Object, Object> map);

	public List<MonitorCount> queryByArrivalPort(Map<Object, Object> map);

	public List<MonitorCount> queryByDestAddr(Map<Object, Object> map);

	public List<MonitorCount> findAllByHs(Map<Object, Object> map);
	
	/**
	 * 以分局来统计
	 * @param map
	 * @return
	 */
	public List<MonitorCount> queryByFenju(Map<Object, Object> map);
}
