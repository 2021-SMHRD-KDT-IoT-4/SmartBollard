package com.Controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.AdminDAO;
import com.Model.AdminDTO;




@WebServlet("/AdminAdd")
public class AdminAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 관리자등록 기능
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String zone = request.getParameter("zone");
		String police = request.getParameter("police");
		
		
		AdminDAO dao = new AdminDAO();
		AdminDTO dto = new AdminDTO(id, pw, name, zone, police);
		int cnt = dao.join(dto);
		
		if(cnt >0) {
			System.out.println("조인성공!");
			response.sendRedirect("SmartBolad.jsp");
		} else {
			System.out.println("조인실패!");
			response.sendRedirect("SmartBolad.jsp#admin");
		}
		
		
		
		
	}

}
