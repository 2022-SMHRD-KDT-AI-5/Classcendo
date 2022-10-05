package Analysis.Model;

import java.sql.*;
import java.util.ArrayList;

import Database.ChangeDatabase;

public class AnalysisResultListDAO {

	// 학생 분석 결과 목록 관리 클래스
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
	
	// 학생 분석 결과 추가
	public boolean addAnalysisResult(AnalysisResultListDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "insert into analysis_result_list values(analysis_result_list_SEQ.nextval, ?, ?, ?, ?, ?, default, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getSrSeq());
			psmt.setDouble(2, dto.getTendency1Rate());
			psmt.setDouble(3, dto.getTendency2Rate());
			psmt.setDouble(4, dto.getTendency3Rate());
			psmt.setDouble(5, dto.getTendency4Rate());
			psmt.setString(6, dto.getJobsName());

			row = psmt.executeUpdate();
			if (row > 0)
				result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return result;
	}

	// 학생 분석 결과 업데이트
	public boolean updateAnalysisResult(AnalysisResultListDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "update analysis_result_list set tendency_1_rate = ?, tendency_2_rate = ?, tendency_3_rate = ?, tendency_4_rate = ?, jobs_seq = ? where sr_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, dto.getTendency1Rate());
			psmt.setDouble(2, dto.getTendency2Rate());
			psmt.setDouble(3, dto.getTendency3Rate());
			psmt.setDouble(4, dto.getTendency4Rate());
			psmt.setString(5, dto.getJobsName());
			psmt.setInt(6, dto.getSrSeq());

			row = psmt.executeUpdate();
			if (row > 0)
				result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return result;
	}
	
	// 학생 분석 결과 모두 삭제
	public boolean deleteAllAnalysisResultList(int seq) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "delete from analysis_result_list where srl_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			row = psmt.executeUpdate();
			if (row > 0)
				result = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return result;
	}
	
	// 학생 분석 결과 삭제
	public boolean deleteAnalysisResultList(int seq) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "delete from analysis_result_list where sr_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			row = psmt.executeUpdate();
			if (row > 0)
				result = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return result;
	}
	
	// 학생 분석 결과 모두 불러오기
	public ArrayList<AnalysisResultListDTO> getAnalysisResultList(int seq) {
		changeDatabase.getConn();
		result = false;
		ArrayList<AnalysisResultListDTO> list = new ArrayList<>();
		try {
			sql = "select * from analysis_result_list where sr_seq = ? order by arl_date desc";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			rs = psmt.executeQuery();
			while (rs.next()) {
				result = true;
				int arlSeq = rs.getInt(1);
				int srSeq = rs.getInt(2);
				double tendency1Rate = rs.getDouble(3);
				double tendency2Rate = rs.getDouble(4);
				double tendency3Rate = rs.getDouble(5);
				double tendency4Rate = rs.getDouble(6);
				String arlDate = rs.getString(7);
				String jobsSeq = rs.getString(8);
				AnalysisResultListDTO dto = new AnalysisResultListDTO(arlSeq, srSeq, tendency1Rate, tendency2Rate, tendency3Rate,
						tendency4Rate, arlDate, jobsSeq);
				list.add(dto);
			}
			if (!result) {
				list = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return list;
	}
	
	// 학생 분석 결과 불러오기
	public AnalysisResultListDTO getAnalysisResult(int seq) {
		changeDatabase.getConn();
		result = false;
		AnalysisResultListDTO dto = null;
		try {
			sql = "select * from analysis_result_list where arl_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			rs = psmt.executeQuery();
			while (rs.next()) {
				result = true;
				double tendency1Rate = rs.getDouble(3);
				double tendency2Rate = rs.getDouble(4);
				double tendency3Rate = rs.getDouble(5);
				double tendency4Rate = rs.getDouble(6);
				String jobsName = rs.getString(8);
				dto = new AnalysisResultListDTO(tendency1Rate, tendency2Rate, tendency3Rate, tendency4Rate, jobsName);
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
	
	// 학생 분석 결과 유무 확인
	public boolean getAnalysisResultExistence(int seq) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "select * from analysis_result_list where sr_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			rs = psmt.executeQuery();
			if (rs.next()) result = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return result;
	}
}
