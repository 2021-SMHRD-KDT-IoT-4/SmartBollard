package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.BoladDAO;

@WebServlet("/BoladDelete")
public class BoladDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 볼라드 삭제 기능
		
		int bolno = Integer.parseInt(request.getParameter("bolno"));
		
		 BoladDAO dao = new BoladDAO();
		 int cnt = dao.boladDel(bolno);
		 if(cnt > 0) {
			 System.out.println("볼라드 삭제 완료!");
		 } else {
			 System.out.println("볼라드 삭제 실패!");
		 }
		
		 response.sendRedirect("SmartBolad.jsp#bolad");
	}

}
