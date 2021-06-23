package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.eventDAO;


@WebServlet("/DelOneEvent")
public class DelOneEvent extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("utf-8");
	
	String eno = request.getParameter("eno");
	
	eventDAO eventdao = new eventDAO();
	int cnt = eventdao.DelOEvent(eno);
	
	if(cnt>0) {
		System.out.println("축제삭제성공");
	}else {
		System.out.println("축제삭제실패");
		
	}
	response.sendRedirect("SmartBolad.jsp#event");
	
	}

}
