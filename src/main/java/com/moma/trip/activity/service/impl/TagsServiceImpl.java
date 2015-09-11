package com.moma.trip.activity.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.moma.trip.activity.mapper.TagsMapper;
import com.moma.trip.activity.service.TagsService;
import com.moma.trip.common.po.activity.Tags;

public class TagsServiceImpl implements TagsService {

	private TagsMapper tagsMapper;

	public TagsMapper getTagsMapper() {
		return tagsMapper;
	}

	public void setTagsMapper(TagsMapper tagsMapper) {
		this.tagsMapper = tagsMapper;
	}

	public Map<Tags, List<Tags>> getAllTags() {
		
		List<Tags> tags = tagsMapper.getAllTags();
		int tagsSize = tags.size();
		
		Map<Tags, List<Tags>> mapTags = new TreeMap<Tags, List<Tags>>();
		for(int i=0;i<tagsSize;i++){
			Tags tag = tags.get(i);
			
			if("-1".equals(tag.getParentId())){
				mapTags.put(tag, new ArrayList<Tags>());
			}
			
			if("true".equals(tag.getValue())){
				tag.setActive(true);
			}
		}
		
		for(int j=0;j<tags.size();j++){
			Tags t = tags.get(j);
			Tags p = new Tags();
			p.setTagId(t.getParentId());
			
			List<Tags> ll = mapTags.get(p);
			if(ll != null){
				ll.add(t);
			}
		}
		
		return mapTags;
	}

}
