package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.ReviewDao;
import com.tj.ex.dto.ReviewDto;

public class ReviewContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int RNum = Integer.parseInt(request.getParameter("RNum"));
		ReviewDao reviewDao = ReviewDao.getInstance();
		ReviewDto dto = reviewDao.contentView(RNum);
		request.setAttribute("rContent_view", dto);
	}
	
}
