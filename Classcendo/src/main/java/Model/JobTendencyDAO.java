package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class JobTendencyDAO {

	// 직업 관련 성향 관리 클래스
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

	// 관련 성향을 가진 직업 불러오기
	public ArrayList<Integer> getJobTendency(String tendencys) {
		changeDatabase.getConn();
		result = false;
		ArrayList<Integer> jobList = new ArrayList<>();
		String[] tendencyList = tendencys.split(",");
		String jobsSeq = "";
		try {
			for (int i = 0; i < tendencyList.length; i++) {
				sql = "select * from job_list where tendency_name like ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%" + tendencyList[i] + "%");

				rs = psmt.executeQuery();
				while (rs.next()) {
					result = true;
					int jobSeq = rs.getInt(1);
					jobList.add(jobSeq - 1);
				}
			}
			if (!result) {
				jobList = null;
			}
			HashSet<Integer> distincJobList = new HashSet<Integer>(jobList);
			jobList = new ArrayList<Integer>(distincJobList);
			jobsSeq = jobList.toString().replaceAll("[^0-99,]", "");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return jobList;
	}

}
