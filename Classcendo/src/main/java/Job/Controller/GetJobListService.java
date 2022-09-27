package Job.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Analysis.Model.AnalysisResultListDAO;
import Analysis.Model.AnalysisResultListDTO;
import Job.Model.JobListDAO;
import Job.Model.JobListDTO;

public class GetJobListService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// Parameter 호출
		String srSeq = request.getParameter("jobsSeq");

		// AnalysisResultListDTO, AnalysisResultListDAO 호출
		JobListDAO dao = new JobListDAO();
		ArrayList<JobListDTO> dto = dao.getJobList(srSeq);
		
		// Gson 객체 불러오기
		Gson gson = new Gson();
		
		// list를 json 형식으로 바꿔주기
		String json = gson.toJson(dto);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
	}
}
