package cn.tedu.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tedu.dao.CourseDao;
import cn.tedu.dao.StudentDao;
import cn.tedu.entity.Course;
import cn.tedu.entity.SC;
import cn.tedu.entity.Student;


public class ChooseServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		String userAccount = request.getParameter("userAccount");
		String CourseNo = request.getParameter("courseNo");//要选的课的课程号
		String CourseCode = request.getParameter("CourseCode");//要选的课的课程编码
		
		StudentDao dao = new StudentDao();
		CourseDao cdao = new CourseDao();
		Student student = dao.findOneStudent(userAccount);
		String Sno = student.getSno();
		List<SC> scs = cdao.findSCDetails(Sno);
		SC sc2 = cdao.findChosen(Sno,CourseNo); 
		
		Course course  = cdao.findOneCourse(CourseNo);//改where
		System.out.println(course);
		int courseMaxnum = course.getCourseMaxnum();
		int courseChosennum = course.getCourseChoosennum();
		System.out.println(courseMaxnum+","+courseChosennum);
		
		
		if(sc2 !=null) {
			request.setAttribute("conflict", "该课程已选！");
			request.getRequestDispatcher("selectCourse.jsp").forward(request, response);
		}else {
			if(courseMaxnum == courseChosennum) {
				request.setAttribute("conflict", "该课程已达到选课人数上限！");
				request.getRequestDispatcher("selectCourse.jsp").forward(request, response);
			}else {
				if(scs.size()==0) {
					cdao.chooseCourse(Sno,CourseNo);
					request.setAttribute("conflict", "选课成功！");
					request.getRequestDispatcher("selectCourse.jsp").forward(request, response);
				}else {
					for (int i =0;i<scs.size();i++) {
						SC sc = scs.get(i);
						String CourseCodeSC = sc.getCourseCode();
						
						if(!cdao.judgeExist(Sno,CourseCode,CourseCodeSC)) {
							cdao.chooseCourse(Sno,CourseNo);
							request.setAttribute("conflict", "选课成功！");
							request.getRequestDispatcher("selectCourse.jsp").forward(request, response);
						}else {
							request.setAttribute("conflict", "地点或时间冲突");
							request.getRequestDispatcher("selectCourse.jsp").forward(request, response);
							break;
						}
					}
				}
				
			}

		}
	}

}
