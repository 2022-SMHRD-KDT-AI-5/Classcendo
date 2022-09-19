package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserInfoDAO;
import Model.UserInfoDTO;

public class SignInService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");

		// id, pw 값 받아오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		// memberDTO, memberDAO 호출
		UserInfoDTO dto = new UserInfoDTO(id, pw);
		UserInfoDAO dao = new UserInfoDAO();

		UserInfoDTO info = dao.login(dto);

		String moveURL = null;

		if (info != null) {
			// 로그인 성공 시
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
			moveURL = "Main.jsp";
		} else {
			// 로그인 실패 시
			moveURL = "CodeTest_yl.jsp";
		}
		response.sendRedirect(moveURL);

	}

}
