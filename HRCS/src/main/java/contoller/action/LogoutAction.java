package contoller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;

public class LogoutAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("logout액션 활성화");
		String id = "로그인 상태가 아닙니다.";
		
		HttpSession session = request.getSession();
		session.setAttribute("sessionId", id);
		System.out.println("로그아웃 완료");
		response.sendRedirect("/");
	}

}
