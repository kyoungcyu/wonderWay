package kr.or.ddit.admin.mapper;

import java.util.List;
import kr.or.ddit.vo.GradVO;

public interface AdGradManageMapper {
	// 등급 목록
	public List<GradVO> gradList();
	
	// 등급 정보 상세
	public GradVO gradDetail(String gradId);
	
	// 등급 정보 갱신
	public int gradUpdate(GradVO gradVO);
}
