package cn.tedu.entity;

public class Student {

	private String Sno;
	private String Sname;
	private String Ssex;
	private Integer Sage;
	private String ClassNo;
	private String major;
	private String Scode;
	private String Spower;

	public Student() {
	}

	public Student(String Sno, String Sname,String Ssex,Integer Sage, String ClassNo,  String major, String Scode, String Spower) {
		this.Sno = Sno;
		this.Sname = Sname;
		this.Ssex = Ssex;
		this.Sage = Sage;
		this.ClassNo = ClassNo;
		this.major = major;
		this.Scode = Scode;
		this.Spower = Spower;
	}

	

	@Override
	public String toString() {
		return "Student [Sno=" + Sno + ", Sname=" + Sname + ", Ssex=" + Ssex + ", Sage=" + Sage + ", ClassNo=" + ClassNo
				+ ", major=" + major + ", Scode=" + Scode + ", Spower=" + Spower + "]";
	}

	public String getSno() {
		return Sno;
	}

	public void setSno(String sno) {
		Sno = sno;
	}

	public String getSname() {
		return Sname;
	}

	public void setSname(String sname) {
		Sname = sname;
	}

	public Integer getSage() {
		return Sage;
	}

	public void setSage(Integer sage) {
		Sage = sage;
	}

	public String getClassNo() {
		return ClassNo;
	}

	public void setClassNo(String classNo) {
		ClassNo = classNo;
	}

	public String getSsex() {
		return Ssex;
	}

	public void setSsex(String ssex) {
		Ssex = ssex;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getScode() {
		return Scode;
	}

	public void setScode(String scode) {
		Scode = scode;
	}

	public String getSpower() {
		return Spower;
	}

	public void setSpower(String spower) {
		Spower = spower;
	}

}
