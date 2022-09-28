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

public class GetAnalysisResultService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		String srSeq = request.getParameter("srSeq"); 

		// AnalysisResultListDTO, AnalysisResultListDAO 호출
		AnalysisResultListDAO dao = new AnalysisResultListDAO();
		AnalysisResultListDTO dto = dao.getAnalysisResult(Integer.parseInt(srSeq));
		
		// Gson 객체 불러오기
		Gson gson = new Gson();
		
		// list를 json 형식으로 바꿔주기
		String json = gson.toJson(dto);
		
		PrintWriter out = response.getWriter();
		out.print(json);
	}
}
