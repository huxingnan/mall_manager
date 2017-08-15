package com.sunshine.mall.manager.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunshine.mall.manager.bean.Model_Source;
import com.sunshine.mall.manager.mapper.IndexMapper;
import com.sunshine.mall.manager.service.IndexService;

@Service
public class IndexServiceImpl implements IndexService {

	@Autowired
	private IndexMapper indexMapper;
	
	@Override
	public List<Model_Source> getMainWest() {
		// TODO Auto-generated method stub
		List<Model_Source> list = indexMapper.selectLeftFromUI_west();
		
		Iterator<Model_Source> iterator = list.iterator();
		while(iterator.hasNext()) {
			Model_Source model_Source = iterator.next();
			if(model_Source.getPid() != 0) {
				iterator.remove();
			}
		}
		return list;
	}

}
