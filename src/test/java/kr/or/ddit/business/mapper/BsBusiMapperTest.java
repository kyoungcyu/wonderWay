package kr.or.ddit.business.mapper;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.or.ddit.vo.BusiVO;

public class BsBusiMapperTest {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] {"test-context.xml"});

		BsBusiMapper bsBusiMapper = (BsBusiMapper)context.getBean("bsBusiMapper");
		System.out.println(bsBusiMapper);

		List<BusiVO> list = bsBusiMapper.busiList();
		System.out.println(list.size());

		for(BusiVO listBusiVO: list) {

			System.out.println(listBusiVO);
		}

	}
}
