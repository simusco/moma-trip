package com.moma.trip.activity.service;

import com.moma.framework.pagination.Pagination;
import com.moma.trip.common.po.activity.ActivityPlan;

public interface ActivityPlanService {

	public Pagination getActivityPlanPageList(Pagination pagination);

	public ActivityPlan getActivityPlanById(String activityPlanId);

}
