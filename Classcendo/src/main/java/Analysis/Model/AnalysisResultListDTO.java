package Analysis.Model;

public class AnalysisResultListDTO {

	// 분석 결과 관리 DTO
	private int arlSeq;
	private int srSeq;
	private int tendency1Rate;
	private int tendency2Rate;
	private int tendency3Rate;
	private int tendency4Rate;
	private String arlGraphPath;
	private String jobsSeq;

	// 생성자 메소드 - 분석 결과 출력
	public AnalysisResultListDTO(int arlSeq, int srSeq, int tendency1Rate, int tendency2Rate, int tendency3Rate,
			int tendency4Rate, String arlGraphPath, String jobsSeq) {
		this.arlSeq = arlSeq;
		this.srSeq = srSeq;
		this.tendency1Rate = tendency1Rate;
		this.tendency2Rate = tendency2Rate;
		this.tendency3Rate = tendency3Rate;
		this.tendency4Rate = tendency4Rate;
		this.arlGraphPath = arlGraphPath;
		this.jobsSeq = jobsSeq;
	}
	
	// 생성자 메소드 - 분석 결과 추가
	public AnalysisResultListDTO(int srSeq, int tendency1Rate, int tendency2Rate, int tendency3Rate,
			int tendency4Rate, String arlGraphPath, String jobsSeq) {
		this.srSeq = srSeq;
		this.tendency1Rate = tendency1Rate;
		this.tendency2Rate = tendency2Rate;
		this.tendency3Rate = tendency3Rate;
		this.tendency4Rate = tendency4Rate;
		this.arlGraphPath = arlGraphPath;
		this.jobsSeq = jobsSeq;
	}

	public int getArlSeq() {
		return arlSeq;
	}

	public void setArlSeq(int arlSeq) {
		this.arlSeq = arlSeq;
	}

	public int getSrSeq() {
		return srSeq;
	}

	public void setSrSeq(int srSeq) {
		this.srSeq = srSeq;
	}

	public int getTendency1Rate() {
		return tendency1Rate;
	}

	public void setTendency1Rate(int tendency1Rate) {
		this.tendency1Rate = tendency1Rate;
	}

	public int getTendency2Rate() {
		return tendency2Rate;
	}

	public void setTendency2Rate(int tendency2Rate) {
		this.tendency2Rate = tendency2Rate;
	}

	public int getTendency3Rate() {
		return tendency3Rate;
	}

	public void setTendency3Rate(int tendency3Rate) {
		this.tendency3Rate = tendency3Rate;
	}

	public int getTendency4Rate() {
		return tendency4Rate;
	}

	public void setTendency4Rate(int tendency4Rate) {
		this.tendency4Rate = tendency4Rate;
	}

	public String getArlGraphPath() {
		return arlGraphPath;
	}

	public void setArlGraphPath(String arlGraphPath) {
		this.arlGraphPath = arlGraphPath;
	}

	public String getJobsSeq() {
		return jobsSeq;
	}

	public void setJobsSeq(String jobsSeq) {
		this.jobsSeq = jobsSeq;
	}
}
