package com.moma.trip.activity.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.moma.framework.pagination.Pagination;
import com.moma.trip.activity.mapper.ActivityPlanMapper;
import com.moma.trip.activity.service.ActivityPlanService;
import com.moma.trip.activity.service.TagsService;
import com.moma.trip.common.po.activity.ActivityPlan;
import com.moma.trip.common.po.activity.Tags;

public class ActivityPlanServiceImpl implements ActivityPlanService {

	private ActivityPlanMapper activityPlanMapper;
	private TagsService tagsService;

	public ActivityPlanMapper getActivityPlanMapper() {
		return activityPlanMapper;
	}

	public void setActivityPlanMapper(ActivityPlanMapper activityPlanMapper) {
		this.activityPlanMapper = activityPlanMapper;
	}

	public TagsService getTagsService() {
		return tagsService;
	}

	public void setTagsService(TagsService tagsService) {
		this.tagsService = tagsService;
	}

	public Pagination getActivityPlanPageList(Pagination pagination) {

		Map<String, Object> params = pagination.map();

		Long total = activityPlanMapper.getPaginationTotal(params);
		List<ActivityPlan> list = activityPlanMapper.getPaginationList(params);

		if(list != null){
			for(int i=0;i<list.size();i++){
				ActivityPlan ap = (ActivityPlan) list.get(i);
				List<Tags> tags = activityPlanMapper.getActivityPlanTags(ap.getActivityPlanId());
				
				ap.setTags(getActivityTags(tags));
			}
		}
		
		
		pagination.setList(list);
		pagination.setTotal(total);

		return pagination;
	}

	public Map<Tags, List<Tags>> getActivityTags(List<Tags> tags){
		Map<Tags, List<Tags>> maps = new HashMap<Tags, List<Tags>>();
		for(int j=0;j<tags.size();j++){
			Tags tag = tags.get(j);
			
			Tags p = new Tags();
			p.setTagId(tag.getParentId());
			p.setTag(tag.getpName());
			
			List<Tags> ll = maps.get(p);
			if(ll == null){
				ll = new ArrayList<Tags>();
				maps.put(p, ll);
			}
			
			ll.add(tag);
		}
		return maps;
	}
	
}




