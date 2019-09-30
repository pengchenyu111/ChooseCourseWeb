package cn.tedu.entity;

public class LoginUser {

	private String account;
	private String password;
	private String power;
	public LoginUser(String account, String password, String power) {
		this.account = account;
		this.password = password;
		this.power = power;
	}
	@Override
	public String toString() {
		return "LoginUser [account=" + account + ", password=" + password + ", power=" + power + "]";
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	
	
}
