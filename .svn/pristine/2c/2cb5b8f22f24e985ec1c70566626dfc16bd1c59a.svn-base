package kr.or.ddit.io;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

public class DirectoryReaderTest {
	public static void main(String[] args) {
		File file = new File("C:\\eGovFrameDev-4.1.0-64bit\\workspace\\wonderWay\\src\\main");
		String[] extentions = {"java", "jsp"};
		List<File> files = (List<File>) FileUtils.listFiles(file, extentions, true);
		List<String> javaFiles = new ArrayList<String>();
		List<String> jspFiles = new ArrayList<String>();
		for(File inFile:files) {
			//System.out.println(inFile.getAbsolutePath());
			String fullPath = inFile.getAbsolutePath();
			String extenstion = FilenameUtils.getExtension(fullPath);
			if("java".equals(extenstion)) {
				javaFiles.add(fullPath);
			}else if("jsp".equals(extenstion)) {
				jspFiles.add(fullPath);
			}

//			System.out.println(FilenameUtils.getExtension(fullPath));
		}

		System.out.println("javaFiles : "+javaFiles.size());
		System.out.println("jspFiles : "+jspFiles.size());

		File srcFile = new File("d:/temp/test_변경.txt");
		File targetFile = new File("d:/temp/2023/5/24/test.txt");
		try {
			FileUtils.moveFile(srcFile, targetFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
