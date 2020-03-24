package com.tj.ex.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.service.*;
@WebServlet("*.do")
public class MController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int write_view = 0;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		Service service = null;
		String viewPage = null;
		if(command.equals("/main.do")) {
			viewPage="main/main.jsp";
		}else if(command.equals("/loginView.do")) {
			viewPage = "member/login.jsp";
		}else if(command.equals("/login.do")) {
			service = new MemLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/joinView.do")) {
			viewPage = "member/join.jsp";
		}else if(command.equals("/idConfirm.do")) {
			service = new MemidConfirmService();
			service.execute(request, response);
			viewPage = "member/idConfirm.jsp";
		}else if(command.equals("/join.do")) {
			service = new MemJoinService();
			service.execute(request, response);
			viewPage = "member/login.jsp";
		}else if(command.equals("/modifyView.do")) {
			viewPage = "member/modify.jsp";
		}else if(command.equals("/modify.do")) {
			service = new MemModifyService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/adminloginView.do")) {
			viewPage = "admin/adminLogin.jsp";
		}else if(command.equals("/adminLogin.do")) {
			service = new ALoginService();
			service.execute(request, response);
			viewPage = "allView.do";
		}else if(command.equals("/logout.do")) {
			service = new MemLogoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/allView.do")) {
			service = new MAllViewService();
			service.execute(request, response);
			viewPage = "member/mAllView.jsp";
		}else if(command.equals("/list.do")) { // 공지사항 게시판
			service = new NListService();
			service.execute(request, response);
			viewPage = "notice/list.jsp";
		}else if(command.equals("/write_view.do")) {
			write_view = 1;
			viewPage = "notice/write_view.jsp";
		}else if(command.equals("/write.do")) {
			if(write_view == 1) {
				service = new NWriteService();
				service.execute(request, response);
				write_view = 0;
			}
			viewPage = "list.do";
		}else if(command.equals("/content_view.do")) { 
			service = new NContentService();
			service.execute(request, response);
			viewPage = "notice/content_view.jsp";
		}else if(command.equals("/noticeModify_view.do")) {
			service = new NModify_viewService();
			service.execute(request, response);
			viewPage = "notice/modify_view.jsp";
		}else if(command.equals("/noticeModify.do")) {
			service = new NModifyService();
			service.execute(request, response);
			viewPage = "list.do";
		}else if(command.equals("/delete.do")) {
			service = new NDeleteService();
			service.execute(request, response);
			viewPage = "list.do";
		}else if(command.equals("/mwrite_view.do")) {     // 영화등록
			write_view = 1;
			viewPage = "movie/mwrite_view.jsp";
		}else if(command.equals("/mwrite.do")) {
			if(write_view == 1) {
				service = new MovieWriteService();
				service.execute(request, response);
				write_view = 0;
			}
			viewPage = "mList.do";
		}else if(command.equals("/mcontent_view.do")) {
			service = new MovieContentService();
			service.execute(request, response);
			viewPage = "movie/mcontent_view.jsp";
		}else if(command.equals("/movieModify_view.do")) {
			service = new MovieModify_viewService();
			service.execute(request, response);
			viewPage = "movie/mmodify_view.jsp";
		}else if(command.equals("/movieModify.do")) {
			service = new MovieModifyService();
			service.execute(request, response);
			viewPage = "mList.do";
		}else if(command.equals("/mdelete.do")) {
			service = new MovieDeleteService();
			service.execute(request, response);
			viewPage = "mList.do";
		}else if(command.equals("/mList.do")) { // 개봉작
			service = new MovieListService();
			service.execute(request, response);
			viewPage = "movie/mList.jsp";
		/////////////////////////////////////////////// 리뷰게시판
	    }else if(command.equals("/rList.do")) {
			service = new ReviewListService();
			service.execute(request, response);
			viewPage = "reviewboard/rList.jsp";
		}else if(command.equals("/rWrite_view.do")) {
			write_view = 1;
			viewPage = "reviewboard/rWrite_view.jsp";
		}else if(command.equals("/rWrite.do")) {
			if(write_view == 1) {
				service = new ReviewWriteService();
				service.execute(request, response);
				write_view = 0;
			}
			viewPage = "rList.do";
		}else if(command.equals("/rContent_view.do")) {
			service = new ReviewContentService();
			service.execute(request, response);
			viewPage = "reviewboard/rContent_view.jsp";
		}else if(command.equals("/rBoradModify_view.do")) {
			service = new ReviewModifyViewService();
			service.execute(request, response);
			viewPage = "reviewboard/rModify_view.jsp";
		}else if(command.equals("/rBoradModify.do")) {
			service = new ReviewModifyService();
			service.execute(request, response);
			viewPage = "rList.do";
		}else if(command.equals("/rDelete.do")) {
			service = new ReviewDeleteService();
			service.execute(request, response);
			viewPage = "rList.do";
		}else if(command.equals("/rReply_view.do")) {
			service = new ReviewReplyViewService();
			service.execute(request, response);
			viewPage = "reviewboard/rReply_view.jsp";
		}else if(command.equals("/rReply.do")) {
			service = new ReviewReplyService();
			service.execute(request, response);
			viewPage = "rList.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}