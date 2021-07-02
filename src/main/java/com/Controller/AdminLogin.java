package com.Controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.AdminDAO;
import com.Model.AdminDTO;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 로그인 기능
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		AdminDTO info = null;
		
		
		AdminDAO dao = new AdminDAO();
		AdminDTO dto = new AdminDTO(id, pw);
		
		info = dao.login(dto);
		
		if(info != null) {
			System.out.println("로그인성공!");
			session.setAttribute("login_info", info);
			response.sendRedirect("SmartBolad.jsp");
		} else {
			System.out.println("로그인실패!");
			response.sendRedirect("SmartBolad.jsp#loginFail");
		}
		
		
		
		
	}

}
