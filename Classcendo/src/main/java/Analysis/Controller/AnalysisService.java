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

public class AnalysisService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		int srSeq = Integer.parseInt(request.getParameter("srSeq"));
		int rate1 = Integer.parseInt(request.getParameter("rate1")); 
		int rate2 = Integer.parseInt(request.getParameter("rate2")); 
		int rate3 = Integer.parseInt(request.getParameter("rate3")); 
		int rate4 = Integer.parseInt(request.getParameter("rate4"));
		String jobList = request.getParameter("jobList");
		
		AnalysisResultListDAO dao = new AnalysisResultListDAO();
		AnalysisResultListDTO dto = new AnalysisResultListDTO(srSeq, rate1, rate2, rate3, rate4, jobList);
		boolean result = dao.addAnalysisResult(dto);

		if(result) {
			response.sendRedirect("GetAnalysisResultListService?srSeq=" + srSeq);
		}else {
			PrintWriter out = response.getWriter();
			out.print(result);
		}
	}
}
