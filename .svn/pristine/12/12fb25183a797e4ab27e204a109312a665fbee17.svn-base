package org.jymf.utils;

import java.io.File;
import java.math.BigDecimal;
import java.util.LinkedHashMap;

public class Constants {

	/** 公司图片类型 */
	public static final String PHOTO_TYPE_COMPANY = "company";

	/** 合同图片类型 */
	public static final String PHOTO_TYPE_PRODUCT = "product";
	
	/** 产品图片类型 */
	public static final String PHOTO_TYPE_DOCUMENT = "document";
			
	/** 图片显示高度 */
	public static final int PHOTO_IMG_HEIGHT = 150;

	/** 图片显示宽度 */
	public static final int PHOTO_IMG_WIDTH = 150;

	/** 图片最大值 60K = 60 * 1024 */
	public static final int PHOTO_MAX_SIZE = 61440;
	
	/** 管理员用户ID  */
	public static final String SESSION_ADMIN="jymfadmin";
	
	/** 公司用户登录 */
	public static final String SESSION_COMPANY_USER="companyuser";

	/** 公司基本信息 Session 传值使用 */
	public static final String SESSION_COMPANY_BASE="companybase";
	
	/** 公司产品类型信息 Session 传值使用 */
	public static final String SESSION_PRODUCT_TYPE="producttype";
	
	/** 企业用户权限值保存 */
	public static final String SESSION_AUTHORITY="authority";
	
	/** 管理员信息 Session 传值使用 
	 * update by wfj 2015.5.26
	 */
	public static final String SESSION_ADMINUSER="adminuser";
	
	/** 产品后退 */
	public static final String SESSION_PRODUCT_BACK="productback";
	
	/** 标签为主导的batch处理标识 */
	public static final String BATCH_LABEL_RUN="batchLabelFirstRun";
	
	/** 出库为主导的batch处理标识 */
	public static final String BATCH_OUTPUT_RUN="batchOutputFirstRun";
	
	/** 代理商基本信息 Session 传值使用 */
	public static final String SESSION_AGENT="agent";
	
	public static final BigDecimal DEFAULT_WORK_MODE = new BigDecimal(-1);
	
	/** 产品模式 **/
	public static final BigDecimal WM_CP = new BigDecimal(0);
	
	/** 厂家模式 **/
	public static final BigDecimal WM_CJ = new BigDecimal(1);
	
	/** 商城模式 **/
	public static final BigDecimal WM_SHCH = new BigDecimal(2);
	
	/** 汽配模式 **/
	public static final BigDecimal WM_QP = new BigDecimal(3);
	
	/** 出版物模式 **/
	public static final BigDecimal WM_CBW = new BigDecimal(4);
	
	/** 佛教模式 **/
	public static final BigDecimal WM_FJ= new BigDecimal(5);
	
	/** 酒类模式 **/
	public static final BigDecimal WM_JL = new BigDecimal(6);
	
	/** 快销品模式 **/
	public static final BigDecimal WM_KXP = new BigDecimal(7);
	
	/** 进出口模式 **/
	public static final BigDecimal WM_JCK = new BigDecimal(8);
	
	/**服务器图片存储相对路径*/
	public static final String CACHE_FOLDER=String.format("static%scache_img%s",File.separator,File.separator);
	
	/**
	 * 各种追溯模式静态变量，用于展示下拉列表框
	 * <br>0=产品追溯模式
	 * <br>1=厂家追溯模式
	 * <br>2=商城追溯模式
	 * <br>3=汽配追溯模式
	 * <br>4=出版物追溯模式
	 * <br>5=佛教追溯模式
	 * <br>6=酒类追溯模式
	 * <br>7=快消品追溯模式
	 * <br>update by wfj @ 2015-3-25 
	 * */
	public static final LinkedHashMap<String, String> workModelMap=new LinkedHashMap<String,String>();
	public static final  LinkedHashMap<String, String> shippingType = new LinkedHashMap<String,String>();
	static{
		workModelMap.put("0", "产品追溯模式"); 
		workModelMap.put("1", "厂家追溯模式");
		workModelMap.put("2", "商城追溯模式");
		workModelMap.put("3", "汽配追溯模式");
		workModelMap.put("4", "出版物追溯模式");
	    workModelMap.put("5", "佛教追溯模式");
	    workModelMap.put("6", "酒类追溯模式");
	    workModelMap.put("7", "快消品追溯模式");
	    workModelMap.put("8", "进出口追溯模式");
	    
	    
	    shippingType.put("1", "水路运输");
	    shippingType.put("2", "铁路运输");
	    shippingType.put("3", "公路运输");
	    shippingType.put("4", "航空运输");
	    shippingType.put("5", "邮件运输");
	}
		
	/**  销售区域: 参考文件jy_salearea.csv  **/
	public static final String CONFIG_SALE_AREA = "jy_salearea.csv";
	
	/**  产品类型: 参考文件jy_producttype.csv  **/
	public static final String CONFIG_PRODUCT_TYPE = "jy_producttype.csv";
	
	/**  产品: 参考文件jy_product.csv **/
	public static final String CONFIG_PRODUCT = "jy_product.csv";
	
	
	
}
