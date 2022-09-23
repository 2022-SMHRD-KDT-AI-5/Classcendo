package Student.Model;

public class StudentRecordDTO {

	// 학생기록 관리 DTO
	private int srSeq;
	private int srlSeq;
	private int stdNum;
	private String stdName;
	private String srContent;
	private String srDate;

	// 생성자 메소드
	public StudentRecordDTO(int srSeq, int srlSeq, int stdNum, String stdName, String srContent, String srDate) {
		this.srSeq = srSeq;
		this.srlSeq = srlSeq;
		this.stdNum = stdNum;
		this.stdName = stdName;
		this.srContent = srContent;
		this.srDate = srDate;
	}
	
	// 생성자 메소드 - 모든 학생목록 불러오기
	public StudentRecordDTO(int srSeq, String stdName, String srDate) {
		this.srSeq = srSeq;
		this.stdName = stdName;
		this.srDate = srDate;
	}
	
	// 생성자 메소드 - 학생기록 불러오기
	public StudentRecordDTO(int srSeq, int stdNum, String stdName, String srContent, String srDate) {
		this.srSeq = srSeq;
		this.stdNum = stdNum;
		this.stdName = stdName;
		this.srContent = srContent;
		this.srDate = srDate;
	}

	public int getSrSeq() {
		return srSeq;
	}

	public void setSrSeq(int srSeq) {
		this.srSeq = srSeq;
	}

	public int getSrlSeq() {
		return srlSeq;
	}

	public void setSrlSeq(int srlSeq) {
		this.srlSeq = srlSeq;
	}

	public int getStdNum() {
		return stdNum;
	}

	public void setStdNum(int stdNum) {
		this.stdNum = stdNum;
	}

	public String getStdName() {
		return stdName;
	}

	public void setStdName(String stdName) {
		this.stdName = stdName;
	}

	public String getSrContent() {
		return srContent;
	}

	public void setSrContent(String srContent) {
		this.srContent = srContent;
	}

	public String getSrDate() {
		return srDate;
	}

	public void setSrDate(String srDate) {
		this.srDate = srDate;
	}

}
