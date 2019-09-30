package cn.tedu.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.tedu.dao.UserDao;
import cn.tedu.entity.LoginUser;


public class LoginServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String userAccount = request.getParameter("name");
		String password = request.getParameter("pwd");
		//String userAccount ="2017211230";
		//String password = "123456";
		System.out.println(userAccount);
		
		UserDao dao = new UserDao();
		try {
			LoginUser user = dao.findUser(userAccount);
			System.out.println(user);
			if(user != null && userAccount.equals(user.getAccount())&&password.equals(user.getPassword())) {
				HttpSession session = request.getSession();
				if("3".equals(user.getPower())) {
					session.setAttribute("userAccount", userAccount);
					response.sendRedirect("stu_home.jsp");
					System.out.println("3");
				}else if("2".equals(user.getPower())) {
					session.setAttribute("name", userAccount);
					session.setAttribute("pwd", password);
					response.sendRedirect("teacher.jsp");
					System.out.println("2");
				}else if("1".equals(user.getPower())) {
					
					session.setAttribute("userAccount", userAccount);
					response.sendRedirect("index.jsp");
				}
			}else {
				request.setAttribute("login_failed", "用户名或密码错误");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				System.out.println("0");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("login_failed", "系统繁忙");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
