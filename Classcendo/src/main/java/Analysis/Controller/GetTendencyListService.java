package Analysis.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Analysis.Model.TendencyListDAO;
import Analysis.Model.TendencyListDTO;
import Student.Model.StudentRecordDAO;
import Student.Model.StudentRecordDTO;

public class GetTendencyListService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// Parameter 호출
		HttpSession session = request.getSession();
		int tendencySeq = Integer.parseInt(request.getParameter("tendencySeq"));

		// TendencyListDTO, TendencyListDAO 호출
		TendencyListDAO dao = new TendencyListDAO();
		ArrayList<TendencyListDTO> tendencyList = dao.getTendencyList(tendencySeq);

		// Gson 객체 불러오기
		Gson gson = new Gson();

		// list를 json 형식으로 바꿔주기
		String json = gson.toJson(tendencyList);

		PrintWriter out = response.getWriter();
		out.print(json);

	}

}
