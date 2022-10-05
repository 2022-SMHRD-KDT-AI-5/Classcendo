package Analysis.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class AnalysisService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		float rate1 = Integer.parseInt(request.getParameter("rate1")); 
		float rate2 = Integer.parseInt(request.getParameter("rate2")); 
		float rate3 = Integer.parseInt(request.getParameter("rate3")); 
		float rate4 = Integer.parseInt(request.getParameter("rate4"));
		String jobList = request.getParameter("jobList");
		
		// Gson 객체 불러오기
		Gson gson = new Gson();
		
		// list를 json 형식으로 바꿔주기
		String json = gson.toJson(jobList);
		
		PrintWriter out = response.getWriter();
		out.print(json);
	}
}
