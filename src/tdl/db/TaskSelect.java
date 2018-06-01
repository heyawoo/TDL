package tdl.db;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.simple.JSONObject;

import tdl.form.TaskForm;

public class TaskSelect extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		String tid = request.getParameter("taskid");

		System.out.println("[select : value check] "+tid);

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TaskForm update = new TaskForm();
		Boolean result = false;

		try {
			// DB連結
			con = getDataSource(request).getConnection();
			// SQL文作成
			String sql = "SELECT tid, task_title, task_date, IFNULL(task_contents, '') as task_contents, task_status, task_userid "
					+ "FROM tdl_task WHERE tid = ?";
			// preparedStatmentにSQLセッティング
			pstmt = con.prepareStatement(sql);
			// preparedStatmentに値セット
			pstmt.setString(1, tid);
			// DBを実行してResultSetに結果保存
			rs = pstmt.executeQuery();

			while (rs.next()) {
				update.setTid(rs.getInt("tid"));
				update.setTasktitle(rs.getString("task_title"));
				update.setTaskdate(rs.getString("task_date"));
				update.setTaskcontents(rs.getString("task_contents"));
				update.setTaskstatus(rs.getInt("task_status"));
				update.setUserid(rs.getInt("task_userid"));
			}

			System.out.println("[select : value check] "+update.toString());
			session.setAttribute("update", update);
			result = true;

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

		JSONObject json = new JSONObject();
		json.put("selectresult", result);
//		String json = new Gson().toJson(tasklist);
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();

		return null;
	}
}
