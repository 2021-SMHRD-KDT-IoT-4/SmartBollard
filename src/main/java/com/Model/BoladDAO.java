package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoladDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	ArrayList<BoladDTO> list = null;
	BoladDTO info = null;
	
	public void conn() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "second";
			String db_pw = "second";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		
			try {
			if(rs != null)
				rs.close();
			if(psmt != null)
				psmt.close();
			if(conn != null)
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}
	
	public ArrayList<BoladDTO> boladManage() {
		
		conn();
		list = new ArrayList<BoladDTO>();
		
		try {
			String sql = "select * from bolad";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				String bolno = rs.getString(1);
				String street = rs.getString(2);
				String product = rs.getString(3);
				String bstatus = rs.getString(4);
				info = new BoladDTO(bolno, street, product, bstatus);
				list.add(info);
				System.out.println("볼라드 관리 완료");
			} else {
				System.out.println("볼라드 관리 실패");
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return list;
		
	}
	
}
