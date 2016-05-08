package org.jymf.dao;

import java.util.List;
import java.util.Map;

import org.jymf.entity.Authority;

public interface AuthorityMapper {

	/**
	 *查询某ID的全部权限内容
	 */
	List<Authority> findAll(Map<String,Object> map);

	/**
	 * 将某用户的权限全部删掉
	 */
	void deleteAuthById(Map<String, Object> map);

	/**
	 * 用户添加权限
	 */
	void addAuth(Map<String, Object> map);
	
}
