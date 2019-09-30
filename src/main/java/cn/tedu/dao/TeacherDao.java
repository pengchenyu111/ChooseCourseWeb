package cn.tedu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.tedu.entity.Course;
import cn.tedu.entity.Student;
import cn.tedu.entity.Teacher;
import cn.tedu.util.DBUtils;

public class TeacherDao {
	public List<Course> getCourseMessage(String Tno) {//教师端查询选课信息	
		String sql = "select * from tb_course,tb_tc where tb_tc.CourseNo = tb_course.CourseNo and tb_tc.Tno = ?";
		List<Course> Courses = new ArrayList<Course>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Course course = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Tno);
			rs= stmt.executeQuery();
			while(rs.next()) {
				String CourseNo = rs.getString("CourseNo");
				String CourseName = rs.getString("CourseName");
				String CourseCredit = rs.getString("CourseCredit");
				String CourseType = rs.getString("CourseType");
				String CourseTimePlace = rs.getString("CourseTimePlace");
				Integer CourseHour = rs.getInt("CourseHour");
				String CourseStartYear = rs.getString("CourseStartYear");
				String CourseStartTerm = rs.getString("CourseStartTerm");
				Integer CourseMaxnum = rs.getInt("CourseMaxnum");
				Integer CourseChoosennum= rs.getInt("CourseChoosennum");
				String CourseTextbook = rs.getString("CourseTextbook");
				String CourseCode = rs.getString("CourseCode");
				course = new Course(CourseNo,CourseName,CourseCredit,CourseType,CourseTimePlace,CourseHour,CourseStartYear,CourseStartTerm,CourseMaxnum,CourseChoosennum,CourseTextbook,CourseCode);
			    Courses.add(course);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return Courses;	
	}
	
	public List<Student> getStudentMessage(String CourseName , String Tno){//教师端查询学生信息
		String sql = "select * from tb_tc,tb_course,tb_student,tb_sc where\r\n" + 
				"				tb_tc.CourseNo = tb_course.CourseNo and \r\n" + 
				"				tb_sc.CourseNo = tb_sc.CourseNo and \r\n" + 
				"				tb_sc.Sno = tb_student.Sno and\r\n" + 
				"				tb_tc.Tno = ? and\r\n" + 
				"				tb_course.CourseName = ?";
		List<Student> students = new ArrayList<Student>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Tno);
			stmt.setString(2, CourseName);
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
		
