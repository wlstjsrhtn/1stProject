package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.ReviewDao;

public class ReviewDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int RNum = Integer.parseInt(request.getParameter("RNum"));
		ReviewDao reviewDao = ReviewDao.getInstance();
		int result = reviewDao.delete(RNum);
		if(result == ReviewDao.SUCCESS) {
			request.setAttribute("resultMsg", "글삭제 성공");
		}else {
			request.setAttribute("resultMsg", "글삭제 실패");
		}
	}
}
