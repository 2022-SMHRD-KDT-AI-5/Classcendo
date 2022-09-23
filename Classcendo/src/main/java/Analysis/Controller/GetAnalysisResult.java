package Analysis.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Analysis.Model.AnalysisResultListDAO;
import Analysis.Model.AnalysisResultListDTO;
import Student.Model.StudentRecordDAO;
import Student.Model.StudentRecordDTO;

public class GetAnalysisResult extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// 기존 저장된 학생번호 session 호출
		HttpSession session = request.getSession();
		String srSeq = request.getParameter("srSeq"); 
		
		// StudentRecordDTO, StudentRecordDAO 호출
		AnalysisResultListDAO dao = new AnalysisResultListDAO();
		AnalysisResultListDTO dto = dao.getAnalysisResult(Integer.parseInt(srSeq));
		String text = "";
		
		if (dto != null) {
			// 분석 결과 출력 성공 시
			// TODO 출력한 HTML문 입력 필요
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(text);
	}
}
