package UserInfo.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import UserInfo.Model.UserInfoDAO;
import UserInfo.Model.UserInfoDTO;

public class ReviseInfoService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 세션에 저장된 회원정보 받아오기
		HttpSession session = request.getSession();
		UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");

		// Parameter 호출
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		// UserInfoDTO, UserInfoDAO 호출
		UserInfoDTO dto = new UserInfoDTO(info.getUserNum(), pw, name, email);
		UserInfoDAO dao = new UserInfoDAO();

		

		if (dao.infoUpdate(dto) > 0) {
			// 정보 수정 성공 시
			session.setAttribute("info", dto);
			
		} else {
			// 정보 수정 실패 시
			
		}
		
		
		
		
	}

}
