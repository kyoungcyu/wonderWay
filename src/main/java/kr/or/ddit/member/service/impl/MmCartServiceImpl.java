package kr.or.ddit.member.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.ddit.member.mapper.MmMemMapper;
import kr.or.ddit.member.service.MmCartService;
import kr.or.ddit.member.service.MmMemService;
import kr.or.ddit.util.ItemDTO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MemVO;
import lombok.extern.slf4j.Slf4j;

//골뱅이Service 애너테이션 : 스프링이 자바빈으로 등록하여 관리
@Slf4j
@Service
public class MmCartServiceImpl implements MmCartService {
	

	
	//상품 번호(itemNo)에 해당하는 상품 아이템이 
	// 없으면 -1 리턴
	// 있으면 해당 상품 아이템 객체의 리스트에서의 인덱스를 반환
	@Override
	public int checkDupl(String rmId, int rmNum, ArrayList<ItemDTO> itemList) {
		int index = -1;
		
		// i = 리스트 인덱스 번호
		// index = 리스트에 존재하는 상품의 위치(인덱스)
		for (int i=0; i < itemList.size(); i++) {
			// 리스트에 i번째(인덱스)의 itemNo가 입력받은 itemNo와 일치했을 때,
			// index는 아이템의 위치를 반환해준다.
			if (itemList.get(i).getRmId().contentEquals(rmId)
					&&itemList.get(i).getRmNum()==rmNum) {
				 index = i ;
				 break;
			}
		}
		return index;
	}
	
	/*
	 * addItem(ItemDTO) : void
	 * 1) 장바구니에 상품 추가
	 * : 2) 장바구니에 상품아이템이 중복되면 DuplicateItemException을 발생시키고,
	 *      throw 한다.
	 */
	@Override
	public String addItem(ItemDTO itemDTO, ArrayList<ItemDTO> itemList) {
		//기존 리스트에 추가하려는 상품이 존재하면, (-1)
		String message;
		
		if (checkDupl(itemDTO.getRmId(),itemDTO.getRmNum(), itemList) != -1) {
			message="이미 장바구니에 추가된 상품입니다";
			
			return message;
		}else{
			//중복되지 않으면, add
			message="장바구니에 추가되었습니다";
			itemList.add(itemDTO);
			
			return message;
		}
		
	}
	
	/*
	 * removeItem(String itemNo) : void
	 * 3) 장바구니에서 상품을 삭제
	 */
	@Override
	public void removeItem(String rmId,int rmNum,ArrayList<ItemDTO> itemList) {
		// 해당 상품의 index를 받아옴
		int index = checkDupl(rmId, rmNum, itemList);
		//list에서 해당 index 객체 삭제
		itemList.remove(index);
	}
	
	

	
	
}










