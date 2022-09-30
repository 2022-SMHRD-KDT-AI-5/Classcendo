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

import Student.Model.StudentRecordListDAO;
import Student.Model.StudentRecordListDTO;
import UserInfo.Model.UserInfoDTO;

public class UpdateStudentRecordListService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 기존 저장된 회원정보 session 호출
		HttpSession session = request.getSession();
		UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");

		// StudentRecordListDTO, StudentRecordListDAO 호출
		StudentRecordListDAO dao = new StudentRecordListDAO();
		
		ArrayList<StudentRecordListDTO> srlList = dao.getAllStudentRecordList(info.getUserNum());
		session.setAttribute("srlList", srlList);
		
		// Gson 객체 불러오기
		Gson gson = new Gson();
		
		// list를 json 형식으로 바꿔주기
		String json = gson.toJson(srlList);
		
		PrintWriter out = response.getWriter();
		out.print(json);
	}
}