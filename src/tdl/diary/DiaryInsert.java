package tdl.diary;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.simple.JSONObject;

import tdl.form.UserForm;

public class DiaryInsert extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("[dinsert : start]");
		HttpSession session = request.getSession();

		UserForm user = (UserForm) session.getAttribute("user");
		int userid = user.getUid();

		String title = URLDecoder.decode(request.getParameter("diarytitle"), "UTF-8");
		String date = request.getParameter("diarydate");
		String rate = request.getParameter("diaryrate");
		String contents = URLDecoder.decode(request.getParameter("diarycontents"), "UTF-8");

		System.out.println("[dinsert : value check] "+userid+" : "+title+" : "+date+" : "+contents+" : "+rate);

		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean result = false;

		try {
			// DB連結
			con = getDataSource(request).getConnection();
			// SQL文作成
			String sql = "INSERT INTO tdl_diary(did, diary_title, diary_date, diary_contents, diary_rate, diary_userid, diary_input) "
					+"VALUES(0, ?, ?, ?, ?, ?, CURRENT_DATE())";
			// preparedStatmentにSQLセッティング
			pstmt = con.prepareStatement(sql);
			// preparedStatmentに値セット
			pstmt.setString(1, title);
			pstmt.setString(2, date);
			pstmt.setString(3, contents);
			pstmt.setString(4, rate);
			pstmt.setInt(5, userid);
			// DBを実行してResultSetに結果保存
			int n = pstmt.executeUpdate();

			if (n >= 0) {
				result = true;
				System.out.println("[insert : success]");
			}else {
				result = null;
				System.out.println("[insert : fail]");
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

		JSONObject json = new JSONObject();
		json.put("insertresult", result);
//		String json = new Gson().toJson(tasklist);
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();

		System.out.println("[insert : end]");

		return null;
	}
}
