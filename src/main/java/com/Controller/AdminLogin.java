package com.Controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.adminDAO;
import com.Model.adminDTO;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		adminDTO info = null;
		
		
		adminDAO dao = new adminDAO();
		adminDTO dto = new adminDTO(id, pw);
		
		info = dao.login(dto);
		
		if(info != null) {
			System.out.println("로그인성공!");
			session.setAttribute("login_info", info);
			response.sendRedirect("SmartBolad.jsp");
		} else {
			System.out.println(" 로그인실패!");
			response.sendRedirect("SmartBolad.jsp");
		}
		
		
		
		
	}

}
