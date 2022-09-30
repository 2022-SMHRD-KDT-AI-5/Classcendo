package Student.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Student.Model.StudentRecordDAO;
import Student.Model.StudentRecordDTO;

public class GetStudentListToReviseService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		String srlSeq = request.getParameter("srlSeq"); 
		
		// StudentRecordDTO, StudentRecordDAO 호출
		StudentRecordDAO srDao = new StudentRecordDAO();
		ArrayList<StudentRecordDTO> stdList = srDao.getAllStudentInfoList(Integer.parseInt(srlSeq));
		
		HttpSession session = request.getSession();
		session.setAttribute("stdList", stdList);
		
		response.sendRedirect("Student/ReviseStudent.jsp");
	}
}