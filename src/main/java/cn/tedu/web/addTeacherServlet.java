package cn.tedu.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tedu.dao.TeacherDao;
import cn.tedu.dao.UserDao;
import cn.tedu.entity.Teacher;


/**
 * Servlet implementation class addTeacherServlet
 */
public class addTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String no = request.getParameter("no");
		String pwd = request.getParameter("pwd");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String posi = request.getParameter("posi");
		String name = request.getParameter("name");
		String power = request.getParameter("power");
		Teacher tea = new Teacher(no,name,sex,Integer.parseInt(age),posi,pwd,power);
		TeacherDao dao = new TeacherDao();
		System.out.println("进入增加学生界面");
		try {

			dao.save(tea);
			out.println("添加成功");
		
			response.sendRedirect("index.jsp");
			
		} catch (Exception e) {
			//记日志，保留现场
			e.printStackTrace();
			
			out.println("系统繁忙，稍后重试");
		}
		
		out.close();
			
	}

}