		return students;		
	}
			
	public List<Student> getStudentMessage2(String CourseNO , String Tno){//教师端查询学生信息
		String sql = "select * from tb_tc,tb_sc,tb_student where + \r\n" + 
				"				tb_tc.CourseNo = tb_sc.CourseNo and + \r\n" + 
				"			  tb_sc.Sno = tb_student.Sno and + \r\n" + 
				"				tb_tc.Tno = ? and + \r\n" + 
				"				tb_tc.CourseNo = ? order by tb_sc.Sno";
		List<Student> students = new ArrayList<Student>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Tno);
			stmt.setString(2, CourseNO);
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
		
		return students;		
	}
	
	public List<Student> getStudentMessage3(String CourseName , String Tno){//教师端查询学生信息
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
			stmt.setString(2, CourseName);
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
		
		return students;		
	}
	
	
	public List<Integer> getGrade1(String CourseName , String Tno) {//获取成绩
		String sql = "select grade from tb_tc,tb_sc,tb_course where + \r\n" + 
				"							  tb_course.CourseNo = tb_sc.CourseNo and +\r\n" + 
				"								tb_tc.CourseNo = tb_sc.CourseNo and  + \r\n" + 
				"								tb_tc.Tno = ? and  + \r\n" + 
				"								tb_course.CourseName = ? order by tb_sc.Sno";
		List<Integer> a = new ArrayList<Integer>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Tno);
			stmt.setString(2, CourseName);
			rs= stmt.executeQuery();
			while(rs.next()) {
				Integer grade = rs.getInt("grade");
			    a.add(grade);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return a;
	}
	
	
	public List<Integer> getGrade(String CourseNO , String Tno) {//获取成绩
		String sql = "select grade from tb_tc,tb_sc where + \r\n" + 
				"				tb_tc.CourseNo = tb_sc.CourseNo and + \r\n" + 
				"				tb_tc.Tno = ? and + \r\n" + 
				"				tb_tc.CourseNo = ? order by tb_sc.Sno";
		List<Integer> a = new ArrayList<Integer>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Tno);
			stmt.setString(2, CourseNO);
			rs= stmt.executeQuery();
			while(rs.next()) {
				Integer grade = rs.getInt("grade");
			    a.add(grade);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return a;
	}
	
	public List<Course> getCourse() {
		String sql = "select * from tb_Course";
		List<Course> courses = new ArrayList<Course>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Course course = null;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			rs= stmt.executeQuery();
			while(rs.next()) {
				String CourseNo = rs.getString("CourseNo");
				String CourseName = rs.getString("CourseName");
				String CourseCredit = rs.getString("CourseCredit");
				String CourseType = rs.getString("CourseType");
				String CourseTimePlace = rs.getString("CourseTimePlace");
				Integer CourseHour = rs.getInt("CourseHour");
				String CourseStartYear = rs.getString("CourseStartYear");
				String CourseStartTerm = rs.getString("CourseStartTerm");
				Integer CourseMaxnum = rs.getInt("CourseMaxnum");
				Integer CourseChoosennum= rs.getInt("CourseChoosennum");
				String CourseTextbook = rs.getString("CourseTextbook");
				String CourseCode = rs.getString("CourseCode");
				course = new Course(CourseNo,CourseName,CourseCredit,CourseType,CourseTimePlace,CourseHour,CourseStartYear,CourseStartTerm,CourseMaxnum,CourseChoosennum,CourseTextbook,CourseCode);
			    courses.add(course);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return courses;
	}
	public Teacher findOneTeacher(String Tno) {
		String sql = "select * from tb_Teacher where Tno=?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Teacher teacher = null;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Tno);
			rs= stmt.executeQuery();
			if(rs.next()) {
				String Tname = rs.getString("Tname");
				String Tsex = rs.getString("Tsex");
				Integer Tage = rs.getInt("Tage");
				String Tposition = rs.getString("Tposition");
				String Tcode = rs.getString("Tcode");
				String Tpower = rs.getString("Tpower");
				teacher = new Teacher(Tno,Tname,Tsex,Tage,Tposition,Tcode,Tpower);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return teacher;
	}
	
	public List<Teacher> findSomeTeachers(String Tname){
		String sql = "select * from tb_Teacher where Tname=?";
		List<Teacher> teachers = new ArrayList<Teacher>();		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				String Tno = rs.getString("Tno");
				String Tsex = rs.getString("Tsex");
				Integer Tage = rs.getInt("Tage");
				String Tposition = rs.getString("Tposition");
				String Tcode = rs.getString("Tcode");
				String Tpower = rs.getString("Tpower");
				Teacher teacher = new Teacher(Tno,Tname,Tsex,Tage,Tposition,Tcode,Tpower);
				teachers.add(teacher);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("数据库出现异常");
		} finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		
		return teachers;
	}
public List<Teacher> FindAllTeachers() {
		
		String sql = "select * from tb_teacher";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Teacher> teachers = new ArrayList<Teacher>();
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			rs= stmt.executeQuery();
			while(rs.next()) {
				String Tno = rs.getString("Tno");
				String Tname = rs.getString("Tname");
				String TSex = rs.getString("TSex");
				int Tage = rs.getInt("Tage");
				String Tposition = rs.getString("Tposition");
				String Tcode = rs.getString("Tcode");
				String Tpower = rs.getString("Tpower");
				Teacher teacher = new Teacher(Tno,Tname,TSex,Tage,Tposition,Tcode,Tpower);
				teachers.add(teacher);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return teachers;
	}
	public List<Teacher> findAllTeachers(String Tname){
		String sql = "select * from tb_Teacher";
		List<Teacher> teachers = new ArrayList<Teacher>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				String Tno = rs.getString("Tno");
				String Tsex = rs.getString("Tsex");
				Integer Tage = rs.getInt("Tage");
				String Tposition = rs.getString("Tposition");
				String Tcode = rs.getString("Tcode");
				String Tpower = rs.getString("Tpower");
				Teacher teacher = new Teacher(Tno,Tname,Tsex,Tage,Tposition,Tcode,Tpower);
				teachers.add(teacher);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("数据库出现异常");
		} finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return teachers;
	}
	
	public void save(Teacher teacher) {
		String sql = "insert into tb_Teacher values(?,?,?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, teacher.getTno());
			stmt.setString(2, teacher.getTname());
			stmt.setString(3, teacher.getTSex());
			stmt.setInt(4, teacher.getTage());
			stmt.setString(5, teacher.getTposition());
			stmt.setString(6,teacher.getTcode());
			stmt.setString(7, teacher.getTpower());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("数据库异常");
		} finally {
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
	}
	
	public void delete(String Tno) {
		String sql = "delete from tb_Teacher where Tno = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Tno);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("数据库异常");
		}finally {
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
	}

}
