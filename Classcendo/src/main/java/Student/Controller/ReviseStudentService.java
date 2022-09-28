package Student.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Student.Model.StudentRecordDAO;

public class ReviseStudentService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// Parameter 호출
		int srlSeq = Integer.parseInt(request.getParameter("srlSeq"));
		String stdNums = request.getParameter("stdNums");
		String stdNames = request.getParameter("stdNames");
		System.out.println(stdNums);
		
		boolean result = false;
		
		// StudentRecordDAO 호출
		StudentRecordDAO dao = new StudentRecordDAO();
//		for(int i = 0; i < stdNums.length; i++) {
//			if(stdNums[i] == null || stdNames[i] == null) {
//				continue;
//			}
//			int stdNum = Integer.parseInt(stdNums[i]);
//			result = dao.addStudent(srlSeq, stdNum, stdNames[i]);
//			if(result != false) {
//				System.out.println("저장 오류" + stdNames[i]);
//			}
//		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);

	}
}
