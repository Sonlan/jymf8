package org.jymf.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.poifs.filesystem.OfficeXmlFileException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jymf.entity.MonitorCount;

public class ExcelUtil {

	FileManager fileManager = new FileManager(); 
	
	/**
	 * 每一页数据的行数（不包括头部，即每页共有1001行）
	 */
	public final int rowCount = 1000;
	
	/**
	 * 读取模版
	 */
	public synchronized Object readExcel(String filePath) {
		
		Workbook workBook = null;  
		InputStream in = null;
		try {
			
			File file = new File(filePath);
			in = new FileInputStream(file);
			workBook = new XSSFWorkbook(in);
		} catch (OfficeXmlFileException e) {
			try {
				workBook = new HSSFWorkbook(in);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workBook;
	}
	
	/**
	 * 创建并下载excel文件
	 * @param workbook 数据信息
	 * @param webRoot 项目跟路径
	 * @param fileName 要导出的excel的名称 例如 wor.xls
	 */
	public synchronized void createFile(Workbook workBook,String webRoot,String fileName,HttpServletRequest request,
			 				HttpServletResponse response){
		
		try {
			if(workBook instanceof HSSFWorkbook){
				workBook = (HSSFWorkbook)workBook;
			}else if(workBook instanceof XSSFWorkbook){
				workBook = (XSSFWorkbook)workBook;
			}
			String filePath1 = String.format("%s%s%s",webRoot,Constants.CACHE_FOLDER,fileName);
			OutputStream os = new FileOutputStream(new File(filePath1));
			workBook.write(os);
			os.close();
			fileManager.downloadFile(filePath1, fileName, request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 放入标签统计数量
	 */
	public synchronized Workbook setHsnumCountData(List<MonitorCount> list){
		
		Workbook workBook = new HSSFWorkbook();
		
		//数据页数
		int pageSize = list.size()/rowCount + 1;
		
		for(int i=0;i<pageSize;i++){
			Sheet sheet = workBook.createSheet();
			sheet = createHead(sheet,workBook);
			
			for(int j=0;j<rowCount;j++){
				//list的当前下标
				int k = i*rowCount + j;
				if(k>=list.size()){
					break;
				}
				
				Row row =sheet.createRow(j+1);
				Cell cell = row.createCell(0);
				cell.setCellValue(list.get(k).getHsname());
				cell = row.createCell(1);
				cell.setCellValue(list.get(k).getHsnum());
				cell = row.createCell(2);
				cell.setCellValue(String.valueOf(list.get(k).getHscount()));
			}
		}
		
		return workBook;
	}

	private Sheet createHead(Sheet sheet,Workbook workbook){
		//创建头部
		Row row = sheet.createRow(0);
		//li
		sheet.setColumnWidth(0, 10000);    
	    sheet.setColumnWidth(1, 4000);    
	    sheet.setColumnWidth(2, 4000); 
		
		HSSFCellStyle headerStyle = (HSSFCellStyle) workbook.createCellStyle();    
		headerStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体    
		headerStyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色．    
		headerStyle.setFillBackgroundColor(HSSFColor.BROWN.index);// 设置单元格的背景颜色．    
		
		Cell cell = row.createCell(0);
		cell.setCellValue("编码名称");
		cell.setCellStyle(headerStyle);
		cell = row.createCell(1);
		cell.setCellStyle(headerStyle);
		cell.setCellValue("编码");
		cell = row.createCell(2);
		cell.setCellStyle(headerStyle);
		cell.setCellValue("使用量");
		
		return sheet;
	}
	
}
