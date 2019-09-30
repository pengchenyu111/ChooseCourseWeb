package cn.tedu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.tedu.entity.Course;
import cn.tedu.entity.SC;
import cn.tedu.util.DBUtils;

public class CourseDao {

	public SC findChosen(String sno, String courseNo) {
		String sql = "select * from tb_sc where Sno=? and CourseNo = ?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		SC sc =null;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, sno);
			stmt.setString(2, courseNo);
			rs = stmt.executeQuery();
			if(rs.next()) {
				String Sno = rs.getString("Sno");
				String CourseNo = rs.getString("CourseNo");
				int grade = rs.getInt("grade");
				sc = new SC(Sno,CourseNo,grade);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return sc;
	}
	public void save(Course course){
		String sql = "insert into tb_course values (?,?,?,?,?,?,?,?,?,?,?,?);";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, course.getCourseNo());
			stmt.setString(2, course.getCourseName());
			stmt.setString(3, course.getCourseCredit());
			stmt.setString(4, course.getCourseType());
			stmt.setString(5, course.getCourseTimePlace());
			stmt.setInt(6,course.getCourseHour());
			stmt.setString(7, course.getCourseStartYear());
			stmt.setString(8, course.getCourseStartTerm());
			stmt.setInt(9, course.getCourseMaxnum());
			stmt.setInt(10, course.getCourseChoosennum());
			stmt.setString(11, course.getCourseTextbook());
			stmt.setString(12, course.getCourseCode());
			System.out.println(stmt);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("数据库异常");
		} finally {
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		
	}
	public List<SC> findSCDetails(String Sno) {
		String sql = "select * from tb_sc,tb_course where tb_sc.CourseNo = tb_Course.CourseNo and tb_sc.Sno=?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<SC> scs = new ArrayList<SC>();

		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Sno);
			rs = stmt.executeQuery();

			while (rs.next()) {
				String CourseNo = rs.getString("CourseNo");
				String CourseName = rs.getString("CourseName");
				double CourseCredit = rs.getDouble("CourseCredit");
				String CourseType = rs.getString("CourseType");
				int grade = rs.getInt("grade");
				String CourseCode = rs.getString("CourseCode");
				SC sc = new SC(Sno, CourseNo, CourseName, CourseCredit, CourseType, grade, CourseCode);
				scs.add(sc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return scs;

	}

	public List<Course> findStuCourses(String Sno) {
		String sql = "select * from tb_sc,tb_Course where tb_sc.CourseNo = tb_Course.CourseNo and tb_sc.Sno=?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Course course = null;
		List<Course> courses = new ArrayList<Course>();

		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Sno);
			rs = stmt.executeQuery();
			while (rs.next()) {
				String CourseNo = rs.getString("CourseNo");
				String CourseName = rs.getString("CourseName");
				String CourseCredit = rs.getString("CourseCredit");
				String CourseType = rs.getString("CourseType");
				String CourseTimePlace = rs.getString("CourseTimePlace");
				Integer CourseHour = rs.getInt("CourseHour");
				String CourseStartYear = rs.getString("CourseStartYear");
				String CourseStartTerm = rs.getString("CourseStartTerm");
				Integer CourseMaxnum = rs.getInt("CourseMaxnum");
				Integer CourseChoosennum = rs.getInt("CourseChoosennum");
				String CourseTextbook = rs.getString("CourseTextbook");
				String CourseCode = rs.getString("CourseCode");
				course = new Course(CourseNo, CourseName, CourseCredit, CourseType, CourseTimePlace, CourseHour,
						CourseStartYear, CourseStartTerm, CourseMaxnum, CourseChoosennum, CourseTextbook, CourseCode);
				courses.add(course);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return courses;
	}

	public Course findOneCourse(String CourseNo) {

		String sql = "select * from tb_Course where CourseNo=?";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Course course = null;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, CourseNo);
			rs = stmt.executeQuery();
			if (rs.next()) {
				String CourseName = rs.getString("CourseName");
				String CourseCredit = rs.getString("CourseCredit");
				String CourseType = rs.getString("CourseType");
				String CourseTimePlace = rs.getString("CourseTimePlace");
				Integer CourseHour = rs.getInt("CourseHour");
				String CourseStartYear = rs.getString("CourseStartYear");
				String CourseStartTerm = rs.getString("CourseStartTerm");
				Integer CourseMaxnum = rs.getInt("CourseMaxnum");
				Integer CourseChoosennum = rs.getInt("CourseChoosennum");
				String CourseTextbook = rs.getString("CourseTextbook");
				String CourseCode = rs.getString("CourseCode");
				course = new Course(CourseNo, CourseName, CourseCredit, CourseType, CourseTimePlace, CourseHour,
						CourseStartYear, CourseStartTerm, CourseMaxnum, CourseChoosennum, CourseTextbook, CourseCode);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return course;
	}

	public List<Course> findAllCourses() {

		String sql = "select * from tb_Course";
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Course> courses = new ArrayList<Course>();
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				String CourseNo = rs.getString("CourseNo");
				String CourseName = rs.getString("CourseName");
				String CourseCredit = rs.getString("CourseCredit");
				String CourseType = rs.getString("CourseType");
				String CourseTimePlace = rs.getString("CourseTimePlace");
				Integer CourseHour = rs.getInt("CourseHour");
				String CourseStartYear = rs.getString("CourseStartYear");
				String CourseStartTerm = rs.getString("CourseStartTerm");
				Integer CourseMaxnum = rs.getInt("CourseMaxnum");
				Integer CourseChoosennum = rs.getInt("CourseChoosennum");
				String CourseTextbook = rs.getString("CourseTextbook");
				String CourseCode = rs.getString("CourseCode");
				Course course = new Course(CourseNo, CourseName, CourseCredit, CourseType, CourseTimePlace, CourseHour,
						CourseStartYear, CourseStartTerm, CourseMaxnum, CourseChoosennum, CourseTextbook, CourseCode);
				courses.add(course);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(rs);
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
		return courses;
	}

	public void delete(String CourseNo) {
		String sql = "delete from tb_Course where CourseNo=?";
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, CourseNo);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("数据库异常");
		} finally {
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
	}

