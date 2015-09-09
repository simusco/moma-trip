package com.moma.trip.activity.web;

import java.util.List;

import com.moma.framework.pagination.Pagination;
import com.moma.framework.web.BaseSupportAction;
import com.moma.trip.activity.service.ActivityPlanService;
import com.moma.trip.common.po.activity.Tags;

public class ActivityPlanAction extends BaseSupportAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1803507408872865535L;

	private ActivityPlanService activityPlanService;

	private List<Tags> tags = null;
	private Pagination activityPlanList = null;

	public String query() {
		Pagination pagination = new Pagination();
		pagination.put("tags", tags);
		
		activityPlanList = activityPlanService.getActivityPlanPageList(pagination);
		return SUCCESS;
	}

	public ActivityPlanService getActivityPlanService() {
		return activityPlanService;
	}

	public void setActivityPlanService(ActivityPlanService activityPlanService) {
		this.activityPlanService = activityPlanService;
	}

	public List<Tags> getTags() {
		return tags;
	}

	public void setTags(List<Tags> tags) {
		this.tags = tags;
	}

	public Pagination getActivityPlanList() {
		return activityPlanList;
	}

	public void setActivityPlanList(Pagination activityPlanList) {
		this.activityPlanList = activityPlanList;
	}

}
