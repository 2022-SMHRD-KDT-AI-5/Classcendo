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

public class FindPwService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// id, name, email 값 받아오기
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		// UserInfoDTO, UserInfoDAO 호출
		UserInfoDTO dto = new UserInfoDTO(id, name, email);
		UserInfoDAO dao = new UserInfoDAO();
		String idCheck = null;
		
		if (dao.findPw(dto)) {
			// 비밀번호 찾기 성공 시
			idCheck = id;
			HttpSession session = request.getSession();
			session.setAttribute("idCheck", idCheck);
		} else {
			// 비밀번호 찾기 실패 시
			idCheck = null;
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(idCheck);
	}
}
