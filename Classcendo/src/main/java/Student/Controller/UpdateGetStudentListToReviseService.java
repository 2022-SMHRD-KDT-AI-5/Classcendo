package Student.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;

import Student.Model.StudentRecordDAO;
import Student.Model.StudentRecordDTO;

public class UpdateGetStudentListToReviseService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		int srlSeq = Integer.parseInt(request.getParameter("srlSeq")); 
		String result = request.getParameter("result");	
		
		// StudentRecordDTO, StudentRecordDAO 호출
		StudentRecordDAO srDao = new StudentRecordDAO();
		ArrayList<StudentRecordDTO> stdList = srDao.getAllStudentInfoList(srlSeq);

		HttpSession session = request.getSession();
		session.removeAttribute("stdList");
		session.setAttribute("stdList", stdList);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}