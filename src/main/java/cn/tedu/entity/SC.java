package cn.tedu.entity;

public class SC {

	private String Sno;
	private String CourseNo;
	private String CourseName;
	private double CourseCredit;
	private String CourseType;
	private int grade;
	private String CourseCode;
	
	public SC(String sno, String courseNo, String courseName, double courseCredit, String courseType, int grade,String courseCode) {
		this.Sno =sno;
		this.CourseNo = courseNo;
		this.CourseName = courseName;
		this.CourseCredit = courseCredit;
		this.CourseType = courseType;
		this.grade = grade;
		this.CourseCode = courseCode;
	}
	public SC(String sno,String courseNo,int grade) {
		this.Sno =sno;
		this.CourseNo = courseNo;
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "SC [Sno=" + Sno + ", CourseNo=" + CourseNo + ", CourseName=" + CourseName + ", CourseCredit="
				+ CourseCredit + ", CourseType=" + CourseType + ", grade=" + grade + ", CourseCode=" + CourseCode + "]";
	}

	public String getSno() {
		return Sno;
	}

	public void setSno(String sno) {
		Sno = sno;
	}

	public String getCourseNo() {
		return CourseNo;
	}

	public void setCourseNo(String courseNo) {
		CourseNo = courseNo;
	}

	public String getCourseName() {
		return CourseName;
	}

	public void setCourseName(String courseName) {
		CourseName = courseName;
	}

	public double getCourseCredit() {
		return CourseCredit;
	}

	public void setCourseCredit(double courseCredit) {
		CourseCredit = courseCredit;
	}

	public String getCourseType() {
		return CourseType;
	}

	public void setCourseType(String courseType) {
		CourseType = courseType;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getCourseCode() {
		return CourseCode;
	}

	public void setCourseCode(String courseCode) {
		CourseCode = courseCode;
	}

	
}
