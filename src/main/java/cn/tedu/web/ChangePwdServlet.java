package cn.tedu.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.tedu.dao.UserDao;
import cn.tedu.entity.LoginUser;


public class ChangePwdServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String oldpwd = request.getParameter("ymm");
		String newpwd = request.getParameter("xmm");
		String newpwd2 = request.getParameter("xmm2");
		System.out.println(oldpwd+","+newpwd+","+newpwd2);
		
		HttpSession session = request.getSession();
		String account = (String)session.getAttribute("userAccount");
		System.out.println(account);
		
		UserDao dao = new UserDao();
		LoginUser user = dao.findUser(account);
		String oldDBpwd = user.getPassword();
		
		System.out.println(oldDBpwd);

		if(oldpwd.equals(oldDBpwd)&&newpwd.equals(newpwd2)) {
			dao.updateLoginpwd(account, newpwd);
			dao.updateStupwd(account, newpwd);
			request.setAttribute("success", "修改成功");
			response.sendRedirect("stu_home.jsp");
		}else if(!oldpwd.equals(oldDBpwd)) {
			response.sendRedirect("errorMessage.jsp");
		}else if(!newpwd.equals(newpwd2)) {
			response.sendRedirect("errorMessage1.jsp");
		}
		
	}

}
