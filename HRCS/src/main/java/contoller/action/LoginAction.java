package contoller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import users.User;
import users.controller.UserDao;

public class LoginAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("login액션 활성화");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		UserDao userDao = UserDao.getInstance();
		User user = userDao.getUserById(id);
		String tempPw = user.getPassword();
		
		HttpSession session = request.getSession();
		if(pw.equals(tempPw)) {
			System.out.println("로그인성공");
			session.setAttribute("sessionId", id);
			request.setAttribute("loginSuccess", true);
			request.getRequestDispatcher("/").forward(request, response);
		} else {
			System.out.println("로그인 실패");
			request.setAttribute("fail", true);
			request.getRequestDispatcher("login").forward(request, response);
		}
	}

}
