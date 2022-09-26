package Analysis.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Analysis.Model.AnalysisResultListDAO;
import Analysis.Model.AnalysisResultListDTO;

public class AddAnalysisResult extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// 기존 저장된 session 호출
		int srSeq = Integer.parseInt(request.getParameter("srSeq"));
		int tendency1Rate = Integer.parseInt(request.getParameter("tendency1Rate"));
		int tendency2Rate = Integer.parseInt(request.getParameter("tendency2Rate"));
		int tendency3Rate = Integer.parseInt(request.getParameter("tendency3Rate"));
		int tendency4Rate = Integer.parseInt(request.getParameter("tendency4Rate"));
		String graphPath = request.getParameter("graphPath");
		String jobsSeq = request.getParameter("jobsSeq");
		
		// AnalysisResultListDTO, AnalysisResultListDAO 호출
		AnalysisResultListDTO dto = new AnalysisResultListDTO(srSeq, tendency1Rate, tendency2Rate, tendency3Rate, tendency4Rate, graphPath, jobsSeq);
		AnalysisResultListDAO dao = new AnalysisResultListDAO();
		
		dao.addAnalysisResult(dto);
	}
}
