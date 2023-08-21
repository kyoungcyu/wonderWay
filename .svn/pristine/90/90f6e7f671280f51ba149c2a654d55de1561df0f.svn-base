package kr.or.ddit.util.poi;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.util.poi.mapper.PoiMapper;
import lombok.extern.slf4j.Slf4j;

@Service
public class PoiServiceImpl implements PoiService {
	
	@Autowired
	PoiMapper poiMapper;
	
	@Override
	public int tourInsert(Map<Object, Object> map) {
		//sercviceImpl : {column1=명칭, column5=개요, column4=경도, column3=위도, column2=주소}
		System.out.println("sercviceImpl : "+map);
		return this.poiMapper.tourInsert(map);		
	}
	@Override
	public int brdTourInsert(Map<Object, Object> map) {
		//sercviceImpl : {column1=mbti, column2=memId, column3=tour_id, column4=tour_nm}
		System.out.println("sercviceImpl : "+map);
		return this.poiMapper.brdTourInsert(map);		
	}
	@Override
	public int wishInsert(Map<Object, Object> map) {
		System.out.println("sercviceImpl : "+map);
		return this.poiMapper.wishInsert(map);		
	}
	
	
	
}
