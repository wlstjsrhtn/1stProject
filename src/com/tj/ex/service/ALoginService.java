package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tj.ex.dao.AdminDao;
import com.tj.ex.dto.AdminDto;

public class ALoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String AId = request.getParameter("AId");
		String APw = request.getParameter("APw");
		AdminDao aDao = AdminDao.getInstance();
		int result = aDao.loginCheck(AId, APw);
		if(result == AdminDao.LOGIN_SUCCESS) {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("AId", AId);
			AdminDto dto = aDao.getMember(AId);
			httpSession.setAttribute("admin", dto);
			request.setAttribute("adminLoginResult", "관리자계정으로 들어오셨습니다");
		}else {
			request.setAttribute("adminLoginResult", "관리자계정 로그인이 실패되었습니다");
			request.setAttribute("adminLoginError", "error");
		}

	}

}