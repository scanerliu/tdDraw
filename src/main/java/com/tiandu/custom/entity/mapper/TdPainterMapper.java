package com.tiandu.custom.entity.mapper;

import java.util.List;

import com.tiandu.custom.entity.TdPainter;
import com.tiandu.custom.search.TdPainterSearchCriteria;

public interface TdPainterMapper {
    int deleteByPrimaryKey(Integer pid);

    int insert(TdPainter record);

    int insertSelective(TdPainter record);

    TdPainter selectByPrimaryKey(Integer pid);

    int updateByPrimaryKeySelective(TdPainter record);

    int updateByPrimaryKeyWithBLOBs(TdPainter record);

    int updateByPrimaryKey(TdPainter record);

	Integer countByCriteria(TdPainterSearchCriteria sc);

	List<TdPainter> findBySearchCriteria(TdPainterSearchCriteria sc);

	TdPainter findByUid(Integer uid);
	
	
    
    
}