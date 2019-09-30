package cn.tedu.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tedu.dao.StudentDao;

public class DeleteStudentServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		String StudentNo = request.getParameter("Sno");
		StudentDao dao = new StudentDao();
		try {
			System.out.println(StudentNo);
			dao.delete(StudentNo);
			response.sendRedirect("order-list-delivered.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

