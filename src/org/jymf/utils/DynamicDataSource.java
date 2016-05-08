package org.jymf.utils;

import java.math.BigDecimal;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {  
  
    private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();  

    /**
     * 根据追溯模式获取对应的数据库
     * 基础数据库时 workMode <- -1
     * @param workMode
     */
    public static void setDataSource(BigDecimal workMode){
    	String lookupKey="jydb";

    	switch(workMode.intValue()){
    	case 8:
    		lookupKey+="08";
    		break;
    	}
    	
    	//String oldDataSource = (String) contextHolder.get();
    	
    	//if(!lookupKey.equals(oldDataSource)){
    	    contextHolder.set(lookupKey);  
    	//}
    }
    
	/* 
     * (non-Javadoc) 
     *  
     * @see 
     * org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource# 
     * determineCurrentLookupKey() 
     */  
    @Override  
    protected Object determineCurrentLookupKey() {  
        return getDataSource();  
    }  
  
    public static String getDataSource() {
    	return (String) contextHolder.get();
	}
    
    public static void setDataSource(String dataSource){
		contextHolder.set(dataSource);
    }
    
    public static void clearDataSource() {  
        contextHolder.remove();  
    }  
}  