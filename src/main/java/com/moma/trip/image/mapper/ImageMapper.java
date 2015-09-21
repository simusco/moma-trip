package com.moma.trip.image.mapper;

import java.util.List;

import com.moma.trip.common.po.image.Image;

public interface ImageMapper {

	public List<Image> getImageByOwnerId(String ownerId);
	
	public List<Image> getImageByOwnerIdAndImgType(String ownerId, String imageType);
	
	public Image getImageById(String imageId);
	
}
