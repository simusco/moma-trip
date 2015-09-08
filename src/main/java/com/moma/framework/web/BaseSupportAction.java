package com.moma.framework.web;

import com.opensymphony.xwork2.ActionSupport;

public class BaseSupportAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4857242148451348368L;

	public static String JSON = "json";
	private WebResult webResult;

	public WebResult getWebResult() {
		return webResult;
	}

	protected String success(Object object) {
		webResult = new WebResult(object, null, true);
		
		return JSON;
	}

	protected String error(Object object, String message) {
		webResult = new WebResult(object, message, false);
		
		return JSON;
	}

}
