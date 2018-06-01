package tdl.form;

import org.apache.struts.validator.ValidatorForm;

public class UserForm extends ValidatorForm {

	private int uid;
	private String userid;
	private String userpw;
	private String username;
	private String useremail;

	public UserForm() {
	}

	public UserForm(int uid, String userid, String userpw, String username, String useremail) {
		super();
		this.uid = uid;
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.useremail = useremail;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	@Override
	public String toString() {
		return "UserForm [uid=" + uid + ", userid=" + userid + ", userpw=" + userpw + ", username=" + username
				+ ", useremail=" + useremail + "]";
	}

}
