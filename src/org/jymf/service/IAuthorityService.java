package org.jymf.service;

import java.util.Map;

public interface IAuthorityService {

	/**
	 * 将某用户所具有的权限转成json串
	 * @param map key (userId 用户ID authType 权限类型)
	 */
	public String jsonAuthority(Map<String,Object> map);
	
	
	/**
	 * 将某用户的所具有的权限编号用#拼接
	 * etc  010101#010201#030201 
	 */
	public String strAuthority(Map<String,Object> map);

	/**
	 * 新增用户时添加权限
	 * @param authArr 权限编号数组
	 * @param userId 用户ID
	 * @param authType 权限类型 （1=企业 2=监管）
	 */
	public void addAuthority(String[] authArr, String userId, int authType);
	
	
}
