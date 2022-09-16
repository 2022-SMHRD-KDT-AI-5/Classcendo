package Model;

import java.sql.*;
import java.util.ArrayList;

public class StudentRecordListDAO {

	// 학생기록부 목록 관리 클래스
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
	
	// 학생기록부 추가
	public boolean addSrl(StudentRecordListDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "insert into student_record_list(student_record_list_SEQ.nextval, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserNum());
			psmt.setString(2, dto.getSrlName());

			row = psmt.executeUpdate();
			if(row > 0) result = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return result;
	}
	
	// 학생기록부 삭제
	public boolean deleteSrl(StudentRecordListDTO dto) {
		changeDatabase.getConn();
		result = false;
		try {
			sql = "delete from student_record_list where srl_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getSrlSeq());

			row = psmt.executeUpdate();
			if(row > 0) result = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return result;
	}
	
	// 학생기록부 불러오기
	public ArrayList<StudentRecordListDTO> getStudentRecord(String num) {
		changeDatabase.getConn();
		result = false;
		ArrayList<StudentRecordListDTO> srlList = new ArrayList<>();
		try {
			sql = "select * from student_record where srl_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				result = true;
				int srlSeq = rs.getInt(1);
				String userNum = rs.getString(2);
				String srlName = rs.getString(3);
				StudentRecordListDTO dto = new StudentRecordListDTO(srlSeq, userNum, srlName);
				srlList.add(dto);
			}
			if(!result) {
				srlList = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return srlList;
	}
}
