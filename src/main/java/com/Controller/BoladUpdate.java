package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoladUpdate")
public class BoladUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String street = request.getParameter("street");
		String product = request.getParameter("product");
		String bstatus = request.getParameter("bstatus");
		String heartbeat = request.getParameter("heartbeat");
		int bolno = Integer.parseInt(request.getParameter("bolno"));
		
		
		
	}

}
