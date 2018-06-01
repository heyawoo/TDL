package tdl.action;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import tdl.form.UserForm;

public class SignupAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		UserForm signupuser = (UserForm) form;
		System.out.println("sign up user : "+signupuser.toString());

		HttpSession session = request.getSession();
		Connection con = null;
		PreparedStatement pstmt = null;
		String flag = (String) session.getAttribute("idcheckflag");

		if (flag == null) {

			session.setAttribute("newuser", signupuser);

			return mapping.findForward("gosignup");
		}
		if (flag.equals("1")) {

			session.setAttribute("newuser", signupuser);

            return mapping.findForward("gosignup");
		}

		if (signupuser.getUserid() == null || signupuser.getUserid().equals("") ||
			signupuser.getUserpw() == null || signupuser.getUserpw().equals("") ||
			signupuser.getUsername() == null || signupuser.getUsername().equals("") ||
			signupuser.getUseremail() == null || signupuser.getUseremail().equals("")) {

			return mapping.findForward("gosignup");
		}

		if (flag.equals("0")) {

			System.out.println("session remove in");
			session.removeAttribute("newuser");
			session.removeAttribute("idcheckflag");
			session.removeAttribute("checkedid");

		}

		try {
			// DB連結
			con = getDataSource(request).getConnection();
			// SQL文作成
			String sql = "INSERT INTO tdl_user VALUES(0, ?, ?, ?, ?)";
			// preparedStatmentにSQLセッティング
			pstmt = con.prepareStatement(sql);
			// preparedStatmentに値セット
			pstmt.setString(1, signupuser.getUserid());
			pstmt.setString(2, signupuser.getUserpw());
			pstmt.setString(3, signupuser.getUsername());
			pstmt.setString(4, signupuser.getUseremail());
			// DBを実行してResultSetに結果保存
			int result = pstmt.executeUpdate();

			if (result == 0) {
				System.out.println("User Sign Up fail");
			} else {
				System.out.println("User Sign Up success");
				request.getSession().invalidate();
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

		return mapping.findForward("gologin");
	}
}
