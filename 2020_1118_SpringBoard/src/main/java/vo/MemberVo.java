package vo;

public class MemberVo {
	
	int m_idx;
	String m_name;
	String m_id;
	String m_pwd;
	String m_zipcode;
	String m_addr;
	String m_grade;
	String m_ip;
	String m_regdate;
	
	//노출시키는 비번
	String m_display_pwd;
	
	
	
	public String getM_display_pwd() {
		int len = m_pwd.length(); //문자길이
		StringBuffer sb = new StringBuffer();
		sb.append(m_pwd.substring(0,len/2));
		for(int i=0; i<(len-len/2); i++) {
			sb.append("*");
		}
		
		return sb.toString();
	}

	
	public MemberVo() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberVo(String m_name, String m_id, String m_pwd, String m_zipcode, String m_addr, String m_ip) {
		super();
		this.m_name = m_name;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_zipcode = m_zipcode;
		this.m_addr = m_addr;
		this.m_ip= m_ip;
	}
	


	public MemberVo(int m_idx, String m_name, String m_id, String m_pwd, String m_zipcode, String m_addr, String m_grade,String m_ip) {
		super();
		this.m_idx = m_idx;
		this.m_name = m_name;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_zipcode = m_zipcode;
		this.m_addr = m_addr;
		this.m_grade = m_grade;
		this.m_ip = m_ip;
		
	}


	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_zipcode() {
		return m_zipcode;
	}
	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getM_grade() {
		return m_grade;
	}
	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_ip() {
		return m_ip;
	}
	public void setM_ip(String m_ip) {
		this.m_ip = m_ip;
	}
	public String getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}
	
	
	
}
