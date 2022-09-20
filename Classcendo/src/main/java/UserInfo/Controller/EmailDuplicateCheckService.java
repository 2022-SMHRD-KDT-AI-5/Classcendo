package UserInfo.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import UserInfo.Model.UserInfoDAO;

public class EmailDuplicateCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩 작업
		request.setCharacterEncoding("UTF-8");
		
		// newEmail 값 받아오기
		String emailCheck = request.getParameter("email");
		
		// UserInfoDAO 호출 작업
		UserInfoDAO dao = new UserInfoDAO();
		String moveURL = null;
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(dao.checkEmail(emailCheck));

	}

}
