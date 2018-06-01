package tdl.form;

import org.apache.struts.action.ActionForm;

public class DiaryForm extends ActionForm {

	private int did;
	private String diarytitle;
	private String diarydate;
	private String diarycontents;
	private int diaryrate;
	private int userid;

	public DiaryForm() {
	}

	public DiaryForm(int did, String diarytitle, String diarydate, String diarycontents, int diaryrate, int userid) {
		super();
		this.did = did;
		this.diarytitle = diarytitle;
		this.diarydate = diarydate;
		this.diarycontents = diarycontents;
		this.diaryrate = diaryrate;
		this.userid = userid;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public String getDiarytitle() {
		return diarytitle;
	}

	public void setDiarytitle(String diarytitle) {
		this.diarytitle = diarytitle;
	}

	public String getDiarydate() {
		return diarydate;
	}

	public void setDiarydate(String diarydate) {
		this.diarydate = diarydate;
	}

	public String getDiarycontents() {
		return diarycontents;
	}

	public void setDiarycontents(String diarycontents) {
		this.diarycontents = diarycontents;
	}

	public int getDiaryrate() {
		return diaryrate;
	}

	public void setDiaryrate(int diaryrate) {
		this.diaryrate = diaryrate;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "DiaryForm [did=" + did + ", diarytitle=" + diarytitle + ", diarydate=" + diarydate + ", diarycontents="
				+ diarycontents + ", diaryrate=" + diaryrate + ", userid=" + userid + "]";
	}

}
