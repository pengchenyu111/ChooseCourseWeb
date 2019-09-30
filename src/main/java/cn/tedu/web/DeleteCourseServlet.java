package cn.tedu.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tedu.dao.CourseDao;

public class DeleteCourseServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		String CourseNo = request.getParameter("CourseNo");
		CourseDao dao = new CourseDao();
		try {
			System.out.println(CourseNo);
			dao.delete(CourseNo);
			response.sendRedirect("order-list-dispatched.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

