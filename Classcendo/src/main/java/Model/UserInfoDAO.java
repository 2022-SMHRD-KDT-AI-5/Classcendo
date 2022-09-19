package Model;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpSession;

public class UserInfoDAO {

	// 회원정보를 데이터베이스에 연결하기 위한 DAO
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

	// 회원가입
	public boolean signUp(UserInfoDTO dto) {
		changeDatabase.getConn();

		try {
			sql = "insert into user_info values(?, ?, ?, ?, default, '1')";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getUserNum());
			psmt.setString(2, dto.getUserPw());
			psmt.setString(3, dto.getUserName());
			psmt.setString(4, dto.getUserEmail());

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

	// 로그인
	public UserInfoDTO signIn(UserInfoDTO dto) {
		changeDatabase.getConn();

		try {
			result = false;

			sql = "select * from user_info where user_num = ? and user_pw = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getUserNum());
			psmt.setString(2, dto.getUserPw());

			rs = psmt.executeQuery();

			while (rs.next()) {
				result = true;
				dto.setUserNum(rs.getString(1));
				dto.setUserPw(rs.getString(2));
				dto.setUserName(rs.getString(3));
				dto.setUserEmail(rs.getString(4));
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

	// 개인정보 확인
	public int infoCheck(UserInfoDTO dto) {
		changeDatabase.getConn();

		try {

			String origin_pw = "";
			row = 0;

			sql = "select user_pw from user_info where user_num = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getUserNum());

			rs = psmt.executeQuery();

			while (rs.next()) {
				origin_pw = rs.getString(1);
			}

			if (dto.getUserPw().equals(origin_pw)) {
				row = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return row;
	}

	// 개인정보 수정
	public int infoUpdate(UserInfoDTO dto) {
		changeDatabase.getConn();

		try {
			sql = "update user_info set user_pw = ?, user_name = ?, user_email = ? where user_num = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getUserPw());
			psmt.setString(2, dto.getUserName());
			psmt.setString(3, dto.getUserEmail());
			psmt.setString(4, dto.getUserNum());

			row = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return row;
	}

	// 비밀번호 분실 후 수정
	public int updatePw(String id_check, String pw) {
		changeDatabase.getConn();

		try {
			sql = "update user_info set user_pw = ? where user_num = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, pw);
			psmt.setString(2, id_check);

			row = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return row;
	}

	// 비밀번호 분실 시
	public boolean findPw(UserInfoDTO dto) {
		changeDatabase.getConn();

		try {

			result = false;

			sql = "select * from user_info where user_num = ? and user_email = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getUserNum());
			psmt.setString(2, dto.getUserEmail());

			rs = psmt.executeQuery();

			while (rs.next()) {
				result = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return result;
	}

	// 회원탈퇴
	public int infoResign(UserInfoDTO dto) {
		changeDatabase.getConn();

		try {

			String origin_pw = "";

			sql = "select user_pw from user_info where user_num = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getUserNum());

			rs = psmt.executeQuery();

			while (rs.next()) {
				origin_pw = rs.getString(1);
			}

			if (dto.getUserPw().equals(origin_pw)) {
				sql = "delete from user_info where user_num = ?";
				psmt = conn.prepareStatement(sql);

				psmt.setString(1, dto.getUserNum());

				row = psmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn();
		}
		return row;
	}
}
