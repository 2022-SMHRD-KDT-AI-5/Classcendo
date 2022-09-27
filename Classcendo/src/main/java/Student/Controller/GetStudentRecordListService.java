package Student.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Student.Model.StudentRecordListDAO;
import Student.Model.StudentRecordListDTO;
import UserInfo.Model.UserInfoDTO;

public class GetStudentRecordListService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// 기존 저장된 회원정보 session 호출
		HttpSession session = request.getSession();
		UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");

		// StudentRecordListDTO, StudentRecordListDAO 호출
		StudentRecordListDAO dao = new StudentRecordListDAO();
		ArrayList<StudentRecordListDTO> srlList = dao.getAllStudentRecord(info.getUserNum());

		session.setAttribute("srlList", srlList);
		
		response.sendRedirect("Student/Main.jsp");
	}
}
