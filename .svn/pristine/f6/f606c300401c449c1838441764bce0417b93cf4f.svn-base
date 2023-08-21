package kr.or.ddit.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.mapper.AdGradManageMapper;
import kr.or.ddit.admin.service.AdGradManageService;
import kr.or.ddit.vo.GradVO;

@Service
public class AdGradManageServiceImpl implements AdGradManageService{
	
	@Autowired
	AdGradManageMapper adGradManageMapper;
	
	// 등급 목록
	@Override
	public List<GradVO> gradList() {
		return this.adGradManageMapper.gradList();
	}

	// 등급 정보 상세
	@Override
	public GradVO gradDetail(String gradId) {
		return this.adGradManageMapper.gradDetail(gradId);
	}

	// 등급 정보 갱신
	@Override
	public int gradUpdate(GradVO gradVO) {
		return this.adGradManageMapper.gradUpdate(gradVO);
	}
}
