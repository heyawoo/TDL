package tdl.diary;

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

import tdl.form.DiaryForm;
import tdl.form.TaskForm;
import tdl.form.UserForm;

public class DiaryList extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();


		UserForm user = (UserForm) session.getAttribute("user");
		int userid = user.getUid();
		String thedate = request.getParameter("thedate");

		if (thedate == null) {
			Date d = new Date();
			SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
			thedate = simple.format(d);
		}

		System.out.println("[diarylist : value check] "+userid+" : "+thedate);

		// database
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;

		ArrayList<TaskForm> completelist = new ArrayList<>();
		DiaryForm diary = new DiaryForm();

		try {
			// DB連結
			con = getDataSource(request).getConnection();
			// SQL文作成
			String sql = "SELECT did, diary_title, diary_date, IFNULL(diary_contents, '') as diary_contents, IFNULL(diary_rate, '') as diary_rate, diary_userid "
					+ "FROM tdl_diary WHERE diary_userid = ? AND diary_date = ?";
			// preparedStatmentにSQLセッティング
			pstmt = con.prepareStatement(sql);
			// preparedStatmentに値セット
			pstmt.setInt(1, userid);
			pstmt.setString(2, thedate);
			// DBを実行してResultSetに結果保存
			rs = pstmt.executeQuery();

			while (rs.next()) {
				diary.setDid(rs.getInt("did"));
				diary.setDiarytitle(rs.getString("diary_title"));
				diary.setDiarydate(rs.getString("diary_date"));
				diary.setDiarycontents(rs.getString("diary_contents"));
				diary.setDiaryrate(rs.getInt("diary_rate"));
				diary.setUserid(rs.getInt("diary_userid"));
			}

			rs.close();

			sql = "SELECT tid, task_title, task_date, IFNULL(task_contents, '') as task_contents, task_status, task_userid "
					+ "FROM tdl_task WHERE task_userid = ? AND task_date = ? AND task_status = 1";
			// preparedStatmentにSQLセッティング
			pstmt2 = con.prepareStatement(sql);
			// preparedStatmentに値セット
			pstmt2.setInt(1, userid);
			pstmt2.setString(2, thedate);
			// DBを実行してResultSetに結果保存
			rs = pstmt2.executeQuery();

			while (rs.next()) {
				TaskForm task = new TaskForm();
				task.setTid(rs.getInt("tid"));
				task.setTasktitle(rs.getString("task_title"));
				task.setTaskdate(rs.getString("task_date"));
				task.setTaskcontents(rs.getString("task_contents"));
				task.setTaskstatus(rs.getInt("task_status"));
				task.setUserid(rs.getInt("task_userid"));
				completelist.add(task);
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
				if (pstmt2 != null) {
					pstmt2.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		if (session.getAttribute("diary") != null) {
			session.removeAttribute("diary");
		}
		if (session.getAttribute("completelist") != null) {
			session.removeAttribute("completelist");
		}

		session.setAttribute("targetdate", thedate);
		session.setAttribute("diary", diary);
		session.setAttribute("completelist", completelist);


		return mapping.findForward("godiarylist");
	}
}
