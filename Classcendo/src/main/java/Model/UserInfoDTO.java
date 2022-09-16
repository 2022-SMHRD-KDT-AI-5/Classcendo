package Model;

public class UserInfoDTO {

	private String userNum;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userJoinDate;
	private String userType;

	public UserInfoDTO(String userNum, String userPw, String userName, String userEmail, String userJoinDate, String userType) {
		this.userNum = userNum;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userJoinDate = userJoinDate;
		this.userType = userType;
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
