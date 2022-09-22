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

public class GetStudentRecordList extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// 기존 저장된 회원정보 session 호출
		HttpSession session = request.getSession();
		UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");
		String option = "";

		// StudentRecordListDTO, StudentRecordListDAO 호출
		StudentRecordListDAO dao = new StudentRecordListDAO();
		ArrayList<StudentRecordListDTO> srlList = dao.getAllStudentRecord(info.getUserNum());

		if (srlList != null) {
			// 학생기록부 목록 출력 성공 시
			for (int i = 0; i < srlList.size(); i++) {
				option += "<option value='" + srlList.get(i).getSrlSeq() + "'> " + srlList.get(i).getSrlName() + "</option>";
			}
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(option);
	}
}
