package Analysis.Model;

public class AnalysisResultListDTO {

	// 분석 결과 관리 DTO
	private int arlSeq;
	private int srSeq;
	private double tendency1Rate;
	private double tendency2Rate;
	private double tendency3Rate;
	private double tendency4Rate;
	private String arlDate;
	private String jobsName;

	// 생성자 메소드 - 분석 결과 모두 불러오기
	public AnalysisResultListDTO(int arlSeq, int srSeq, double tendency1Rate, double tendency2Rate, double tendency3Rate,
			double tendency4Rate, String arlDate, String jobsName) {
		this.arlSeq = arlSeq;
		this.srSeq = srSeq;
		this.tendency1Rate = tendency1Rate;
		this.tendency2Rate = tendency2Rate;
		this.tendency3Rate = tendency3Rate;
		this.tendency4Rate = tendency4Rate;
		this.arlDate = arlDate;
		this.jobsName = jobsName;
	}
	
	// 생성자 메소드 - 분석 결과 추가
	public AnalysisResultListDTO(int srSeq, double tendency1Rate, double tendency2Rate, double tendency3Rate,
			double tendency4Rate, String jobsName) {
		this.srSeq = srSeq;
		this.tendency1Rate = tendency1Rate;
		this.tendency2Rate = tendency2Rate;
		this.tendency3Rate = tendency3Rate;
		this.tendency4Rate = tendency4Rate;
		this.jobsName = jobsName;
	}
	
	// 생성자 메소드 - 분석 결과 불러오기
	public AnalysisResultListDTO(double tendency1Rate, double tendency2Rate, double tendency3Rate, double tendency4Rate, String jobsName) {
		this.tendency1Rate = tendency1Rate;
		this.tendency2Rate = tendency2Rate;
		this.tendency3Rate = tendency3Rate;
		this.tendency4Rate = tendency4Rate;
		this.jobsName = jobsName;
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

	public double getTendency1Rate() {
		return tendency1Rate;
	}

	public void setTendency1Rate(double tendency1Rate) {
		this.tendency1Rate = tendency1Rate;
	}

	public double getTendency2Rate() {
		return tendency2Rate;
	}

	public void setTendency2Rate(double tendency2Rate) {
		this.tendency2Rate = tendency2Rate;
	}

	public double getTendency3Rate() {
		return tendency3Rate;
	}

	public void setTendency3Rate(double tendency3Rate) {
		this.tendency3Rate = tendency3Rate;
	}

	public double getTendency4Rate() {
		return tendency4Rate;
	}

	public void setTendency4Rate(double tendency4Rate) {
		this.tendency4Rate = tendency4Rate;
	}

	public String getArlDate() {
		return arlDate;
	}

	public void setArlDate(String arlDate) {
		this.arlDate = arlDate;
	}

	public String getJobsName() {
		return jobsName;
	}

	public void setJobsName(String jobsName) {
		this.jobsName = jobsName;
	}
}
