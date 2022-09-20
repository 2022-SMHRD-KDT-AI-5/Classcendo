package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserInfoDAO;
import Model.UserInfoDTO;

public class SignUpService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// id, pw, name, email 값 받아오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		// memberDTO, memberDAO 호출
		UserInfoDTO dto = new UserInfoDTO(id, pw, name, email);
		UserInfoDAO dao = new UserInfoDAO();
		String moveURL = null;
		
		
		System.out.println();
		System.out.println(dao.signUp(dto));

		// TODO 연결 페이지 변경 필요
		if (dao.signUp(dto)) {
			// 회원가입 성공 시
			moveURL = "CodeTest_yl.jsp";
		} else {
			// 회원가입 실패 시
			moveURL = "CodeTest_yl.jsp";
		}
		response.sendRedirect(moveURL);
	}
}
