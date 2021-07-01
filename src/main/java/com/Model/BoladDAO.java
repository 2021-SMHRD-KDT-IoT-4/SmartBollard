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
	ArrayList<BoladDTO> boladList = null;
	BoladDTO info = null;
	int cnt = 0;
	int c = 0;
	
	public void conn() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@192.168.0.234:1521:xe";
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
		
		boladList = new ArrayList<BoladDTO>();
		conn();
		
		try {
			String sql = "select * from bolad";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				int bolno = rs.getInt(1);
				String street = rs.getString(2);
				String product = rs.getString(3);
				String bstatus = rs.getString(4);
				int heartbeat = rs.getInt(5);
				info = new BoladDTO(bolno, street, product, bstatus, heartbeat);
				boladList.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return boladList;
		
	}
	
	public int boladAdd(BoladDTO dto) {
		
		conn();
		
		try {
			String sql = "insert into bolad values(bolno_sequence.nextval, ?, ?, null, null)";
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
	
	public int boladDel (int bolno) {
		
		conn();
		
		try {
			String sql = "delete bolad where bolno = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, bolno);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return cnt;
		
		
	}
	
	
	public int boladUpdate(int heartBeat) {
		conn();
		
		String sql = "update bolad set heartbeat = ?";
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, heartBeat);
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	
	public int boladBreak(int bolno) {
		conn();
		String sql = "update bolad set bstatus = '고장' where bolno = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, bolno);
			
			c = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
			
		}
		return c;
	}
	
	
	public int boladNormal(int bolno) {
		conn();
		String sql = "update bolad set bstatus = '정상' where bolno = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, bolno);
			
			c = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		
		}
		return c;
	}
	
}
