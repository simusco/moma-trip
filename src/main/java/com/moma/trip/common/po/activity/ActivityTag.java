package com.moma.trip.common.po.activity;

import java.io.Serializable;

public class ActivityTag implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3024533257502753744L;
	private String activityTagsId;
	private String activityPlanId;
	private String tagId;
	private String tagName;
	private String tagType;
	private Integer sort;

	public String getActivityTagsId() {
		return activityTagsId;
	}

	public void setActivityTagsId(String activityTagsId) {
		this.activityTagsId = activityTagsId;
	}

	public String getActivityPlanId() {
		return activityPlanId;
	}

	public void setActivityPlanId(String activityPlanId) {
		this.activityPlanId = activityPlanId;
	}

	public String getTagId() {
		return tagId;
	}

	public void setTagId(String tagId) {
		this.tagId = tagId;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public String getTagType() {
		return tagType;
	}

	public void setTagType(String tagType) {
		this.tagType = tagType;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

}
