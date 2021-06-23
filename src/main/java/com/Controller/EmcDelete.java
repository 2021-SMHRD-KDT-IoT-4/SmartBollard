package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.emcDAO;


@WebServlet("/EmcDelete")
public class EmcDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		int emcno = Integer.parseInt(request.getParameter("emcno"));
	
		
		emcDAO dao = new emcDAO();
		int cnt = dao.deleteOneEmc(emcno);
		
		if(cnt >0 ) {
			System.out.println("烹力包府昏力己傍!");
			response.sendRedirect("SmartBolad.jsp#emc");
		}else {
			System.out.println("烹力包府昏力角菩!");
			response.sendRedirect("SmartBolad.jsp#emc");
		}
		
		
	}

}
