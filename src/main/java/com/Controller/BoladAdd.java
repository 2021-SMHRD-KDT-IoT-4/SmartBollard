package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.BoladDAO;
import com.Model.BoladDTO;

@WebServlet("/BoladAdd")
public class BoladAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		String bolno = request.getParameter("bolno");
		String street = request.getParameter("street");
		String product = request.getParameter("product");
		String bstatus = request.getParameter("bstatus");
		
		BoladDTO dto = new BoladDTO(bolno, street, product, bstatus);
		BoladDAO dao = new BoladDAO();
		int cnt = dao.boladAdd(dto);
		
			if(cnt > 0) {
				System.out.println("볼라드 등록 성공!");
				
				
			}
	}

}
