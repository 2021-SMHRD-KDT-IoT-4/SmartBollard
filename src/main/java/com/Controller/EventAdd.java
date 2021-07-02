package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.EventDAO;
import com.Model.EventDTO;


@WebServlet("/EventAdd")
public class EventAdd extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	// 축제및 집회 추가기능
		
	request.setCharacterEncoding("utf-8");
	String ename = request.getParameter("ename");
	String day = request.getParameter("day");
	String host = request.getParameter("host");
	String etime = request.getParameter("etime");
	int people = Integer.parseInt(request.getParameter("people"));
	String sstreet = request.getParameter("sstreet");
	String estreet = request.getParameter("estreet");
	
	
	EventDTO dto = new EventDTO(ename, day, host, etime, people, sstreet, estreet);
	EventDAO eventdao = new EventDAO();
	int cnt = eventdao.eventAdd(dto);
	
	if(cnt>0) {
		System.out.println("축제추가 성공");
	}else {
		System.out.println("축제추가 실패");
	}
	
	
	response.sendRedirect("SmartBolad.jsp#event");
	
	
	}
	
}
