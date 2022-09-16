package Model;

public class StudentRecordListDTO {

	private int srlSeq;
	private String userNum;
	private String srlName;

	public StudentRecordListDTO(int srlSeq, String userNum, String srlName) {
		this.srlSeq = srlSeq;
		this.userNum = userNum;
		this.srlName = srlName;
	}

	public int getSrlSeq() {
		return srlSeq;
	}

	public void setSrlSeq(int srlSeq) {
		this.srlSeq = srlSeq;
	}

	public String getUserNum() {
		return userNum;
	}

	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}

	public String getSrlName() {
		return srlName;
	}

	public void setSrlName(String srlName) {
		this.srlName = srlName;
	}

}
