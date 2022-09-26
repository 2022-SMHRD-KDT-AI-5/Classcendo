package Analysis.Model;

public class TendencyListDTO {

	// 성향 목록 관리 DTO
	private int tendencySeq;
	private String tendencyName;

	// 생성자 메소드
	public TendencyListDTO(int tendencySeq, String tendencyName) {
		this.tendencySeq = tendencySeq;
		this.tendencyName = tendencyName;
	}

	public int getTendencySeq() {
		return tendencySeq;
	}

	public void setTendencySeq(int tendencySeq) {
		this.tendencySeq = tendencySeq;
	}

	public String getTendencyName() {
		return tendencyName;
	}

	public void setTendencyName(String tendencyName) {
		this.tendencyName = tendencyName;
	}
}
