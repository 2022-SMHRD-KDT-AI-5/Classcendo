package Student.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.Model.StudentRecordDAO;
import Student.Model.StudentRecordListDAO;

public class DeleteStudentRecordListService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		// Parameter 호출
		int srlSeq = Integer.parseInt(request.getParameter("srlSeq"));

		// StudentRecordDTO, StudentRecordDAO 호출
		StudentRecordListDAO dao = new StudentRecordListDAO();
		
		dao.deleteStudentRecordList(srlSeq);
		
		response.sendRedirect("UpdateStudentRecordListService");
	}

}