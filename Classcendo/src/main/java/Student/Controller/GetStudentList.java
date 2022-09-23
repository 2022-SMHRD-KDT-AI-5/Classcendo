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

import Analysis.Model.AnalysisResultListDAO;
import Analysis.Model.AnalysisResultListDTO;
import Student.Model.StudentRecordDAO;
import Student.Model.StudentRecordDTO;
import UserInfo.Model.UserInfoDTO;

public class GetStudentList extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// 기존 저장된 학생기록부 목록 번호 session 호출
		HttpSession session = request.getSession();
		String srlSeq = request.getParameter("srlSeq"); 
		
		// StudentRecordDTO, StudentRecordDAO 호출
		StudentRecordDAO srDao = new StudentRecordDAO();
		ArrayList<StudentRecordDTO> srList = srDao.getAllStudentList(Integer.parseInt(srlSeq));
		
		// AnalysisResultListDAO, AnalysisResultListDTO 호출
		AnalysisResultListDAO arlDao = new AnalysisResultListDAO();
		
		// Gson 객체 불러오기
		Gson gson = new Gson();
		
		// list를 json 형식으로 바꿔주기
		String json = gson.toJson(srList);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		
		/*
		if (srList != null) {
			// 학생 목록 출력 성공 시
			for (int i = 0; i < srList.size(); i++) {
				text += "<li class='list' style='background=\"red\"' onclick='getAnalysisResult()'>"
					 + srList.get(i).getStdNum() + "번 " + srList.get(i).getStdName()
					 + srList.get(i).getSrDate();
				if(arlDao.getAnalysisResult(srList.get(i).getSrSeq()) != null) {
					text += "<input type='button' id='result' value='결과' onclick='analysisResult("
							+ srList.get(i).getSrSeq() + ")'>";
				}
			}
		}*/
	}
}
