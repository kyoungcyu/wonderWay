package kr.or.ddit.io;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;

public class FileReaderTest {
	public static void main(String[] args) {
		File file = new File("d:/temp/test.txt");

		try {
//			List<String> lines = FileUtils.readLines(file, "UTF-8");
//			for(String line:lines) {
//				System.out.println(line);
//			}
			String contents = FileUtils.readFileToString(file, "UTF-8");
			System.out.println(contents);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
