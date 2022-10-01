package Student.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Student.Model.StudentRecordDAO;
import Student.Model.StudentRecordDTO;

public class RevisePersonalStudentService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		// Parameter 호출
		int srSeq = Integer.parseInt(request.getParameter("srSeq"));
		int stdNum = Integer.parseInt(request.getParameter("stdNum"));
		String stdName = request.getParameter("stdName");
		
		// StudentRecordDTO, StudentRecordDAO 호출
		StudentRecordDAO dao = new StudentRecordDAO();
		StudentRecordDTO dto = new StudentRecordDTO(srSeq, stdNum, stdName);
		boolean result = dao.updateStudentInfo(dto);
		
		response.sendRedirect("UpdateGetStudentListToReviseService?result=" + result + "&srlSeq=-1");
	}
}
