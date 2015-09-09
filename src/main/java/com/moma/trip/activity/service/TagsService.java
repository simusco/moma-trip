package com.moma.trip.activity.service;

import java.util.List;
import java.util.Map;

import com.moma.trip.common.po.activity.Tags;

public interface TagsService {

	public Map<Tags, List<Tags>> getAllTags();
	
}
