package Student.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.Model.StudentRecordDAO;

public class AddStudentRecordService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// Parameter 호출
		int srlSeq = Integer.parseInt(request.getParameter("srlSeq"));
		int stdNum = Integer.parseInt(request.getParameter("stdNum"));
		String stdName = request.getParameter("stdName");
		
		// StudentRecordDAO 호출
		StudentRecordDAO dao = new StudentRecordDAO();
		boolean result = dao.addStudent(srlSeq,stdNum,stdName);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);

	}
}
