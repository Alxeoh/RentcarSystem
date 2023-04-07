package contoller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.controller.BoardDao;
import controller.Action;

public class WriteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("write액션 활성화");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		String type = "";
		if(id.equals("admin")) {
			type = "2";
		} else {
			type = "1";
		}
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDao boardDao = BoardDao.getInstance();
		if(boardDao.CreateBoard(type, id, title, content)) {
			request.setAttribute("writeSuccess", true);
			request.getRequestDispatcher("board").forward(request, response);
			System.out.println("write액션 성공");
		} else {
			System.out.println("write액션 실패");
		}
	}

}
