package com.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.BoladDAO;
import com.Model.BoladDTO;

@WebServlet("/BoladControll")
public class BoladControll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	 	
		int heartBeat = Integer.parseInt(request.getParameter("yj"));	
		
	
		
		BoladDAO dao = new BoladDAO();
		int cnt = dao.boladUpdate(heartBeat);
		int bolno = 21;
		int c = 0;
		BoladDTO dto = new BoladDTO(heartBeat);
		System.out.println(heartBeat);
		

		if(heartBeat < 800) {
		
			c = dao.boladBreak(bolno);
		}else {
			
			c = dao.boladNormal(bolno);
		}
		
		
		if(c > 0) {
			System.out.println(heartBeat);
			System.out.println("볼라드상태갱신");

		} else {
			System.out.println("볼라드상태갱신실패");
		}

		if (cnt > 0) {
			System.out.println(heartBeat);
			System.out.println("실시간업데이트중");

		} else {
			System.out.println("실시간업데이트실패");
		}

	}

}
