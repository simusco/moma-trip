package com.moma.framework.pagination;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Pagination implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1768306776032845344L;
	private List<Object> list = new ArrayList<Object>();
	private int pageSize;
	private int currPage;
	private long total;
	private Map<String, Object> params = new HashMap<String, Object>();

	public Pagination() {
		this.pageSize = 15;
		currPage = 1;
		total = 0;
	}

	public List<Object> getList() {
		return list;
	}

	public void setList(List<Object> list) {
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		
		if(pageSize <= 0 || pageSize > 1000)
			pageSize = 15;
		
		this.pageSize = pageSize;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public long getTotal() {
		return total;
	}

	public void setTotalRow(long total) {
		this.total = total;
	}

	public Map<String, Object> getParams() {
		return params;
	}

	public void setParams(Map<String, Object> params) {
		this.params = params;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public Map<String, Object> map(){
		
		Map<String, Object> p = new HashMap<String, Object>();
		p.putAll(params);
		p.put("pageSize", this.pageSize);
		p.put("currPage", this.currPage);
		
		int from = 1;
		if(this.currPage > 1)
			from = (this.pageSize * (this.currPage -1)) + 1;
		int to = from + (this.pageSize -1);
		
		p.put("from", from);
		p.put("to", to);
		
		return p;
	}
	
}
