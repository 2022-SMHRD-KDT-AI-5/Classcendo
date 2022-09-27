package Student.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Student.Model.StudentRecordDAO;
import Student.Model.StudentRecordDTO;

public class UpdateStudentRecordService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// Parameter 호출
		int srSeq = Integer.parseInt(request.getParameter("srSeq"));
		String srContent = request.getParameter("srContent");

		// StudentRecordDTO, StudentRecordDAO 호출
		StudentRecordDTO dto = new StudentRecordDTO(srSeq, srContent);
		StudentRecordDAO dao = new StudentRecordDAO();
		boolean result = dao.updateStudentRecord(dto);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
