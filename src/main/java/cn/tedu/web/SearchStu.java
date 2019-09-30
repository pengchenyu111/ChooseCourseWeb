package cn.tedu.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.tedu.util.DBUtils;

public class SearchStu extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("name");
		String button1 = request.getParameter("button1");//课程号
		String button2 = request.getParameter("button2");//课程名
		if(!button1.equals("")) {			
			session.setAttribute("TTname", username);//教师名
			session.setAttribute("CCno", button1);			
			response.sendRedirect("t_searchStu2.jsp");
		}else if(!button2.equals(null)) {
			session.setAttribute("CCCname", button2);
			response.sendRedirect("t_searchStu3.jsp");
		}
		
	}

}
