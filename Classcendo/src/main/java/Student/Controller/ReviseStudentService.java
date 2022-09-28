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
		String[] stdNums = request.getParameterValues("stdNums");
		String[] stdNames = request.getParameterValues("stdNames");
		
		String[] nums = null;
		String[] names = null;
		
		for(String stdNum : stdNums) {
			nums = stdNum.replace("stdNum=", "").split("&");
		}
		
		for(String stdName : stdNames) {
			names = stdName.replace("stdName=", "").split("&");
		}
		
		boolean result = false;
		
		for(String name : names) {
			System.out.println(name);
		}
		
		// StudentRecordDAO 호출
		StudentRecordDAO dao = new StudentRecordDAO();
		result = dao.addStudent(srlSeq, nums, names);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
