package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.MovieDao;

public class MovieDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String MTitle = request.getParameter("MTitle");
		System.out.println("MTitle : "+MTitle);
		MovieDao movieDao = MovieDao.getInstance();
		int result = movieDao.delete(MTitle);
		if(result == MovieDao.SUCCESS) {
			request.setAttribute("resultMsg", "영화삭제 성공");
		}else {
			request.setAttribute("resultMsg", "영화삭제 실패");
		}
	}
}
