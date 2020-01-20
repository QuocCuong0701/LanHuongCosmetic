package com.lanhuongcosmetic.paging;

import com.lanhuongcosmetic.sort.Sorter;

public interface Pageble {
	Integer getPage();
	Integer getOffset();
	Integer getLimit();
	Sorter getSorter();
}
