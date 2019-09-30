package cn.tedu.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.tedu.entity.Student;
import cn.tedu.util.DBUtils;

public class setGradewithNa extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		  String Tno = (String)session.getAttribute("TTname");
		  String CourseNo = (String)session.getAttribute("CCCno");
		  String CourseNa = (String)session.getAttribute("CCCname");
			String sql = "select * from tb_tc,tb_sc,tb_student,tb_course where  + \r\n" + 
					"								tb_tc.CourseNo = tb_sc.CourseNo and  +\r\n" + 
					"							  tb_course.CourseNo = tb_sc.CourseNo and +	\r\n" + 
					"							  tb_sc.Sno = tb_student.Sno and  + \r\n" + 
					"								tb_tc.Tno = ? and + \r\n" + 
					"								tb_course.CourseName = ? order by tb_sc.Sno";
			List<Student> students = new ArrayList<Student>();
			
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				conn = DBUtils.getConnection();
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, Tno);
				stmt.setString(2, CourseNa);
				rs = stmt.executeQuery();
				while(rs.next()) {
					String Sno = rs.getString("Sno");
					String Sname = rs.getString("Sname");
					String Ssex = rs.getString("Ssex");
					Integer Sage = rs.getInt("Sage");
					String ClassNo = rs.getString("ClassNo");
					String major = rs.getString("major");
					String Scode = rs.getString("Scode");
					String Spower = rs.getString("Spower");
					Student student = new Student(Sno,Sname,Ssex,Sage,ClassNo,major,Scode,Spower);
					students.add(student);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("数据库出现异常");
			} finally {
				DBUtils.close(rs);
				DBUtils.close(stmt);
				DBUtils.close(conn);
			}
	
			for(int i = 0;i < students.size();i++) {
				String temp = request.getParameter(i + "").trim();
				if(!temp.equals("")) {
					Integer grade = Integer.parseInt(temp);
				String SSno = request.getParameter("Sno" + i +"");
				String sql2 = "update tb_sc set grade = ? where Sno = ? and CourseNo = ?";
				Connection conn1 = null;
				PreparedStatement stmt1 = null;
				try {
					conn1 = DBUtils.getConnection();
					stmt1 = conn1.prepareStatement(sql2);
					stmt1.setInt(1, grade);
					stmt1.setString(2, SSno);
					stmt1.setString(3, CourseNo);
					stmt1.executeUpdate();
					
								
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					DBUtils.close(stmt1);
					DBUtils.close(conn1);
				}
				}
			}
		response.sendRedirect("setGrade2.jsp");
	}

}
