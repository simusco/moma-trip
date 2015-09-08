package com.moma.framework.excel;

import java.util.ArrayList;
import java.util.List;

public class SimpleMessageCollector implements MessageCollector {

	private String[] columnLabels = new String[] { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N",
			"O", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "AA", "AB", "AC", "AD", "AE", "AF", "AG", "AH" };

	private List<String> messages = new ArrayList<String>();
	
	public List<String> get(){
		return messages;
	}
	
	public void add(String message) {
		this.messages.add(message);
	}

	public void add(Integer row, Integer column, String message) {
		this.add("µÚ"+(row + 1)+"ÐÐ"+columnLabels[column]+"ÁÐ£º"+message);
	}

	public boolean has(){
		return messages.isEmpty() ? false : true;
	}
	
}
