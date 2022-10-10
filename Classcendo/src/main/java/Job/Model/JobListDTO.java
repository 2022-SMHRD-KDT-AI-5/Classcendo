package Job.Model;

public class JobListDTO {

	// 직업 목록 관리 DTO
	private int jobSeq;
	private String jobName;
	private String relationDept;
	private String relationCert;

	// 생성자 메소드
	public JobListDTO(int jobSeq, String jobName, String relationDept, String relationCert) {
		this.jobSeq = jobSeq;
		this.jobName = jobName;
		this.relationDept = relationDept;
		this.relationCert = relationCert;
	}

	public int getJobSeq() {
		return jobSeq;
	}

	public void setJobSeq(int jobSeq) {
		this.jobSeq = jobSeq;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getRelationDept() {
		return relationDept;
	}

	public void setRelationDept(String relationDept) {
		this.relationDept = relationDept;
	}

	public String getRelationCert() {
		return relationCert;
	}

	public void setRelationCert(String relationCert) {
		this.relationCert = relationCert;
	}

}
