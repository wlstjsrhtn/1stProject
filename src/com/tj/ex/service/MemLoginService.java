package com.tj.ex.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tj.ex.dao.MemberDao;
import com.tj.ex.dto.MemberDto;
public class MemLoginService implements Service{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String MId = request.getParameter("MId");
		String MPw = request.getParameter("MPw");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.loginCheck(MId, MPw);
		if(result==MemberDao.LOGIN_SUCCESS) { // 로그인 성공
			HttpSession session = request.getSession();
			MemberDto member = mDao.getMember(MId);
			session.setAttribute("member", member);
		}else { // 로그인 실패
			request.setAttribute("errorMsg", "아이디와 비번을 확인하세요");
		}
	}
}