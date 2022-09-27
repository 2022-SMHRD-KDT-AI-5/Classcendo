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

public class SignUpService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// Parameter 호출
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		// UserInfoDTO, UserInfoDAO 호출
		UserInfoDTO dto = new UserInfoDTO(id, pw, name, email);
		UserInfoDAO dao = new UserInfoDAO();
		String moveURL = null;
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(dao.signUp(dto));
	}
}
