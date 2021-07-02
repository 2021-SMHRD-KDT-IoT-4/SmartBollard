package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.EmcDAO;
import com.Model.EmcDTO;


@WebServlet("/EmcAdd")
public class EmcAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// �������� �߰����
		
		request.setCharacterEncoding("utf-8");
		
		String info = request.getParameter("info");
		String manager = request.getParameter("manager");
		String street = request.getParameter("street");
		String ttime = request.getParameter("ttime");
		String zone = request.getParameter("zone");
		
		
		EmcDTO dto = new EmcDTO(info, manager, street, ttime, zone);
		EmcDAO dao = new EmcDAO();
		
		int cnt = dao.emcAdd(dto);
		
		if(cnt >0) {
			System.out.println("������ϼ���!");
			response.sendRedirect("SmartBolad.jsp#emc");
		} else {
			System.out.println("��Ͻ���!!");
			response.sendRedirect("SmartBolad.jsp#emadd");
		}
		
	}

}
