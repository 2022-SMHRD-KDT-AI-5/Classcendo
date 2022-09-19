package Model;

import java.sql.*;
import java.util.ArrayList;

public class StudentRecordDAO {

	// 학생기록 관리 클래스
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

	// 학생 추가
	public boolean addStudent(StudentRecordDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "insert into student_record(student_record_SEQ.nextval, ?, ?, ?, ?, default)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getSrlSeq());
			psmt.setInt(2, dto.getStdNum());
			psmt.setString(3, dto.getStdName());
			psmt.setString(4, dto.getSrContent());

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

	// 학생기록 업데이트
	public boolean updateStudentRecord(StudentRecordDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "update student_record set srl_seq = ?, std_num = ?, std_name = ?, sr_content = ?, sr_date = default where sr_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getSrlSeq());
			psmt.setInt(2, dto.getStdNum());
			psmt.setString(3, dto.getStdName());
			psmt.setString(4, dto.getSrContent());
			psmt.setInt(5, dto.getSrSeq());

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

	// 모든 학생기록 불러오기
	public ArrayList<StudentRecordDTO> getAllStudentRecord(int seq) {
		changeDatabase.getConn();
		result = false;
		ArrayList<StudentRecordDTO> srList = new ArrayList<>();
		try {
			sql = "select * from student_record where srl_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			rs = psmt.executeQuery();
			while (rs.next()) {
				result = true;
				int srSeq = rs.getInt(1);
				int srlSeq = rs.getInt(2);
				int stdNum = rs.getInt(3);
				String stdName = rs.getString(4);
				String srDate = rs.getString(6);
				StudentRecordDTO dto = new StudentRecordDTO(srSeq, srlSeq, stdNum, stdName, srDate);
				srList.add(dto);
			}
			if (!result) {
				srList = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return srList;
	}

	// 학생기록 불러오기
	public ArrayList<StudentRecordDTO> getStudentRecord(int seq) {
		changeDatabase.getConn();
		result = false;
		ArrayList<StudentRecordDTO> srList = new ArrayList<>();
		try {
			sql = "select * from student_record where sr_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			rs = psmt.executeQuery();
			while (rs.next()) {
				result = true;
				int srSeq = rs.getInt(1);
				int srlSeq = rs.getInt(2);
				int stdNum = rs.getInt(3);
				String stdName = rs.getString(4);
				String srContent = rs.getString(5);
				String srDate = rs.getString(6);
				StudentRecordDTO dto = new StudentRecordDTO(srSeq, srlSeq, stdNum, stdName, srContent, srDate);
				srList.add(dto);
			}
			if (!result) {
				srList = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return srList;
	}

	// 학생기록 삭제
	public boolean deleteStudentRecord(StudentRecordDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "delete from student_record where sr_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getSrSeq());

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
}
