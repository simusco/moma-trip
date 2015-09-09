package com.moma.trip.activity.service.impl;

import java.util.List;
import java.util.Map;

import com.moma.framework.pagination.Pagination;
import com.moma.trip.activity.mapper.ActivityPlanMapper;
import com.moma.trip.activity.service.ActivityPlanService;

public class ActivityPlanServiceImpl implements ActivityPlanService {

	private ActivityPlanMapper activityPlanMapper;

	public ActivityPlanMapper getActivityPlanMapper() {
		return activityPlanMapper;
	}

	public void setActivityPlanMapper(ActivityPlanMapper activityPlanMapper) {
		this.activityPlanMapper = activityPlanMapper;
	}

	// TODO
	public Pagination getActivityPlanPageList(Pagination pagination) {
		
		Map<String, Object> params = pagination.map();
		
		Long total = activityPlanMapper.getPaginationTotal(params);
		List<Object> list = activityPlanMapper.getPaginationList(params);
	
		pagination.setList(list);
		pagination.setTotal(total);
		
		return pagination;
	}

}
