package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.NoticeDao;
import com.tj.ex.dto.NoticeDto;

public class NContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int NNum = Integer.parseInt(request.getParameter("NNum"));
		NoticeDao noticeDao = NoticeDao.getInstance();
		NoticeDto dto = noticeDao.contentView(NNum);
		request.setAttribute("content_view", dto);
	}
	
}
