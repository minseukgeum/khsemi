package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import admin.model.service.AdminService;
import admin.model.vo.BAttachment;
import admin.model.vo.Banner;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class mainBannerUpdateServlet
 */
@WebServlet("/mainBannerUpdate.ad")
public class mainBannerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainBannerUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "main_uploadFiles/";

			File f = new File(savePath);
			if (!f.exists()) {
				f.mkdir();
			}

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			// 이제 multiRequest로 접근 가능!
			int bId = Integer.parseInt(multiRequest.getParameter("bId"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String[] fId = multiRequest.getParameterValues("fId");
			String[] oldFiles = multiRequest.getParameterValues("oldFileName");

			ArrayList<String> saveFiles = new ArrayList<String>();// 바뀐 파일의 이름
			ArrayList<String> originFiles = new ArrayList<String>();// 원래 파일의 이름

			Enumeration<String> files = multiRequest.getFileNames();// 폼에서 전송된 파일 리스트의 이름 반환
			while (files.hasMoreElements()) {
				String name = files.nextElement();

				if (multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			Banner banner = new Banner();
			banner.setBannerId(bId);
			banner.setBannerTitle(title);
			banner.setBannerContent(content);

			ArrayList<BAttachment> fileList = new ArrayList<BAttachment>();
			// for문 역순으로 돌리기
			int j = 0;
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				BAttachment at = new BAttachment();
				at.setBannerId(bId);
				at.setFileId(Integer.parseInt(fId[j++]));
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));

				fileList.add(at);
			}

			/*
			 * int result = new AdminService().updateMainBanner(banner, oldFiles, fileList);
			 * System.out.println("" + result);
			 * 
			 * if (result > 0) { for (int i = 0; i < oldFiles.length; i++) { File oldFile =
			 * new File(savePath + oldFiles[i]); oldFile.delete(); }
			 * response.sendRedirect("main.ad"); } else { for (int i = 0; i <
			 * saveFiles.size(); i++) { File failedFile = new File(savePath +
			 * saveFiles.get(i)); failedFile.delete(); }
			 * 
			 * request.setAttribute("msg", "메인배너 수정에 실패하였습니다.");
			 * request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp"); }
			 */
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
