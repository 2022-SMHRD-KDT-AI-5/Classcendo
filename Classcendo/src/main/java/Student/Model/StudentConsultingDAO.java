package Student.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Database.ChangeDatabase;

public class StudentConsultingDAO {

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
	public boolean addStudentConsulting(StudentConsultingDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "insert into student_consulting(student_consulting_SEQ.nextval, ?, ?, default)";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getScSeq());
			psmt.setInt(2, dto.getSrSeq());
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
	public boolean updateStudentConsulting(StudentConsultingDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "update student_consulting set sr_seq = ?, sc_content = ?, sc_date = default where sc_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getSrSeq());
			psmt.setString(2, dto.getScContent());
			psmt.setInt(3, dto.getScSeq());

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
	public ArrayList<StudentConsultingDTO> getStudentConsulting (int seq) {
		changeDatabase.getConn();
		result = false;
		ArrayList<StudentConsultingDTO> scList = new ArrayList<>();
		try {
			sql = "select * from student_consulting where sr_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			rs = psmt.executeQuery();
			while (rs.next()) {
				result = true;
				int scSeq = rs.getInt(1);
				int srSeq = rs.getInt(2);
				String scContent = rs.getString(3);
				String scDate = rs.getString(4);
				StudentConsultingDTO dto = new StudentConsultingDTO(scSeq, srSeq, scContent, scDate);
				scList.add(dto);
			}
			if (!result) {
				scList = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return scList;
	}
	
	// 상담기록 삭제
	public boolean deleteStudentConsulting(StudentConsultingDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "delete from student_consulting where sc_seq = ?";
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
