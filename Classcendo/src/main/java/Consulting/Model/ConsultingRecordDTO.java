package Consulting.Model;

public class ConsultingRecordDTO {

	// 상담 기록 관리 DTO
	private int crSeq;
	private int srSeq;
	private int arlSeq;
	private String crContent;
	private String crDate;

	// 생성자 메소드 - 상담기록 불러오기
	public ConsultingRecordDTO(int crSeq, int srSeq, int arlSeq, String crContent, String crDate) {
		this.crSeq = crSeq;
		this.srSeq = srSeq;
		this.arlSeq = arlSeq;
		this.crContent = crContent;
		this.crDate = crDate;
	}
	
	// 생성자 메소드 - 상담기록 추가하기
	public ConsultingRecordDTO(int srSeq, int arlSeq, String crContent) {
		this.srSeq = srSeq;
		this.arlSeq = arlSeq;
		this.crContent = crContent;
	}

	// 생성자 메소드 - 상담기록 수정하기
	public ConsultingRecordDTO(int arlSeq, String crContent) {
		this.arlSeq = arlSeq;
		this.crContent = crContent;
	}
	
	public int getCrSeq() {
		return crSeq;
	}

	public void setCrSeq(int crSeq) {
		this.crSeq = crSeq;
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

	public String getCrContent() {
		return crContent;
	}

	public void setCrContent(String crContent) {
		this.crContent = crContent;
	}

	public String getCrDate() {
		return crDate;
	}

	public void setCrDate(String crDate) {
		this.crDate = crDate;
	}

}
