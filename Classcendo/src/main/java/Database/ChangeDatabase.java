package Database;

import java.sql.*;

public class ChangeDatabase {
	
	Connection conn = null;
	
	// 실 데이터베이스 연결
/*	public Connection getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "Clascendo";
			String pw = "Clascendo_2022";

			conn = DriverManager.getConnection(url, user, pw);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}*/

	// 임시 데이터베이스 연결
	public Connection getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String pw = "hr";

			conn = DriverManager.getConnection(url, user, pw);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
