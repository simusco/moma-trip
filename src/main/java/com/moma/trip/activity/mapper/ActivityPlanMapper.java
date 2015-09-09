package com.moma.trip.activity.mapper;

import java.util.List;
import java.util.Map;

public interface ActivityPlanMapper {

	Long getPaginationTotal(Map<String, Object> params);

	List<Object> getPaginationList(Map<String, Object> params);

}
