package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.eventDAO;
import com.Model.eventDTO;


@WebServlet("/EventAdd")
public class EventAdd extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
	String ename = request.getParameter("ename");
	String day = request.getParameter("day");
	String host = request.getParameter("host");
	String etime = request.getParameter("etime");
	int people = Integer.parseInt(request.getParameter("people"));
	String sstreet = request.getParameter("sstreet");
	String estreet = request.getParameter("estreet");
	
	
	eventDTO dto = new eventDTO(ename, day, host, etime, people, sstreet, estreet);
	eventDAO eventdao = new eventDAO();
	int cnt = eventdao.eventAdd(dto);
	
	if(cnt>0) {
		System.out.println("�����߰� ����");
	}else {
		System.out.println("�����߰� ����");
	}
	
	
	response.sendRedirect("SmartBolad.jsp#event");
	
	
	}
	
}
