package Student.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Student.Model.StudentRecordDAO;
import Student.Model.StudentRecordDTO;
import UserInfo.Model.UserInfoDTO;

public class GetStudentList extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// 기존 저장된 회원정보 session 호출
		HttpSession session = request.getSession();
		String srlSeq = request.getParameter("srlSeq"); 
		String text = "<li class='list'>" + srlSeq + "</li>";
		
		
		// StudentRecordDTO, StudentRecordDAO 호출
		StudentRecordDAO dao = new StudentRecordDAO();
		ArrayList<StudentRecordDTO> srList = dao.getAllStudentRecord(Integer.parseInt(srlSeq));
		
		if (srList != null) {
			// 학생 목록 출력 성공 시
			for (int i = 0; i < srList.size(); i++) {
				text += "<li class='list' style='background=\"red\"'>"+ srList.get(i).getStdNum() + "번 " + srList.get(i).getStdName();
				text += srList.get(i).getSrDate();
				if(srList.get(i).getSrContent() == null) {
					text += "<input type='button' id='result' value='결과' onclick='analysisResult("
							+ srList.get(i).getSrSeq() + ")'>";
				} 
			}
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(text);

	}

}
