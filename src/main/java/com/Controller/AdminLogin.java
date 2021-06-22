package com.Controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.adminDAO;
import com.Model.adminDTO;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = null;
		
		
		adminDAO dao = new adminDAO();
		adminDTO dto = new adminDTO(id, pw);
		
		name = dao.login(dto);
		
		if(name != null) {
			System.out.println("로그인성공!");
			response.sendRedirect("index.html");
		} else {
			System.out.println(" 로그인실패!");
			response.sendRedirect("index.html");
		}
		
		
		
		
	}

}
