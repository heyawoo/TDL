package tdl.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import tdl.form.UserForm;


public class LoginCheck {

	public UserForm checkUserid(UserForm user, DataSource sourse){

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserForm loginuser = new UserForm();

		try {
			// DB連結
//			ConnectDB cdb = new ConnectDB();
//			con = cdb.connecting();
			con = sourse.getConnection();
			// SQL文作成
			String sql = "SELECT * FROM tdl_user WHERE user_id = ? AND user_pw = ?";
			// preparedStatmentにSQLセッティング
			pstmt = con.prepareStatement(sql);
			// preparedStatmentに値セット
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getUserpw());
			// DBを実行してResultSetに結果保存
			rs = pstmt.executeQuery();

			while (rs.next()) {
				loginuser.setUid(rs.getInt("uid"));
				loginuser.setUserid(rs.getString("user_id"));
				loginuser.setUserpw(rs.getString("user_pw"));
				loginuser.setUsername(rs.getString("user_name"));
				loginuser.setUseremail(rs.getString("user_email"));
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

		return loginuser;
	}


}
