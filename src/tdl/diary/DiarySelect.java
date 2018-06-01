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

public class DiarySelect extends Action {


	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("[dupdate : start]");
		HttpSession session = request.getSession();

		JSONObject json = new JSONObject();
		PrintWriter out = response.getWriter();

		if (session.getAttribute("diaryupdateflag")==null) {
			System.out.println("[dupdate : mkflag]");
			session.setAttribute("diaryupdateflag", true);
			json.put("mkdupflag", true);
			out.println(json);
			out.flush();
			return null;
		}

		UserForm user = (UserForm) session.getAttribute("user");
		int userid = user.getUid();

		String title = URLDecoder.decode(request.getParameter("diarytitle"), "UTF-8");
		String date = request.getParameter("diarydate");
		String rate = request.getParameter("diaryrate");
		String contents = URLDecoder.decode(request.getParameter("diarycontents"), "UTF-8");
		String did = request.getParameter("did");

		System.out.println("[dupdate : value check] "+userid+" : "+title+" : "+date+" : "+contents+" : "+did);

		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean result = false;

		try {
			// DB連結
			con = getDataSource(request).getConnection();
			// SQL文作成
			String sql = "UPDATE tdl_diary SET diary_title = ?, diary_date = ?, diary_contents = ?, diary_rate = ? WHERE did = ? AND diary_userid = ?";
			// preparedStatmentにSQLセッティング
			pstmt = con.prepareStatement(sql);
			// preparedStatmentに値セット
			pstmt.setString(1, title);
			pstmt.setString(2, date);
			pstmt.setString(3, contents);
			pstmt.setString(4, rate);
			pstmt.setString(5, did);
			pstmt.setInt(6, userid);
			// DBを実行してResultSetに結果保存
			int n = pstmt.executeUpdate();

			if (n >= 0) {
				result = true;
				System.out.println("[dupdate : success]");
			}else {
				result = null;
				System.out.println("[dupdate : fail]");
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
		session.removeAttribute("diaryupdateflag");

		json.put("diaryupdate", true);
		out.println(json);
		out.flush();

		System.out.println("[dupdate : end]");

		return null;
	}
}
