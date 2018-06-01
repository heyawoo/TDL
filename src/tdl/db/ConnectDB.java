package tdl.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {


	public Connection connecting(){

		Connection con = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost/kpspark", "root", "");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;

	}

}
