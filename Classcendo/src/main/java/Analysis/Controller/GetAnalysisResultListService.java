package Analysis.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Analysis.Model.AnalysisResultListDAO;
import Analysis.Model.AnalysisResultListDTO;
import Student.Model.StudentRecordDAO;
import Student.Model.StudentRecordDTO;

public class GetAnalysisResultListService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		int srSeq = Integer.parseInt(request.getParameter("srSeq")); 

		// AnalysisResultListDTO, AnalysisResultListDAO 호출
		AnalysisResultListDAO dao = new AnalysisResultListDAO();
		ArrayList<AnalysisResultListDTO> arlList = dao.getAnalysisResultList(srSeq);
		
		HttpSession session = request.getSession();
		session.setAttribute("arlList", arlList);
		
		response.sendRedirect("Analysis/Analysis.jsp?srSeq=" + srSeq);
	}
}
