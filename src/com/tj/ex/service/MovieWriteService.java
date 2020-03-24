package com.tj.ex.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tj.ex.dao.MovieDao;
import com.tj.ex.dao.NoticeDao;
import com.tj.ex.dto.AdminDto;

public class MovieWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("moviePhotoUp");
		int maxSize = 1024*1024*100; // 최대업로드 사이즈는 10M
		MultipartRequest mRequest = null;
		String MPhoto = "";
		try {
			mRequest = new MultipartRequest(request, path, maxSize, 
									"utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			MPhoto = mRequest.getFilesystemName(param);
			HttpSession httpSession = request.getSession();
			String MTitle = mRequest.getParameter("MTitle");
			String MStory = mRequest.getParameter("MStory");
			String MDName = mRequest.getParameter("MDName");
			String MActor = mRequest.getParameter("MActor");
			String MW = mRequest.getParameter("MW");
			int MBRank = Integer.parseInt(mRequest.getParameter("MBRank"));
			String MRdate = mRequest.getParameter("MRdate");		
			MovieDao movieDao = MovieDao.getInstance();
			int result = movieDao.write(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate);
			// joinMember결과에 따라 적절히 request.setAttribute
			if(result == MovieDao.SUCCESS) {
				request.setAttribute("resultMsg", "영화등록 성공");
			}else {
				request.setAttribute("resultMsg", "영화등록 실패");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("resultMsg", "영화등록 실패");
		}
		// 서버에 올라간 fileboardUp 파일을 소스폴더에 filecopy
		File serverFile = new File(path+"/"+MPhoto);
		if(serverFile.exists()) {
			InputStream  is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/오전수업/mega_IT/source/7.jQuery/1st Project/WebContent/moviePhotoUp/"+MPhoto);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true) {
					int nByteCnt = is.read(bs);
					if(nByteCnt==-1) break;
					os.write(bs, 0, nByteCnt);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
	}
}