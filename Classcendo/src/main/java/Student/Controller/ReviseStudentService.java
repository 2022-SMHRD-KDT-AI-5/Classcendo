package Student.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.Model.StudentRecordDAO;

public class ReviseStudentService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		int srlSeq = Integer.parseInt(request.getParameter("srlSeq"));
		String stdNums = request.getParameter("stdNums");
		String stdNames = request.getParameter("stdNames");
		
		String[] nums = null;
		String[] names = null;
		
		nums = stdNums.split(",");
		names = stdNames.split(",");
		
		boolean result = false;
		
		// StudentRecordDAO 호출
		StudentRecordDAO dao = new StudentRecordDAO();
		result = dao.addStudent(srlSeq, nums, names);
		
		response.sendRedirect("UpdateGetStudentListToReviseService?result=" + result + "&srlSeq=" + srlSeq);
	}
}
