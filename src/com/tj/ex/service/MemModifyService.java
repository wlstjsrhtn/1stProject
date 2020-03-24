package com.tj.ex.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tj.ex.dao.MemberDao;
import com.tj.ex.dto.MemberDto;

public class MemModifyService implements Service {

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
		MemberDto member = new MemberDto(MId, MPw, MName, MTel, MBirth, MEmail, MGender, MAddress, null);
		int result = mDao.modifyMember(member);
  	    if(result == MemberDao.SUCCESS) {// 수정 성공시 세션도 수정
		    HttpSession httpSession = request.getSession();
			httpSession.setAttribute("member", member);
			request.setAttribute("modifyResult", "회원정보 수정 성공");
		  }else {
				// 수정 실패시 
			request.setAttribute("modifyResult", "회원정보 수정 실패");
		}
	}
}
