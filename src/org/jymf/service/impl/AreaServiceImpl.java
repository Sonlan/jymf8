package org.jymf.service.impl;

import java.util.List;

import org.jymf.dao.AreaMapper;
import org.jymf.dao.LibHnumMapper;
import org.jymf.dao.LibPortMapper;
import org.jymf.dao.LibWorldAreaMapper;
import org.jymf.entity.Area;
import org.jymf.entity.LibHnum;
import org.jymf.entity.LibPort;
import org.jymf.entity.LibWorldArea;
import org.jymf.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("areaService")
public class AreaServiceImpl implements IAreaService {

	@Autowired
	private AreaMapper areaDao;

	@Autowired
	private LibPortMapper portDao;
	
	@Autowired
	private LibWorldAreaMapper worldAreaDao;
	
	@Autowired
	private LibHnumMapper hnumDao;
	
	@Override
	public List<Area> findToCounty() {
		return areaDao.findToCounty();
	}
	
	@Override
	public List<Area> findCity(){
		return  areaDao.findCity();
	}

	@Override
	public List<LibPort> findPort() {
		
		return portDao.findAll();
	}

	@Override
	public List<LibWorldArea> findWorldArea() {
		return worldAreaDao.findAll();
	}

	@Override
	public List<LibHnum> findHnum() {
		return hnumDao.findAll();
	}
	
}
