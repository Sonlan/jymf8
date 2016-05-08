package org.jymf.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.core.modules.mapper.JsonMapper;
import org.jymf.dao.AuthorityMapper;
import org.jymf.entity.Authority;
import org.jymf.service.IAuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("authorityService")
public class AuthorityServiceImpl implements IAuthorityService {

	@Autowired
	private AuthorityMapper authMapper;
	
	@Override
	public String jsonAuthority(Map<String, Object> map) {
		
		List<Authority> list = authMapper.findAll(map);
		JsonMapper jsonMapper = new JsonMapper();
		String jsonAuth = jsonMapper.toJson(list);
		
		return jsonAuth;
	}

	@Override
	public String strAuthority(Map<String, Object> map) {
		
		List<Authority> list = authMapper.findAll(map);
		String strAuthority = "";
		for(int i=0;i<list.size();i++){
			if(i==list.size()-1){
				strAuthority+=list.get(i).getId();
			}else{
				strAuthority+=list.get(i).getId()+"#";
			}
		}
		return strAuthority;
	}

	@Override
	public void addAuthority(String[] authArr, String userId, int authType) {
		
		//删除该用户原有的权限
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("authType", authType);
		map.put("userId", userId);
		authMapper.deleteAuthById(map);
		
		for(String auth : authArr){
			if(!(auth.equals(""))){
				map.put("auth",auth);
				authMapper.addAuth(map);
			}
		}
	}
	
}
