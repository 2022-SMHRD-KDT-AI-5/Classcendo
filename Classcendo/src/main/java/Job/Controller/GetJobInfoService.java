package Job.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Job.Model.JobListDAO;
import Job.Model.JobListDTO;

public class GetJobInfoService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		String jobName = request.getParameter("jobName");
		// AnalysisResultListDTO, AnalysisResultListDAO 호출
		JobListDAO dao = new JobListDAO();
		JobListDTO dto = dao.getJobInfo(jobName);
		
		// Gson 객체 불러오기
		Gson gson = new Gson();
		
		// list를 json 형식으로 바꿔주기
		String json = gson.toJson(dto);
		
		PrintWriter out = response.getWriter();
		out.print(json);
	}
}
