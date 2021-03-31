package vo;

public class MemberVo {

	int m_idx;
	String m_id;
	String m_pwd;
	String m_name;
	String m_nickname;
	int m_age;
	String m_sex;
	String m_regdate;
	
	//노출시키는 비밀번호
	String m_display_pwd;
	
	
	public MemberVo() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberVo(int m_idx, String m_id, String m_pwd, String m_name, String m_nickname, int m_age, String m_sex,
			String m_regdate, String m_display_pwd) {
		super();
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_age = m_age;
		this.m_sex = m_sex;
		this.m_regdate = m_regdate;
		this.m_display_pwd = m_display_pwd;
	}

	public MemberVo(String m_id, String m_pwd, String m_name, String m_nickname, int m_age, String m_sex) {
		super();
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_age = m_age;
		this.m_sex = m_sex;
	}
	


	public MemberVo(int m_idx, String m_pwd, String m_name, String m_nickname, int m_age, String m_sex) {
		super();
		this.m_idx = m_idx;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_age = m_age;
		this.m_sex = m_sex;
	}



	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
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

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public int getM_age() {
		return m_age;
	}

	public void setM_age(int m_age) {
		this.m_age = m_age;
	}

	public String getM_sex() {
		return m_sex;
	}

	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
	}

	public String getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}

	public void setM_display_pwd(String m_display_pwd) {
		this.m_display_pwd = m_display_pwd;
	}

	public String getM_display_pwd() {
		int pwd_len = getM_pwd().length();
		m_display_pwd = getM_pwd().substring(0, pwd_len/2);
		StringBuffer sb = new StringBuffer(m_display_pwd);
		for(int i=0;i<pwd_len-pwd_len/2;i++)
		{
			sb.append("*");
		}
		m_display_pwd = sb.toString();
		
		return m_display_pwd;
	}

	
	
}
