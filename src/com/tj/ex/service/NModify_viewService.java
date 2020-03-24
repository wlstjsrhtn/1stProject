package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.NoticeDao;
import com.tj.ex.dto.NoticeDto;

public class NModify_viewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int NNum = Integer.parseInt(request.getParameter("NNum"));
		NoticeDao nDao = NoticeDao.getInstance();
		NoticeDto nDto = nDao.modifyView_replyView(NNum);
		System.out.println(NNum);
		request.setAttribute("modify_view", nDto);

	}

}
