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
		String[] data = request.getParameterValues("data");
		int rate1 = Integer.parseInt(data[0]);
		int rate2 = Integer.parseInt(data[1]);
		int rate3 = Integer.parseInt(data[2]);
		int rate4 = Integer.parseInt(data[3]);
		String jobs = data[4];
		System.out.println(jobs);
		
		AnalysisResultListDAO dao = new AnalysisResultListDAO();
		AnalysisResultListDTO dto = new AnalysisResultListDTO(srSeq, rate1, rate2, rate3, rate4, jobs);
		boolean result = dao.addAnalysisResult(dto);

		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
