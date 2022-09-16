package Model;

public class JobTendencyDTO {

	private int jobSeq;
	private String tendencyName;

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
