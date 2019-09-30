package cn.tedu.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tedu.dao.StudentDao;
import cn.tedu.dao.UserDao;
import cn.tedu.entity.LoginUser;
import cn.tedu.entity.Student;


public class StudentHomeServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		UserDao dao = new UserDao();
		String userAccount = (String)request.getAttribute("userAccount");
		System.out.println(userAccount);
		try {
			Student student = dao.findOneStudent(userAccount);
			System.out.println(student);
			request.setAttribute("student", student);
			request.getRequestDispatcher("stu_home.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
