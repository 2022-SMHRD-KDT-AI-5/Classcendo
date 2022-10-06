package Consulting.Model;

public class ConsultingRecordDTO {

	// 상담 기록 관리 DTO
	private int scSeq;
	private int srSeq;
	private int arlSeq;
	private String scContent;
	private String scDate;

	// 생성자 메소드 - 상담기록 불러오기
	public ConsultingRecordDTO(int scSeq, int srSeq, int arlSeq, String scContent, String scDate) {
		this.scSeq = scSeq;
		this.srSeq = srSeq;
		this.arlSeq = arlSeq;
		this.scContent = scContent;
		this.scDate = scDate;
	}
	
	// 생성자 메소드 - 상담기록 추가하기
	public ConsultingRecordDTO(int srSeq, int arlSeq, String scContent) {
		this.srSeq = srSeq;
		this.arlSeq = arlSeq;
		this.scContent = scContent;
	}

	// 생성자 메소드 - 상담기록 수정하기
	public ConsultingRecordDTO(int arlSeq, String scContent) {
		this.arlSeq = arlSeq;
		this.scContent = scContent;
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
	
	public int getArlSeq() {
		return arlSeq;
	}

	public void setArlSeq(int arlSeq) {
		this.arlSeq = arlSeq;
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
