package Model;

public class UserInfoDTO {

	// 회원 정보 관리 DTO
	private String userNum;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userJoinDate;
	private String userType;

	// 생성자 메소드 - 회원정보 저장
	public UserInfoDTO(String userNum, String userPw, String userName, String userEmail, String userJoinDate,
			String userType) {
		this.userNum = userNum;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userJoinDate = userJoinDate;
		this.userType = userType;
	}

	// 생성자 메소드 - 로그인, 회원정보 확인
	public UserInfoDTO(String userNum, String userPw) {
		this.userNum = userNum;
		this.userPw = userPw;
	}

	// 생성자 메소드 - 비밀번호 찾기
	public UserInfoDTO(String userNum, String userName, String userEmail) {
		this.userNum = userNum;
		this.userName = userName;
		this.userEmail = userEmail;
	}

	// 생성자 메소드 - 회원가입, 회원정보 수정
	public UserInfoDTO(String userNum, String userPw, String userName, String userEmail) {
		this.userNum = userNum;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
	}

	public String getUserNum() {
		return userNum;
	}

	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserJoinDate() {
		return userJoinDate;
	}

	public void setUserJoinDate(String userJoinDate) {
		this.userJoinDate = userJoinDate;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}
