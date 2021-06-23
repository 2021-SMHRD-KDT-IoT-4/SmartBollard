package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class adminDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	adminDTO info = null;

	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@192.168.0.234:1521:xe";
			String db_id = "second";
			String db_pw = "second";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
	}

	public void close() {

		try {
			if (rs != null) {
				rs.close();
			}

			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	
	public int join(adminDTO dto) {
		
		conn();
		
		
		try {
			String sql = "insert into admin values(?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getZone());
			psmt.setString(5, dto.getPolice());
			
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
		
	}
	
	
	public adminDTO login(adminDTO dto) {
		
		conn();
		
		
		try {
			String sql = "select * from admin where id =? and pw =?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1,dto.getId());
			psmt.setString(2,dto.getPw());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String zone = rs.getString(4);
				String police = rs.getString(5);
				
				info = new adminDTO(id, pw, name, zone, police);
		
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		}
		return info;
		
		
	}
	
}
