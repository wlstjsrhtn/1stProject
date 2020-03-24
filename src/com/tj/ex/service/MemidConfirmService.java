package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.MemberDao;

public class MemidConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String MId = request.getParameter("MId");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.mIdConfirm(MId);
		if(result==MemberDao.EXISTENT) {
			request.setAttribute("idConfirmResult", "중복된 ID입니다");
		}else {
			request.setAttribute("idConfirmResult", "사용가능한 ID입니다");
		}
	}
}
