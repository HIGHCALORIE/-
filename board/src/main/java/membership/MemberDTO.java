package membership;

import java.io.Serializable;

public class MemberDTO {
	private static final long SerialvarsionUID=1L;

	
	private String user_id;
	private String user_pw;
	private String username;
	private String regidate;
	
	
	

	public MemberDTO() {
		super();
	}
	public MemberDTO(String user_id, String user_pw, String username, String regidtae) {
		this.user_id=user_id;
		this.user_pw=user_pw;
		this.username=username;
		this.regidate=regidate;
	}
	
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
}
