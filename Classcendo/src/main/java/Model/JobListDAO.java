package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class JobListDAO {
	
	// 직업 목록 관리 클래스
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

	// 직업 목록 불러오기
	public ArrayList<JobListDTO> getJobList(String seq) {
		changeDatabase.getConn();
		result = false;
		ArrayList<JobListDTO> jobList = new ArrayList<>();
		String[] seqList = seq.split(",");
		try {
			for(int i = 0; i < seqList.length; i++) {
				sql = "select * from job_list where job_seq = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, Integer.parseInt(seqList[i]) + 1);
				
				rs = psmt.executeQuery();
				while (rs.next()) {
					result = true;
					int jobSeq = rs.getInt(1);
					String jobName= rs.getString(2);
					String relationDept = rs.getString(3);
					String relationCert = rs.getString(4);
					JobListDTO dto = new JobListDTO(jobSeq, jobName, relationDept, relationCert);
					jobList.add(dto);
				}
			}
			if (!result) {
				jobList = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return jobList;
	}
}
