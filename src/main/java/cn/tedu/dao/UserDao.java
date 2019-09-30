package cn.tedu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.tedu.entity.LoginUser;
import cn.tedu.entity.Student;
import cn.tedu.entity.Teacher;
import cn.tedu.util.DBUtils;

public class UserDao {
	public void updateLoginpwd(String account,String pwd) {
		String sql = "update tb_login set code ='"+pwd+"' where account ='"+account+"'";
		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			System.out.println(sql);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
	}
	
	public void updateStupwd(String account,String pwd) {
		String sql = "update tb_student set Scode ='"+pwd+"' where Sno ='"+account+"'";
		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			System.out.println(sql);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
	}
	//登陆时检索
	public LoginUser findUser(String account) {
		String sql = "select * from tb_login where account=?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LoginUser user = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, account);
			rs= stmt.executeQuery();
			if(rs.next()) {
				String code = rs.getString("code");
				String power = rs.getString("power"); 
				user = new LoginUser(account,code,power);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		
		return user;
		
	}
	
	//学生
	public Student findOneStudent(String Sno) {
		String sql = "select * from tb_Student where Sno=?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Student student = null;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Sno);
			rs= stmt.executeQuery();
			if(rs.next()) {
				String Sname = rs.getString("Sname");
				String Ssex = rs.getString("Ssex");
				Integer Sage = rs.getInt("Sage");
				String ClassNo = rs.getString("ClassNo");
				String major = rs.getString("major");
				String Scode = rs.getString("Scode");
				String Spower = rs.getString("Spower");
				student = new Student(Sno,Sname,Ssex,Sage,ClassNo,major,Scode,Spower);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return student;
	}
	
	public List<Student> findSomeStudents(String Sname){
		String sql = "select * from tb_Student where Sname=?";
		List<Student> students = new ArrayList<Student>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				String Sno = rs.getString("Sno");
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
	
	public List<Student> findAllStudents(String Sname){
		String sql = "select * from tb_Student";
		List<Student> students = new ArrayList<Student>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				String Sno = rs.getString("Sno");
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
	
	public void save(Student student) {
		String sql = "insert into tb_Student values(?,?,?,?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, student.getSno());
			stmt.setString(2, student.getSname());
			stmt.setString(3, student.getSsex());
			stmt.setInt(4, student.getSage());
			stmt.setString(5, student.getClassNo());
			stmt.setString(6, student.getMajor());
			stmt.setString(7, student.getScode());
			stmt.setString(8, student.getSpower());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("数据库异常");
		} finally {
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
	}
	
	public  void deleteStudent(String Sno) {
		String sql = "delete from tb_Student where Sno = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Sno);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("数据库异常");
		}finally {
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
	}
	
	//教师
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
	
	public void deleteTeacher(String Tno) {
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
