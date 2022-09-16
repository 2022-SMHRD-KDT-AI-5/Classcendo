package Model;

public class StudentConsultingDTO {

	// 상담 기록 관리 DTO
	private int scSeq;
	private int srSeq;
	private String scContent;
	private String scDate;

	// 생성자 메소드
	public StudentConsultingDTO(int scSeq, int srSeq, String scContent, String scDate) {
		this.scSeq = scSeq;
		this.srSeq = srSeq;
		this.scContent = scContent;
		this.scDate = scDate;
	}

	public int getScSeq() {
		return scSeq;
	}

	public void setScSeq(int scSeq) {
		this.scSeq = scSeq;
	}

	public int getSrSeq() {
		return srSeq;
	}

	public void setSrSeq(int srSeq) {
		this.srSeq = srSeq;
	}

	public String getScContent() {
		return scContent;
	}

	public void setScContent(String scContent) {
		this.scContent = scContent;
	}

	public String getScDate() {
		return scDate;
	}

	public void setScDate(String scDate) {
		this.scDate = scDate;
	}

}
