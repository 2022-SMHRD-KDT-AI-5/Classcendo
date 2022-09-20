package Job.Model;

public class JobTendencyDTO {

	// 직업 관련 성향 관리 DTO
	private int jobSeq;
	private String tendencyName;

	// 생성자 메소드
	public JobTendencyDTO(int jobSeq, String tendencyName) {
		this.jobSeq = jobSeq;
		this.tendencyName = tendencyName;
	}

	public int getJobSeq() {
		return jobSeq;
	}

	public void setJobSeq(int jobSeq) {
		this.jobSeq = jobSeq;
	}

	public String getTendencyName() {
		return tendencyName;
	}

	public void setTendencyName(String tendencyName) {
		this.tendencyName = tendencyName;
	}

}
