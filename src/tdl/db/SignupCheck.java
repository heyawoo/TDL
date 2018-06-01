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


public class SignupCheck extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String userid = request.getParameter("userid");

		System.out.println("sign up check ID : "+userid);

		HttpSession session = request.getSession();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Boolean result = false;
		String flag = (String) session.getAttribute("idcheckflag");

		try {
			// DB連結
			con = getDataSource(request).getConnection();
			// SQL文作成
			String sql = "SELECT * FROM tdl_user WHERE user_id = ? ";
			// preparedStatmentにSQLセッティング
			pstmt = con.prepareStatement(sql);
			// preparedStatmentに値セット
			pstmt.setString(1, userid);
			// DBを実行してResultSetに結果保存
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = true;
				flag = "1";
			}else {
				result = false;
				flag = "0";
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

		session.removeAttribute("idcheckflag");
		session.setAttribute("idcheckflag", flag);

		session.removeAttribute("checkedid");
		session.setAttribute("checkedid", userid);

		JSONObject json = new JSONObject();
		json.put("idcheckresult", result);
//		String json = new Gson().toJson(tasklist);
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();


		return null;
	}
}
