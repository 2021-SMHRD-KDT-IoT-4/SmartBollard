package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.emcDAO;
import com.Model.emcDTO;


@WebServlet("/EmcAdd")
public class EmcAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String info = request.getParameter("info");
		String manager = request.getParameter("manager");
		String street = request.getParameter("street");
		String ttime = request.getParameter("ttime");
		String lightcolor = request.getParameter("lightcolor");
		String zone = request.getParameter("zone");
		
		
		emcDTO dto = new emcDTO(info, manager, street, ttime, lightcolor, zone);
		emcDAO dao = new emcDAO();
		
		int cnt = dao.emcAdd(dto);
		
		if(cnt >0) {
			System.out.println("통제등록성공!");
			response.sendRedirect("SmartBolad.jsp#emc");
		} else {
			System.out.println("등록싶패!!");
			response.sendRedirect("SmartBolad.jsp#emadd");
		}
		
	}

}
