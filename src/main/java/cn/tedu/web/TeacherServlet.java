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

import cn.tedu.dao.UserDao;
import cn.tedu.entity.LoginUser;
import cn.tedu.entity.Teacher;
import cn.tedu.util.DBUtils;


public class TeacherServlet extends HttpServlet {
	protected void service(HttpServletRequest request,
			HttpServletResponse response) 
					throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("name");
		String password = (String)session.getAttribute("pwd");
		
		String ymm = request.getParameter("ymm");
		String xmm = request.getParameter("xmm");
		String xmm2 = request.getParameter("xmm2");
        
    	
		if(password.equals(ymm) && xmm.equals(xmm2)) {
			String sql1 = "update tb_teacher set Tcode = ? where Tno = ?";
			Connection conn = null;
			PreparedStatement stmt = null;
			try {
				conn = DBUtils.getConnection();
				stmt = conn.prepareStatement(sql1);
				stmt.setString(1, xmm);
				stmt.setString(2, username);
				stmt.executeUpdate();
				
							
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DBUtils.close(stmt);
				DBUtils.close(conn);
			}
			
			
			String sql2 = "update tb_login set code = ? where account = ?";
			Connection conn1 = null;
			PreparedStatement stmt1 = null;			
			try {
				conn1 = DBUtils.getConnection();
				stmt1 = conn1.prepareStatement(sql2);
				stmt1.setString(1, xmm);
				stmt1.setString(2, username);
				stmt1.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtils.close(stmt1);
				DBUtils.close(conn1);
			}
						
			response.sendRedirect("t_teaMessg.jsp");
		}else if(!password.equals(ymm) && xmm.equals(xmm2)) {
			response.sendRedirect("errorMessage3.jsp");
		}else if(!xmm.equals(xmm2) && password.equals(ymm)) {
			response.sendRedirect("errorMessage4.jsp");
		}else if(!xmm.equals(xmm2) && !password.equals(ymm)) {
			response.sendRedirect("errorMessage2.jsp");
		}
	}

}
