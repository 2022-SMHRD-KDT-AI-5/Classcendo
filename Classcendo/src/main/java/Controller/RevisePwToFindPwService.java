package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserInfoDAO;

public class RevisePwToFindPwService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// idCheck 값 받아오기
		HttpSession session = request.getSession();
		String idCheck = (String) session.getAttribute("idCheck");
		
		// 수정할 pw 값 받아오기
		String pw = request.getParameter("pw");

		// memberDTO, memberDAO 호출
		UserInfoDAO dao = new UserInfoDAO();

		boolean result = false;

		if (dao.updatePw(idCheck, pw) > 0) {
			// 비밀번호 수정 성공 시
			session.removeAttribute("id_check");
			result = true;
		} else {
			// 비밀번호 수정 실패 시
			result = false;
		}
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
