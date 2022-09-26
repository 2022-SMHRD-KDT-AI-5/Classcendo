package Student.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.Model.StudentRecordDAO;
import Student.Model.StudentRecordDTO;

public class DeleteStudentRecordService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// Parameter 호출
		int srSeq = Integer.parseInt(request.getParameter("srSeq"));

		// StudentRecordDTO, StudentRecordDAO 호출
		StudentRecordDAO dao = new StudentRecordDAO();
		boolean result = false;

		if (dao.deleteStudentRecord(srSeq)) {
			// 학생 삭제 성공시
			result = true;
		} else {
			// 학생 삭제 실패시
			result = false;
		}

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);

	}
}
