package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.MovieDao;
import com.tj.ex.dto.MovieDto;

public class MovieContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String MTitle = request.getParameter("MTitle");
		System.out.println("MTitle : "+MTitle);
		MovieDao movieDao = MovieDao.getInstance();
		MovieDto dto = movieDao.contentView(MTitle);
		request.setAttribute("mcontent_view", dto);
	}
}
