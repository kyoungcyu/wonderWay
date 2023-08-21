package kr.or.ddit.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.util.ItemDTO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MemVO;

public interface MmCartService {


	int checkDupl(String rmId, int rmNum, ArrayList<ItemDTO> itemList);

	public String addItem(ItemDTO itemDTO, ArrayList<ItemDTO> itemList);

	void removeItem(String rmId, int rmNum, ArrayList<ItemDTO> itemList);
	




	
	
}
