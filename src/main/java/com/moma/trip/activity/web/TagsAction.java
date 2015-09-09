package com.moma.trip.activity.web;

import java.util.List;
import java.util.Map;

import com.moma.framework.web.BaseSupportAction;
import com.moma.trip.activity.service.TagsService;
import com.moma.trip.common.po.activity.Tags;

public class TagsAction extends BaseSupportAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -873065970274950570L;
	private TagsService tagsService;

	public TagsService getTagsService() {
		return tagsService;
	}

	public void setTagsService(TagsService tagsService) {
		this.tagsService = tagsService;
	}

	public String tags() {
		Map<Tags, List<Tags>> tags = tagsService.getAllTags();
		this.success(tags);
		
		
		return SUCCESS;
	}

}
