package cn.tedu.entity;

public class Teacher {

	private String Tno;
	private String Tname;
	private String TSex;
	private int Tage;
	private String Tposition;
	private String Tcode;
	private String Tpower;
	
	public Teacher() {
	}
	public Teacher(String Tno,String Tname,String TSex,int Tage,String Tposition,String Tcode,String Tpower) {
		this.Tno = Tno;
		this.Tname = Tname;
		this.TSex = TSex;
		this.Tage = Tage;
		this.Tposition = Tposition;
		this.Tcode = Tcode;
		this.Tpower = Tpower;
	}
	
	@Override
	public String toString() {
		return "Teacher [Tno=" + Tno + ", Tname=" + Tname + ", TSex=" + TSex + ", Tage=" + Tage + ", Tposition="
				+ Tposition + ", Tcode=" + Tcode + ", Tpower=" + Tpower + "]";
	}
	public String getTno() {
		return Tno;
	}
	public void setTno(String tno) {
		Tno = tno;
	}
	public String getTname() {
		return Tname;
	}
	public void setTname(String tname) {
		Tname = tname;
	}
	public String getTSex() {
		return TSex;
	}
	public void setTSex(String tSex) {
		TSex = tSex;
	}
	public int getTage() {
		return Tage;
	}
	public void setTage(int tage) {
		Tage = tage;
	}
	public String getTposition() {
		return Tposition;
	}
	public void setTposition(String tposition) {
		Tposition = tposition;
	}
	public String getTcode() {
		return Tcode;
	}
	public void setTcode(String tcode) {
		Tcode = tcode;
	}
	public String getTpower() {
		return Tpower;
	}
	public void setTpower(String tpower) {
		Tpower = tpower;
	}
	
}
