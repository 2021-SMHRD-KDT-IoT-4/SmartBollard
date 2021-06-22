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
	int cnt = 0;
	
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
			while(rs.next()) {
				String bolno = rs.getString(1);
				String street = rs.getString(2);
				String product = rs.getString(3);
				String bstatus = rs.getString(4);
				info = new BoladDTO(bolno, street, product, bstatus);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return list;
		
	}
	
	public int boladAdd(BoladDTO dto) {
		
		conn();
		
		try {
			String sql = "insert into bolad values (?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getStreet());
			psmt.setString(2, dto.getProduct());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return cnt;
		
	}
	
}
