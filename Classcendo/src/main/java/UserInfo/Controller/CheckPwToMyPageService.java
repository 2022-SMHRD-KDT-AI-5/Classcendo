package UserInfo.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import UserInfo.Model.UserInfoDAO;
import UserInfo.Model.UserInfoDTO;

public class CheckPwToMyPageService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// 기존 저장된 회원정보 session 호출
		HttpSession session = request.getSession();
		UserInfoDTO info = (UserInfoDTO) session.getAttribute("info");

		// Parameter 호출
		String pw = request.getParameter("pw");

		// UserInfoDTO, UserInfoDAO 호출
		UserInfoDTO dto = new UserInfoDTO(info.getUserNum(), pw);
		UserInfoDAO dao = new UserInfoDAO();
		boolean result = false;
		System.out.println(pw);

		if (dao.infoCheck(dto) == 1) {
			// 정보 확인 성공 시
			result = true;
			
		} else {
			// 정보 확인 실패 시
			result = false;
		}
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
