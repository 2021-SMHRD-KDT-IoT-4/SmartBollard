package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.StopDAO;

@WebServlet("/StopDelete")
public class StopDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int capno = Integer.parseInt(request.getParameter("capno"));
		
		StopDAO dao = new StopDAO();
		int cnt = dao.stopDel(capno);
		if(cnt > 0) {
			System.out.println("정지선 위반 삭제 완료!");
		} else {
			System.out.println("정지선 위반 삭제 완료!");
		}
		response.sendRedirect("SmartBolad.jsp#stopline");
		
	}

}
