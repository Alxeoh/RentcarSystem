package contoller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.controller.BoardDao;
import controller.Action;

public class BoardModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("board_modify액션 활성화 ");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(no);
		System.out.println(title);
		System.out.println(content);
		BoardDao boardDao = BoardDao.getInstance();
		boardDao.modifyBoard(title, content, no);
		request.setAttribute("boardmodify", true);
		request.getRequestDispatcher("board").forward(request, response);
	}

}
