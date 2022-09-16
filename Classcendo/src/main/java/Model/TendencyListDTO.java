package Model;

public class TendencyListDTO {

	private int tendencySeq;
	private String tendencyName;

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
