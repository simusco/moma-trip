package com.moma.framework.excel;

public interface MessageCollector {

	public void add(String String);
	
	public void add(Integer row, Integer column, String message);

}
