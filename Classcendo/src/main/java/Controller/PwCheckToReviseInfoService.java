package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserInfoDAO;
import Model.UserInfoDTO;

public class PwCheckToReviseInfoService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// 기존 저장된 회원정보 session 호출
		HttpSession session = request.getSession();
		UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");

		// pw 값 받아오기
		String pw = request.getParameter("pw");

		// memberDTO, memberDAO 호출
		UserInfoDTO dto = new UserInfoDTO(info.getUserNum(), pw);
		UserInfoDAO dao = new UserInfoDAO();

		String moveURL = null;

		// TODO 연결페이지 변경 필요
		if (dao.infoCheck(dto) == 1) {
			// 정보 확인 성공 시
			moveURL = "InfoRevise.jsp";
		} else {
			// 정보 확인 실패 시
			moveURL = "CodeTest_yl2.jsp";
		}
		response.sendRedirect(moveURL);
	}
}
