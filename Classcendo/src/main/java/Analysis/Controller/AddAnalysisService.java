package Analysis.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Analysis.Model.AnalysisResultListDAO;
import Analysis.Model.AnalysisResultListDTO;

public class AddAnalysisService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		int srSeq = Integer.parseInt(request.getParameter("srSeq"));
		double rate1 = Double.parseDouble(request.getParameter("rate1")); 
		double rate2 = Double.parseDouble(request.getParameter("rate2")); 
		double rate3 = Double.parseDouble(request.getParameter("rate3")); 
		double rate4 = Double.parseDouble(request.getParameter("rate4")); 
		String[] jobList = request.getParameterValues("jobList");
		String jobs = String.join(",", jobList);
		System.out.println(jobs);
		
		AnalysisResultListDAO dao = new AnalysisResultListDAO();
		AnalysisResultListDTO dto = new AnalysisResultListDTO(srSeq, rate1, rate2, rate3, rate4, jobs);
		boolean result = dao.addAnalysisResult(dto);

		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
