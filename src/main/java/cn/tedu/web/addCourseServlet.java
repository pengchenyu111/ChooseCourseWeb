package cn.tedu.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tedu.dao.CourseDao;
import cn.tedu.dao.TeacherDao;
import cn.tedu.entity.Course;
import cn.tedu.entity.Teacher;

/**
 * Servlet implementation class addCourseServlet
 */
public class addCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String cno = request.getParameter("cno");
		String cname = request.getParameter("cname");
		String credit = request.getParameter("credit");
		String type = request.getParameter("type");
		String time = request.getParameter("time");
		String longtime = request.getParameter("long");
		String year = request.getParameter("year");
		String term = request.getParameter("term");
		String max = request.getParameter("max");
		String choose = request.getParameter("choose");
		String book = request.getParameter("book");
		String code = request.getParameter("code");

		Course course = new Course(cno ,cname,credit,type,time,Integer.parseInt(longtime),year,term,Integer.parseInt(max),Integer.parseInt(choose),book,code);
		CourseDao dao = new CourseDao();
		System.out.println("进入增加学生界面");
		try {
			dao.save(course);
			out.println("添加成功");
		
			response.sendRedirect("order-list-dispatched.jsp");
			
		} catch (Exception e) {
			//记日志，保留现场
			e.printStackTrace();
			
			out.println("系统繁忙，稍后重试");
		}
		
		out.close();
	}

}
