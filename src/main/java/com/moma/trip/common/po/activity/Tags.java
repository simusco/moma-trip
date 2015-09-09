package com.moma.trip.common.po.activity;

import java.io.Serializable;

public class Tags implements Serializable, Comparable<Tags> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4468174041286450500L;
	private String tagId;
	private String tag;
	private String description;
	private Tags parent;
	private String parentId;
	private String sort;
	private String value;
	private boolean active = false;

	public Tags getParent() {
		return parent;
	}

	public void setParent(Tags parent) {
		this.parent = parent;
	}

	public String getTagId() {
		return tagId;
	}

	public void setTagId(String tagId) {
		this.tagId = tagId;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((tagId == null) ? 0 : tagId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Tags other = (Tags) obj;
		if (tagId == null) {
			if (other.tagId != null)
				return false;
		} else if (!tagId.equals(other.tagId))
			return false;
		return true;
	}

	public int compareTo(Tags o) {
		return this.getTagId().compareTo(o.getTagId());
	}

}
