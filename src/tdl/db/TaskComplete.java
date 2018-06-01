package tdl.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class TaskComplete extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String status = request.getParameter("taskstatus");
		String tid = request.getParameter("taskid");

		System.out.println("[complete : value check] "+tid);

		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean result = false;

		try {
			// DB連結
			con = getDataSource(request).getConnection();
			// SQL文作成
			String sql = "UPDATE tdl_task SET task_status = ? WHERE tid = ?";
			// preparedStatmentにSQLセッティング
			pstmt = con.prepareStatement(sql);
			// preparedStatmentに値セット
			pstmt.setString(1, status);
			pstmt.setString(2, tid);
			// DBを実行してResultSetに結果保存
			int n = pstmt.executeUpdate();

			if (n >= 0) {
				result = true;
				System.out.println("[complete : success]");
			}else {
				result = null;
				System.out.println("[complete : fail]");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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

//		JSONObject json = new JSONObject();
//		json.put("completeresult", result);
//		String json = new Gson().toJson(tasklist);
//		PrintWriter out = response.getWriter();
//		out.println(json);
//		out.flush();

		return null;
	}
}
