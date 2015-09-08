package com.moma.trip.common.po.activity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ActivityPlan implements Serializable {

	private String activityPlanId;
	private String name;
	private String description;
	private BigDecimal price;
	private String priceDesc;
	private String takeTime;
	private String traffic;
	private BigDecimal minPepoleNum;
	private BigDecimal maxPepoleNum;
	private BigDecimal preRegDay;
	private String destination;
	private String departure;
	private Timestamp createTime;
	private Integer sort;
	
	private List<ImageType> imageTypeList = new ArrayList<ImageType>();
	private List<ActivityTag> activityTagList = new ArrayList<ActivityTag>();

	
	
}
