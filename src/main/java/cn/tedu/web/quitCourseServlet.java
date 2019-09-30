package cn.tedu.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tedu.dao.CourseDao;

public class quitCourseServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		String CourseNo = request.getParameter("CourseNo");
		String userAccount = request.getParameter("userAccount");
		CourseDao dao = new CourseDao();
		try {
			System.out.println(userAccount+" ," +CourseNo);
			dao.deleteSCCourse(userAccount,CourseNo);
			response.sendRedirect("myCourse.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
