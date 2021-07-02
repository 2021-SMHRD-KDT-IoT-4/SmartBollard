package com.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.EventDAO;


@WebServlet("/EventDel")
public class EventDel extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	// ������ ��ȸ ���� �������	
	
	request.setCharacterEncoding("utf-8");
	
	String eno = request.getParameter("eno");
	
	EventDAO eventdao = new EventDAO();
	int cnt = eventdao.DelOEvent(eno);
	
	if(cnt>0) {
		System.out.println("������������");
	}else {
		System.out.println("������������");
		
	}
	response.sendRedirect("SmartBolad.jsp#event");
	
	}

}
