package contoller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import users.UserDto;
import users.controller.UserDao;

public class RegistAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	System.out.println("regist액션 활성화");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		UserDao userDao = UserDao.getInstance();
		
		UserDto userDto = new UserDto(id, password, name);
		if(userDao.duplId(id)) {
					System.out.println("아이디중복아님");
			if(userDao.createUser(userDto)) {
				request.setAttribute("registSuccess", true);
				request.getRequestDispatcher("login").forward(request, response);
				}else {
					System.out.println("회원가입실패");
				}
		} else {
			System.out.println("아이디중복");
			System.out.println("회원가입액션 실패");
			request.setAttribute("duplId", true);
			request.getRequestDispatcher("regist").forward(request, response);
			
		}
	}
}
