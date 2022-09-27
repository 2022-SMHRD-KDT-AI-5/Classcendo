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
import Job.Model.JobTendencyDAO;

public class GetJobRelatedTendencyService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// Parameter 호출
		String tendencys = request.getParameter("tendencys");

		// JobTendencyDTO, JobTendencyDAO 호출
		JobTendencyDAO dao = new JobTendencyDAO();
		ArrayList<Integer> jobList = dao.getJobTendency(tendencys);


		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jobList);

	}
}
