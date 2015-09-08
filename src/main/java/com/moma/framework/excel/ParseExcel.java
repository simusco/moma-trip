package com.moma.framework.excel;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.formula.functions.T;

public interface ParseExcel {

	public List<T> parse(InputStream is, MessageCollector collector, Map<String, Object> params);
	
}
