package com.tj.ex.service;

import java.sql.Date;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tj.ex.dao.MemberDao;
import com.tj.ex.dto.MemberDto;

public class MemJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String MId = request.getParameter("MId");
		String MPw = request.getParameter("MPw");
		String MName = request.getParameter("MName");
		String MTel = request.getParameter("MTel");
		String MBirthStr = request.getParameter("MBirth");
		Date MBirth = null;
		if(!MBirthStr.equals("")) {
			MBirth = Date.valueOf(MBirthStr);
		}
		String MEmail = request.getParameter("MEmail");
		String MGender = request.getParameter("MGender");
		String MAddress = request.getParameter("MAddress");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.mIdConfirm(MId);
		if(result == MemberDao.NONEXISTENT) {
			MemberDto member = new MemberDto(MId, MPw, MName, MTel, MBirth, MEmail, MGender, MAddress, null);
			result = mDao.joinMember(member);
			if(result==MemberDao.SUCCESS) {
				HttpSession session = request.getSession();
				session.setAttribute("MId", MId);
				request.setAttribute("joinResult", "회원가입이 완료되었습니다");
			}else {
				request.setAttribute("errorMsg", "길어서 가입이 실패되었습니다.");
			}
		}else {
			request.setAttribute("errorMsg", "중복된 ID라서 회원가입 불가합니다");
		}
	}
}
