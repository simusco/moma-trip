package com.moma.trip.common.po.activity;

import java.io.Serializable;

public class Image implements Serializable {

	private String imageId;
	private String activityPlanId;
	private String imagesTypeId;
	private String imagesTypeName;
	private String server;
	private String path;
	private String imageName;
	private String imageDesc;
	private String type;
	private String sort;
	private String createTime;

	public String getImageId() {
		return imageId;
	}

	public void setImageId(String imageId) {
		this.imageId = imageId;
	}

	public String getActivityPlanId() {
		return activityPlanId;
	}

	public void setActivityPlanId(String activityPlanId) {
		this.activityPlanId = activityPlanId;
	}

	public String getImagesTypeId() {
		return imagesTypeId;
	}

	public void setImagesTypeId(String imagesTypeId) {
		this.imagesTypeId = imagesTypeId;
	}

	public String getImagesTypeName() {
		return imagesTypeName;
	}

	public void setImagesTypeName(String imagesTypeName) {
		this.imagesTypeName = imagesTypeName;
	}

	public String getServer() {
		return server;
	}

	public void setServer(String server) {
		this.server = server;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImageDesc() {
		return imageDesc;
	}

	public void setImageDesc(String imageDesc) {
		this.imageDesc = imageDesc;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
