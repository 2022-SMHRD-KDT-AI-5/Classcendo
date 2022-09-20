package Analysis.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Database.ChangeDatabase;

public class TendencyListDAO {

	// 성향 목록 관리 클래스
	// 데이터베이스에서 사용되는 객체 선언
	ChangeDatabase changeDatabase = new ChangeDatabase();
	Connection conn = changeDatabase.getConn();
	PreparedStatement psmt = null;
	ResultSet rs = null;
	boolean result = false;
	int row = 0;
	String sql = "";

	// 데이터베이스 닫기
	public void closeConn() {

		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 성향 불러오기
	public ArrayList<TendencyListDTO> getTendencyList(int seq) {
		changeDatabase.getConn();
		result = false;
		ArrayList<TendencyListDTO> tendencyList = new ArrayList<>();
		try {
			sql = "select * from tendencyList where tendency_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			rs = psmt.executeQuery();
			while (rs.next()) {
				result = true;
				int tendencySeq = rs.getInt(1);
				String tendencyName = rs.getString(2);
				TendencyListDTO dto = new TendencyListDTO(tendencySeq, tendencyName);
				tendencyList.add(dto);
			}
			if (!result) {
				tendencyList = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return tendencyList;
	}

}
