package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StopDAO {
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ArrayList<StopDTO> stopList = null;
		StopDTO stopInfo = null;
		int cnt = 0;
		
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
		
		public ArrayList<StopDTO> stopShow() {
			
			stopList = new ArrayList<StopDTO>();
			conn();
			
			try {
				String sql = "select * from stopline";
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				
				while(rs.next()){
					int capno = rs.getInt(1);
					String street = rs.getString(2);
					String captime = rs.getString(3);
					String carno = rs.getString(4);
					String capture = rs.getString(5);
					int bolno = rs.getInt(6);
					stopInfo = new StopDTO(capno, street, captime, carno, capture, bolno);
					stopList.add(stopInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			} return stopList;
		}
		
		public int stopAdd(StopDTO dto) {
			
			conn();
			
			try {
				String sql = "insert into stopline values (capno_sequence.nextval, ?, sysdate, ?, '°æ·Î', ?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getStreet());
				psmt.setString(2, dto.getCarno());
				psmt.setInt(3, dto.getBolno());
				cnt = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			} return cnt; 
		}
		
		public int stopDel(int capno) {
			
			conn();
			
			try {
				String sql = "delete stopline where capno = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, capno);
				cnt = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			} return cnt;
			
		}
}