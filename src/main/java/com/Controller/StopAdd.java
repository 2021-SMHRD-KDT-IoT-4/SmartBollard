package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.StopDAO;
import com.Model.StopDTO;

@WebServlet("/StopAdd")
public class StopAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String street = request.getParameter("street");
		String carno = request.getParameter("carno");
		String capture = request.getParameter("capture");
		int bolno = Integer.parseInt(request.getParameter("bolno"));
		
		StopDTO dto = new StopDTO(street, carno, capture, bolno);
		StopDAO dao = new StopDAO();
		int cnt = dao.stopAdd(dto);
			if(cnt > 0) {
				System.out.println("������ ���ݻ��� ��� ����!");
			} else {
				System.out.println("������ ���ݻ��� ��� ����!");
			}
			response.sendRedirect("SmartBolad.jsp#stopline");
	}

}
