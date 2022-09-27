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

public class DeleteAnalysisResultService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// Parameter 호출
		int srSeq = Integer.parseInt(request.getParameter("srSeq")); 

		// AnalysisResultListDTO, AnalysisResultListDAO 호출
		AnalysisResultListDAO dao = new AnalysisResultListDAO();
		boolean result = dao.deleteAnalysisResultList(srSeq);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
