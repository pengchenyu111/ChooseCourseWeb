package cn.tedu.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tedu.dao.TeacherDao;

public class DeleteTeacherServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		String TeacherNo = request.getParameter("Tno");
		TeacherDao dao = new TeacherDao();
		try {
			System.out.println(TeacherNo);
			dao.delete(TeacherNo);
			response.sendRedirect("order-list-awaiting.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

