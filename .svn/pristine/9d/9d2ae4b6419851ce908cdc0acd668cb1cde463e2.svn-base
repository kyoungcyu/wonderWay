package kr.or.ddit.io;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;

public class FileWriterTest {
	public static void main(String[] args) {
		List<String> lines = new ArrayList<String>();
		for(int i=0;i<100;i++) {
			String line = "나는 "+(i+1)+"번째 라인 입니다.";
			lines.add(line);
//			System.out.println(line);
		}

		File file = new File("d:/temp/test.txt");
		try {
			FileUtils.writeLines(file, "UTF-8", lines);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
