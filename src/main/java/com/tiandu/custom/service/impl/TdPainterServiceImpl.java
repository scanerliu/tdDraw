package com.tiandu.custom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tiandu.common.db.DBContextHolder;
import com.tiandu.custom.entity.TdAgent;
import com.tiandu.custom.entity.TdPainter;
import com.tiandu.custom.entity.mapper.TdPainterMapper;
import com.tiandu.custom.search.TdAgentSearchCriteria;
import com.tiandu.custom.search.TdPainterSearchCriteria;
import com.tiandu.custom.service.TdPainterService;
import com.tiandu.custom.service.TdUserService;

@Service("tdPainterService")
public class TdPainterServiceImpl implements TdPainterService {
	
	@Autowired
	TdPainterMapper tdPainterMapper;
	
	@Autowired
	TdUserService tdUserService;
	
	@Override
	public int insert(TdPainter u) {
		DBContextHolder.setDbType(DBContextHolder.DB_RW);
		return tdPainterMapper.insert(u);
	}

	@Override
	public TdPainter findOne(Integer id) {
		return tdPainterMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<TdPainter> findBySearchCriteria(TdPainterSearchCriteria sc) {
		Integer count = tdPainterMapper.countByCriteria(sc);
		sc.setTotalCount(count);
		List<TdPainter> agentList = tdPainterMapper.findBySearchCriteria(sc);
		return agentList;
	}
	
	
	@Override
	public int countByCriteria(TdPainterSearchCriteria sc) {
		return tdPainterMapper.countByCriteria(sc);
	}

	@Override
	public Integer save(TdPainter painter) {
		if(null!=painter){
			if(null!=painter.getPid()){//更新
				return tdPainterMapper.updateByPrimaryKey(painter);
			}else{
				return tdPainterMapper.insert(painter);
			}
		}
		return null;
	}

	@Override
	public Integer delete(Integer id) {
		return tdPainterMapper.deleteByPrimaryKey(id);
	}

	@Override
	public TdPainter findByUid(Integer uid) {
		return tdPainterMapper.findByUid(uid);
	}
	
}
