package com.moma.trip.common.po.image;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ImageType implements Serializable {

	private String imageTypeId;
	private String activityPlanId;
	private String name;
	private Integer sort;
	
	private List<Image> activityImageList = new ArrayList<Image>(); 

	public String getImageTypeId() {
		return imageTypeId;
	}

	public void setImageTypeId(String imageTypeId) {
		this.imageTypeId = imageTypeId;
	}

	public String getActivityPlanId() {
		return activityPlanId;
	}

	public void setActivityPlanId(String activityPlanId) {
		this.activityPlanId = activityPlanId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public List<Image> getActivityImageList() {
		return activityImageList;
	}

	public void setActivityImageList(List<Image> activityImageList) {
		this.activityImageList = activityImageList;
	}

}
