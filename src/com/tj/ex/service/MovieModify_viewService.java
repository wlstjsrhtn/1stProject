package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.MovieDao;
import com.tj.ex.dao.NoticeDao;
import com.tj.ex.dto.MovieDto;
import com.tj.ex.dto.NoticeDto;

public class MovieModify_viewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String MTitle = request.getParameter("MTitle");
		MovieDao mDao = MovieDao.getInstance();
		MovieDto mDto = mDao.mmodifyView_replyView(MTitle);
		request.setAttribute("mmodify_view", mDto);

	}

}
