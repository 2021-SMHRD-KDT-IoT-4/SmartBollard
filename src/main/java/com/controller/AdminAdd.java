package com.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.adminDAO;
import com.Model.adminDTO;




@WebServlet("/AdminAdd")
public class AdminAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String zone = request.getParameter("zone");
		String police = request.getParameter("police");
		
		
		adminDAO dao = new adminDAO();
		adminDTO dto = new adminDTO(id, pw, name, zone, police);
		int cnt = dao.join(dto);
		
		if(cnt >0) {
			System.out.println("���μ���!");
			response.sendRedirect("index.html");
		} else {
			System.out.println("�� �ν���!");
			response.sendRedirect("index.html#admin");
		}
		
		
		
		
	}

}
