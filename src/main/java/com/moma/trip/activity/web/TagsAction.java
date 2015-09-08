package com.moma.trip.activity.web;

import java.util.Map;

import com.moma.framework.web.BaseSupportAction;
import com.moma.trip.activity.service.TagsService;
import com.moma.trip.common.po.activity.Tags;

public class TagsAction  extends BaseSupportAction{

	private TagsService tagsService;
	
	public String list(){
		
		//������:{id:1,name:'1��'}
		Map<String, Tags> tags = tagsService.getAllTags();
		
		
		return this.success(tags);
	}
	
}
