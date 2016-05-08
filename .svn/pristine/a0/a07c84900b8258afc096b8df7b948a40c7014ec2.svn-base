package org.jymf.service.impl;

import java.util.List;

import org.core.modules.mapper.JsonMapper;
import org.jymf.dao.CustomsMonitorMapper;
import org.jymf.entity.CustomsMonitor;
import org.jymf.service.ICustomsMonitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("customsMonitorService")
public class CustomsMonitorServiceImpl implements ICustomsMonitorService {

	@Autowired
	private CustomsMonitorMapper customsMonitorDao;
	
	@Override
	public String getJsonCustomsMonitor(String monitorLibId) {
		List<CustomsMonitor> list = customsMonitorDao.findCustomsMonitor(monitorLibId);
		JsonMapper jsonMapper = new JsonMapper();
		return jsonMapper.toJson(list);
	}

}
