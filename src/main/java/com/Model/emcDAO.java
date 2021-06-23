package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class emcDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	String a = null;
	ArrayList<emcDTO> emcList;
	
	
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
	
	
	public int emcInsert(emcDTO dto) {
		 conn();
		 
		 String sql = "insert into emc values(emcno_sequence.nextval,?,?,?,?,?,?)";
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getInfo());
			psmt.setString(2, dto.getManager());
			psmt.setString(3, dto.getStreet());
			psmt.setString(4, dto.getTtime());
			psmt.setString(5, dto.getLightcolor());
			psmt.setString(6, dto.getZone());
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		}
		 return cnt;
	}
	
	
	
	
	
	
}
