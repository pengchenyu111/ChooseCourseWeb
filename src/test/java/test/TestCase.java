package test;

import java.util.List;

import org.junit.Test;
import org.junit.experimental.theories.FromDataPoints;

import cn.tedu.dao.CourseDao;
import cn.tedu.dao.StudentDao;
import cn.tedu.dao.TeacherDao;
import cn.tedu.dao.UserDao;
import cn.tedu.entity.Course;
import cn.tedu.entity.LoginUser;
import cn.tedu.entity.SC;
import cn.tedu.entity.Student;
import cn.tedu.entity.Teacher;
public class TestCase {
	@Test
	public void testjudge() {
		CourseDao dao = new CourseDao();
		if(!dao.judgeExist("2017211230", "AJ24542303202LP20142303202", "AJ24540103202LR32340107403")) {
			dao.chooseCourse("2017211230","170002");
		}else
		{
			System.out.println("冲突");
		}
		System.out.println(dao.judgeExist("2017211230", "AJ50100001101zz00000000000", "AJ24540103202LR32340107403"));
	}
	@Test
	public void testString() {
		String s= "s";
		char s2 = s.charAt(0);
		System.out.println(s2);
	}
	@Test
	public void testSubstring() {
		String s1 = "AJ24540103202LR32340107403";
		String s2 = "1234567890";
		String str1 = s1.substring(0, 13);
		String str2 = s1.substring(13,26);
		System.out.println(str1);
		System.out.println(str2);
	}
	
	@Test
	public void testUpdate() {
		UserDao dao = new UserDao();
		dao.updateLoginpwd("2017211230", "456789");
	}
	@Test
	public void testQuitCourse() {
		CourseDao dao = new CourseDao();
		dao.deleteSCCourse("2017211230", "170001");
	}
	
	@Test
	public void testSC() {
		CourseDao dao = new CourseDao();
		List<SC> scs = dao.findSCDetails("2017211230");
		for (SC sc : scs) {
			System.out.println(sc);
		}
	}
	
	@Test
	public void testAllStudent() {
		StudentDao dao = new StudentDao();
		List<Student> students = dao.findAllStudents();
		for (Student student : students) {
			System.out.println(student);
		}
	}
	@Test
	public void testAllCourse() {
		CourseDao dao = new CourseDao();
		List<Course> courses = dao.findAllCourses();
		for (Course course : courses) {
			System.out.println(course);
		}
	}
	
	@Test
	public void testFindUser() {
		UserDao dao = new UserDao();
		LoginUser user = dao.findUser("2017211230");
		System.out.println(user);
	}
	
	
	@Test
	public void testFind() {
		StudentDao dao = new StudentDao();
		Student student = dao.findOneStudent("2017211235");
		System.out.println(student);
	}
	
	@Test
	public void testDelete() {
		StudentDao dao = new StudentDao();
		dao.delete("2017211236");
		System.out.println(dao.findOneStudent("2017211236"));
		
	}
	@Test
	public void testQuitCourse1() {
		CourseDao dao = new CourseDao();
		dao.deleteSCCourse("2017211230", "170001");
	}
	
	@Test
	public void testSC1() {
		CourseDao dao = new CourseDao();
		List<SC> scs = dao.findSCDetails("2017211230");
		for (SC sc : scs) {
			System.out.println(sc);
		}
	}
	
	@Test
	public void testAllStudent1() {
		StudentDao dao = new StudentDao();
		List<Student> students = dao.findAllStudents();
		for (Student student : students) {
			System.out.println(student);
		}
	}
	@Test
	public void testAllCourse1() {
		CourseDao dao = new CourseDao();
		List<Course> courses = dao.findAllCourses();
		for (Course course : courses) {
			System.out.println(course);
		}
	}
	
	@Test
	public void testFindUser1() {
		UserDao dao = new UserDao();
		LoginUser user = dao.findUser("2017211230");
		System.out.println(user);
	}
	
	
	@Test
	public void testFind1() {
		StudentDao dao = new StudentDao();
		Student student = dao.findOneStudent("2017211235");
		System.out.println(student);
	}
	
	@Test
	public void testDelete1() {
		StudentDao dao = new StudentDao();
		dao.delete("2017211236");
		System.out.println(dao.findOneStudent("2017211236"));
		
	}
	@Test
	public void testA(){
		CourseDao dao = new CourseDao();
		dao.save(new Course("111113","2","3","4","5",6,"7","8",10,11,"12","13"));
	}
}
