package tdl.form;

import org.apache.struts.action.ActionForm;

public class TaskForm extends ActionForm {

	private int tid;
	private String tasktitle;
	private String taskdate;
	private String taskcontents;
	private int taskstatus;
	private int userid;

	public TaskForm() {
	}

	public TaskForm(int tid, String tasktitle, String taskdate, String taskcontents, int taskstatus, int userid) {
		super();
		this.tid = tid;
		this.tasktitle = tasktitle;
		this.taskdate = taskdate;
		this.taskcontents = taskcontents;
		this.taskstatus = taskstatus;
		this.userid = userid;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTasktitle() {
		return tasktitle;
	}

	public void setTasktitle(String tasktitle) {
		this.tasktitle = tasktitle;
	}

	public String getTaskdate() {
		return taskdate;
	}

	public void setTaskdate(String taskdate) {
		this.taskdate = taskdate;
	}

	public String getTaskcontents() {
		return taskcontents;
	}

	public void setTaskcontents(String taskcontents) {
		this.taskcontents = taskcontents;
	}

	public int getTaskstatus() {
		return taskstatus;
	}

	public void setTaskstatus(int taskstatus) {
		this.taskstatus = taskstatus;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "TaskForm [tid=" + tid + ", tasktitle=" + tasktitle + ", taskdate=" + taskdate + ", taskcontents="
				+ taskcontents + ", taskstatus=" + taskstatus + ", userid=" + userid + "]";
	}

}
