package test;

import cn.tedu.dao.StudentDao;
import cn.tedu.entity.Student;

public class TestDao {

	public static void main(String[] args) {
		StudentDao sdao = new StudentDao();
		Student student = new Student();
		student.setSno("2017211236");
		student.setSname("闵璇");
		student.setSsex("女");
		student.setSage(20);
		student.setClassNo("170001");
		student.setMajor("软件工程");
		student.setScode("123456");
		student.setSpower("3");
		sdao.save(student);
		System.out.println(student);
		
	}

}
