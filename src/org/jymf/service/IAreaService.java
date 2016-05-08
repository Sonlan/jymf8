package org.jymf.service;

import java.util.List;

import org.jymf.entity.Area;
import org.jymf.entity.LibHnum;
import org.jymf.entity.LibPort;
import org.jymf.entity.LibWorldArea;

public interface IAreaService {
	
	List<Area> findToCounty();

	List<Area> findCity();

	List<LibPort> findPort();

	List<LibWorldArea> findWorldArea();

	List<LibHnum> findHnum();
}
