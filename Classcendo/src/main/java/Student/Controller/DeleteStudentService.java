package Student.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.Model.StudentRecordDAO;

public class DeleteStudentService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		int srSeq = Integer.parseInt(request.getParameter("srSeq"));
		String srlSeq = request.getParameter("srlSeq");

		// StudentRecordDTO, StudentRecordDAO 호출
		StudentRecordDAO dao = new StudentRecordDAO();
		
		System.out.println("asdf"+srlSeq);
		boolean result = dao.deleteStudentRecord(srSeq);
		response.sendRedirect("UpdateGetStudentListToReviseService?result=" + result + "&srlSeq=" + srlSeq);
	}
}