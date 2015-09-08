package com.moma.framework.excel;

import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.ss.formula.functions.T;

public interface ParseRowMapper {

	T parse(HSSFRow hssfRow, MessageCollector collector, Map<String, Object> params);

}
