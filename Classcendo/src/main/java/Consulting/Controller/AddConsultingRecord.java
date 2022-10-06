package Consulting.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Consulting.Model.ConsultingRecordDAO;
import Consulting.Model.ConsultingRecordDTO;

public class AddConsultingRecord extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		int srSeq = Integer.parseInt(request.getParameter("srSeq"));
		int arlSeq = Integer.parseInt(request.getParameter("arlSeq"));
		String consultRecord = request.getParameter("consultRecord");

		// ConsultingRecordDAO, ConsultingRecordDTO 호출
		ConsultingRecordDAO dao = new ConsultingRecordDAO();
		ConsultingRecordDTO dto = new ConsultingRecordDTO(srSeq, arlSeq, consultRecord);

		boolean result = dao.addConsultingRecord(dto);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}