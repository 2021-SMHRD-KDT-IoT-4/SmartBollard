package com.Controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.BoladDTO;
import com.Model.EmcDAO;

@WebServlet("/SearchBolad")
public class SearchBolad extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 해당 도로명으로 볼라드 검색기능
		
		ArrayList<BoladDTO> stinfo = null;
		String street = request.getParameter("street");
		
		
		BoladDTO dto = new BoladDTO(street);
		EmcDAO dao = new EmcDAO();
		stinfo = dao.streetBoladShow(street);
		
		
		if(stinfo != null) {
			System.out.println("검색 완료!");
			
		} else {
			System.out.println("검색 실패!");
		}
		response.sendRedirect("SmartBolad.jsp?name="+URLEncoder.encode(street, "UTF-8")+"#emccontroll");
	}

}
