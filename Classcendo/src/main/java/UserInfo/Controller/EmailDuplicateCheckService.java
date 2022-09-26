package UserInfo.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import UserInfo.Model.UserInfoDAO;

public class EmailDuplicateCheckService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		String emailCheck = request.getParameter("email");
		
		// UserInfoDAO 호출
		UserInfoDAO dao = new UserInfoDAO();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(dao.checkEmail(emailCheck));
	}
}
