package cn.tedu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.tedu.entity.Student;
import cn.tedu.util.DBUtils;

public class StudentDao {

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
	
	public List<Student> findAllStudents(){
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
	
	public  void delete(String Sno) {
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
}