	public void deleteSCCourse(String Sno, String CourseNo) {
		String sql = "delete from tb_SC where Sno=? and CourseNo=?";
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Sno);
			stmt.setString(2, CourseNo);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("数据库异常");
		} finally {
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
	}

	public boolean judgeExist(String Sno, String CourseCode, String CourseCodeSC) {
		String halfTerm1 = CourseCode.substring(0, 13);
		String halfTerm2 = CourseCode.substring(13, 26);
		String halfTermSC1 = CourseCodeSC.substring(0, 13);
		String halfTermSC2 = CourseCodeSC.substring(13, 26);

		if (judgeTerm(halfTerm1, halfTermSC1) || judgeTerm(halfTerm2, halfTermSC2)) {
			System.out.println(halfTerm1 + "," + halfTerm2 + "," + halfTermSC1 + "," + halfTermSC2);
			return true;
		}
		return false;
	}

	public boolean judgeTerm(String halfTerm, String halfTermSC) {
		String place1 = halfTerm.substring(8, 13);
		String place2 = halfTermSC.substring(8, 13);
		/*
		 * String course1day = halfTerm.substring(2, 3); String course1num =
		 * halfTerm.substring(3,5); String course2day = halfTerm.substring(5, 6); String
		 * course2num = halfTerm.substring(6,8); String courseSC1day =
		 * halfTermSC.substring(2, 3); String courseSC1num = halfTermSC.substring(3,5);
		 * String courseSC2day = halfTermSC.substring(5, 6); String courseSC2num =
		 * halfTermSC.substring(6,8);
		 */
		String course1 = halfTerm.substring(2, 5);
		String course2 = halfTerm.substring(5, 8);
		String courseSC1 = halfTermSC.substring(2, 5);
		String courseSc2 = halfTermSC.substring(5, 8);
		String week = halfTerm.substring(0, 2);
		String weekSC = halfTermSC.substring(0, 2);

		if ((!halfTerm.equals("zz00000000000")) && (!halfTermSC.equals("zz00000000000")) && place(place1, place2)
				&& week(week, weekSC) && course(course1, course2, courseSC1, courseSc2)) {
			return true;
		}
		return false;
	}

	public boolean place(String place1, String place2) {
		if (place1.equals(place2)) {
			System.out.println(place1 + "," + place2);
			return true;
		}
		return false;
	}

	public boolean week(String week, String weekSC) {
		char beginWeek = week.substring(0, 1).charAt(0);
		char beginWeekSC = weekSC.substring(0, 1).charAt(0);
		char endWeek = week.substring(1, 2).charAt(0);
		char endWeekSC = weekSC.substring(1, 2).charAt(0);
		if ((beginWeek <= endWeekSC && beginWeek >= beginWeekSC)
				|| (beginWeekSC <= endWeek && beginWeekSC >= beginWeek)) {
			System.out.println(beginWeek + "," + endWeek + "," + beginWeekSC + "," + endWeekSC);
			return true;
		}
		return false;
	}

	public boolean course(String course1, String course2, String courseSC1, String courseSC2) {
		if (course1.equals(courseSC1) || course2.equals(courseSC2)) {
			System.out.println(course1 + "," + courseSC1 + "," + course2 + "," + courseSC2);
			return true;
		}
		return false;
	}

	public void chooseCourse(String Sno, String CourseNo) {
		String sql = "insert into tb_SC values(?,?,null)";
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = DBUtils.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Sno);
			stmt.setString(2, CourseNo);
			System.out.println(sql);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(stmt);
			DBUtils.close(conn);
		}
	}

}
