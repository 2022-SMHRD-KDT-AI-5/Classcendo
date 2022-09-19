package Model;

import java.sql.*;

public class AnalysisResultListDAO {

	// 학생기록을 관리 클래스
	// 데이터베이스에서 사용되는 객체 선언
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	boolean result = false;
	int row = 0;
	String sql = "";
	ChangeDatabase changeDatabase;

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
	
	// 학생 분석 결과 추가
	public boolean addAnalysisResult(AnalysisResultListDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "insert into analysis_result_list(analysis_result_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getSrSeq());
			psmt.setInt(2, dto.getTendency1Rate());
			psmt.setInt(3, dto.getTendency2Rate());
			psmt.setInt(4, dto.getTendency3Rate());
			psmt.setInt(5, dto.getTendency4Rate());
			psmt.setString(6, dto.getArlGraphPath());
			psmt.setString(7, dto.getJobsSeq());

			row = psmt.executeUpdate();
			if(row > 0) result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return result;
	}
}
