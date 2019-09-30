package cn.tedu.entity;

public class Course {
	private String CourseNo;
	private String CourseName;
	private String CourseCredit;
	private String CourseType;
	private String CourseTimePlace;
	private Integer CourseHour;
	private String CourseStartYear;
	private String CourseStartTerm;
	private Integer CourseMaxnum;
	private Integer CourseChoosennum;
	private String CourseTextbook;
	private String CourseCode;
	
	public Course(String courseNo, String courseName, String courseCredit, String courseType,
			String courseTimePlace, Integer courseHour, String courseStartYear, String courseStartTerm,
			Integer courseMaxnum, Integer courseChoosennum, String courseTextbook, String courseCode) {
		this.CourseNo = courseNo;
		this.CourseName = courseName;
		this.CourseCredit = courseCredit;
		this.CourseType = courseType;
		this.CourseTimePlace = courseTimePlace;
		this.CourseHour = courseHour;
		this.CourseStartYear = courseStartYear;
		this.CourseStartTerm = courseStartTerm;
		this.CourseMaxnum = courseMaxnum;
		this.CourseChoosennum = courseChoosennum;
		this.CourseTextbook = courseTextbook;
		this.CourseCode = courseCode;
	}
	@Override
	public String toString() {
		return "Course [CourseNo=" + CourseNo + ", CourseName=" + CourseName + ", CourseCredit=" + CourseCredit
				+ ", CourseType=" + CourseType + ", CourseTimePlace=" + CourseTimePlace + ", CourseHour=" + CourseHour
				+ ", CourseStartYear=" + CourseStartYear + ", CourseStartTerm=" + CourseStartTerm + ", CourseMaxnum="
				+ CourseMaxnum + ", CourseChoosennum=" + CourseChoosennum + ", CourseTextbook=" + CourseTextbook
				+ ", CourseCode=" + CourseCode + "]";
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
	public String getCourseCredit() {
		return CourseCredit;
	}
	public void setCourseCredit(String courseCredit) {
		CourseCredit = courseCredit;
	}
	public String getCourseType() {
		return CourseType;
	}
	public void setCourseType(String courseType) {
		CourseType = courseType;
	}
	public String getCourseTimePlace() {
		return CourseTimePlace;
	}
	public void setCourseTimePlace(String courseTimePlace) {
		CourseTimePlace = courseTimePlace;
	}
	public Integer getCourseHour() {
		return CourseHour;
	}
	public void setCourseHour(Integer courseHour) {
		CourseHour = courseHour;
	}
	public String getCourseStartYear() {
		return CourseStartYear;
	}
	public void setCourseStartYear(String courseStartYear) {
		CourseStartYear = courseStartYear;
	}
	public String getCourseStartTerm() {
		return CourseStartTerm;
	}
	public void setCourseStartTerm(String courseStartTerm) {
		CourseStartTerm = courseStartTerm;
	}
	public Integer getCourseMaxnum() {
		return CourseMaxnum;
	}
	public void setCourseMaxnum(Integer courseMaxnum) {
		CourseMaxnum = courseMaxnum;
	}
	public Integer getCourseChoosennum() {
		return CourseChoosennum;
	}
	public void setCourseChoosennum(Integer courseChoosennum) {
		CourseChoosennum = courseChoosennum;
	}
	public String getCourseTextbook() {
		return CourseTextbook;
	}
	public void setCourseTextbook(String courseTextbook) {
		CourseTextbook = courseTextbook;
	}
	public String getCourseCode() {
		return CourseCode;
	}
	public void setCourseCode(String courseCode) {
		CourseCode = courseCode;
	}
	
	
}