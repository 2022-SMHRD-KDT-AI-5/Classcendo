package Consulting.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Database.ChangeDatabase;

public class ConsultingRecordDAO {

	// 학생 상담 기록 관리 클래스

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

	// 상담기록 추가
	public boolean addConsultingRecord(ConsultingRecordDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "insert into consulting_record values(consulting_record_SEQ.nextval, ?, ?, default)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getSrSeq());
			psmt.setInt(2, dto.getArlSeq());
			psmt.setString(3, dto.getScContent());

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

	// 상담기록 수정
	public boolean updateConsultingRecord(ConsultingRecordDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "update consulting_record set sc_content = ?, sc_date = default where arl_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getScContent());
			psmt.setInt(2, dto.getArlSeq());

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

	// 상담기록 불러오기
	public ConsultingRecordDTO getConsultingRecord(int seq) {
		changeDatabase.getConn();
		result = false;
		ConsultingRecordDTO dto = null;
		try {
			sql = "select * from consulting_record where arl_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			rs = psmt.executeQuery();
			while (rs.next()) {
				result = true;
				int scSeq = rs.getInt(1);
				int srSeq = rs.getInt(2);
				int arlSeq = rs.getInt(3);
				String scContent = rs.getString(4);
				String scDate = rs.getString(5);
				dto = new ConsultingRecordDTO(scSeq, srSeq, arlSeq, scContent, scDate);
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
	
	// 상담기록 삭제
	public boolean deleteConsultingRecord(ConsultingRecordDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "delete from consulting_record where sc_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getScSeq());

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
