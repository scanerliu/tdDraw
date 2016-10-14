package com.tiandu.custom.search;

import com.tiandu.common.search.SearchCriteria;

public class TdPainterSearchCriteria extends SearchCriteria {
	private Integer uid;
	private Integer sortBy; //排序方式1-时间,2-等级，3-推荐

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getSortBy() {
		return sortBy;
	}

	public void setSortBy(Integer sortBy) {
		this.sortBy = sortBy;
	}
}
