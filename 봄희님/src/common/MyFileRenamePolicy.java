package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	// cos.jar가 있어야만 FileRenamePolicy import가능
	// 파일명을 바꾸게 하는 클래스
	
	@Override
	public File rename(File originFile) {
		
		long currentTime = System.currentTimeMillis();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		int ranNum = (int)(Math.random()*100000);
		
		String name = originFile.getName();
		String ext = null;
		
		int dot = name.lastIndexOf("."); // 가장 마지막에 있는 인덱스에 있는 .(확장자)
		if(dot != -1) { // 위치(확장자)가 존재한다면
			ext = name.substring(dot); // 처음부터 끝까지 가지고 와
		} else { // 확장자가 존재하지 않는다면
			ext = "";
		}
		
		String fileName = sdf.format(new Date(currentTime)) + ranNum + ext; // 이때 Date는 util로 import
		File newFile = new File(originFile.getParent(), fileName); // 내가 바꿔놓은 파일에 대해 리턴
		
		return newFile;
	}

}
