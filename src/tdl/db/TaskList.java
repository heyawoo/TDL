package tdl.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import tdl.form.TaskForm;
import tdl.form.UserForm;

public class TaskList extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute("updateflag") != null) {
			int flag = (int) session.getAttribute("updateflag");
			TaskForm update = (TaskForm) session.getAttribute("update");
			if (flag == update.getTid()) {
				session.removeAttribute("update");
				session.removeAttribute("updateflag");
			}
		}

		UserForm user = (UserForm) session.getAttribute("user");
		int userid = user.getUid();
		String thedate = request.getParameter("thedate");

		if (thedate == null) {
			Date d = new Date();
			SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
			thedate = simple.format(d);
		}

		System.out.println("[tasklist : value check] "+userid+" : "+thedate);
		// database
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<TaskForm> tasklist = new ArrayList<>();

		try {
			// DB連結
			con = getDataSource(request).getConnection();
			// SQL文作成
			String sql = "SELECT tid, task_title, task_date, IFNULL(task_contents, '') as task_contents, task_status, task_userid "
					+ "FROM tdl_task WHERE task_userid = ? AND task_date = ?";
			// preparedStatmentにSQLセッティング
			pstmt = con.prepareStatement(sql);
			// preparedStatmentに値セット
			pstmt.setInt(1, userid);
			pstmt.setString(2, thedate);
			// DBを実行してResultSetに結果保存
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TaskForm task = new TaskForm();
				task.setTid(rs.getInt("tid"));
				task.setTasktitle(rs.getString("task_title"));
				task.setTaskdate(rs.getString("task_date"));
				task.setTaskcontents(rs.getString("task_contents"));
				task.setTaskstatus(rs.getInt("task_status"));
				task.setUserid(rs.getInt("task_userid"));
				tasklist.add(task);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		if (session.getAttribute("tasklist")!=null) {
			session.removeAttribute("tasklist");
		}

		session.setAttribute("targetdate", thedate);
		session.setAttribute("tasklist", tasklist);

		if (session.getAttribute("update")!=null) {
			TaskForm update = (TaskForm) session.getAttribute("update");
			session.setAttribute("updateflag", update.getTid());
		}
//		String json = new Gson().toJson(tasklist);
//		PrintWriter out = response.getWriter();
//		out.println(json);
//		out.flush();

		return mapping.findForward("gotodolist");
	}
}
