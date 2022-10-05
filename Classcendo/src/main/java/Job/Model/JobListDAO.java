package Job.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Database.ChangeDatabase;

public class JobListDAO {

	// 직업 목록 관리 클래스
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

	// 직업 목록 불러오기
	public ArrayList<JobListDTO> getJobList(String jobsName) {
		changeDatabase.getConn();
		result = false;
		ArrayList<JobListDTO> jobList = new ArrayList<>();
		String[] nameList = jobsName.split(",");
		try {
			for (int i = 0; i < nameList.length; i++) {
				sql = "select * from job_list where job_name = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, nameList[i]);

				rs = psmt.executeQuery();
				while (rs.next()) {
					result = true;
					int jobSeq = rs.getInt(1);
					String jobName = rs.getString(2);
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

	// 직업 정보 불러오기
	public JobListDTO getJobInfo(String jobName) {
		changeDatabase.getConn();
		result = false;
		JobListDTO dto = null;
		try {
			sql = "select * from job_list where job_name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, jobName);

			rs = psmt.executeQuery();
			while (rs.next()) {
				result = true;
				int jobSeq = rs.getInt(1);
				String relationDept = rs.getString(3);
				String relationCert = rs.getString(4);
				dto = new JobListDTO(jobSeq, jobName, relationDept, relationCert);
			}
			if (!result) {
				dto = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return dto;
	}
}
