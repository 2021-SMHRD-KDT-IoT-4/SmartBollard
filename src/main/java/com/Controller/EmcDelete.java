package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.EmcDAO;


@WebServlet("/EmcDelete")
public class EmcDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 교통통제 삭제기능
		
		request.setCharacterEncoding("utf-8");
		int emcno = Integer.parseInt(request.getParameter("emcno"));
	
		
		EmcDAO dao = new EmcDAO();
		int cnt = dao.deleteOneEmc(emcno);
		
		if(cnt >0 ) {
			System.out.println("통제관리삭제성공!");
			response.sendRedirect("SmartBolad.jsp#emc");
		}else {
			System.out.println("통제관리삭제실패!");
			response.sendRedirect("SmartBolad.jsp#emc");
		}
		
		
	}

}
