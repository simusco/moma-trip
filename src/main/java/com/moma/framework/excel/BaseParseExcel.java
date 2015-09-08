package com.moma.framework.excel;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.T;

public class BaseParseExcel implements ParseExcel {

	private HSSFWorkbook hssfWorkbook;
	private ParseRowMapper rowMapper;

	public BaseParseExcel(ParseRowMapper rowMapper){
		this.rowMapper = rowMapper;
	}
	
	public List<T> parse(InputStream is, MessageCollector collector, Map<String, Object> params) {

		List<T> list = new ArrayList<T>();
		try {
			hssfWorkbook = new HSSFWorkbook(is);
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);

			if(hssfSheet == null){
				collector.add("没有找到Sheet表单!");
				return null;
			}
			
			for(int rowNum = 0; rowNum <= hssfSheet.getLastRowNum(); rowNum++){
		        HSSFRow hssfRow = hssfSheet.getRow( rowNum);
		        if(!isLastRow(hssfRow)){
		        	T o = rowMapper.parse(hssfRow, collector, params);
		        	list.add(o);
		        }
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			collector.add("解析过程出现错误!具体消息:"+e.getMessage());
		}
		
		return list;
	}

	protected boolean isLastRow(HSSFRow hssfRow) {
		return false;
	}

}
