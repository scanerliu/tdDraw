package com.tiandu.custom.service;

import java.util.List;

import com.tiandu.custom.entity.TdPainter;
import com.tiandu.custom.search.TdPainterSearchCriteria;

public interface TdPainterService {

	public int insert(TdPainter u);
	public TdPainter findOne(Integer id);
	public List<TdPainter> findBySearchCriteria(TdPainterSearchCriteria sc);
	public Integer save(TdPainter TdAgent);
	public Integer delete(Integer id);
	public int countByCriteria(TdPainterSearchCriteria sc);
	/**
	 * 根据用户id查找代理
	 * @param uid
	 * @return
	 */
	public TdPainter findByUid(Integer uid);
}
