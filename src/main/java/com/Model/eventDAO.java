package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class eventDAO {

		Connection conn = null;
		ResultSet rs =null;
		PreparedStatement psmt = null;
		int cnt = 0;
		eventDTO dto =null;
		
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
		
		
		public int eventAdd(eventDTO dto) {
			conn();
			String sql = "insert into event values(?,?,?,?,?,?,?,event_sequence.nextval)";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getEname());
				psmt.setString(2, dto.getDay());
				psmt.setString(3, dto.getHost());
				psmt.setString(4, dto.getEtime());
				psmt.setInt(5, dto.getPeople());
				psmt.setString(6, dto.getSstreet());
				psmt.setString(7, dto.getEstreet());
				
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return cnt;
		}
		
		public ArrayList<eventDTO> showEvent() {
			ArrayList<eventDTO> eventList = new ArrayList<eventDTO>();
			conn();
			String sql = "select*from event";
			try {
				psmt= conn.prepareStatement(sql);
				
				rs= psmt.executeQuery();
				
				while(rs.next()) {
					String ename = rs.getString(1);
					String day = rs.getString(2);
					String host = rs.getString(3);
					String etime = rs.getString(4);
					int people = rs.getInt(5);
					String sstreet = rs.getString(6);
					String estreet = rs.getString(7);
					int eno = rs.getInt(8);
					
					dto = new eventDTO(ename, day, host, etime, people, sstreet, estreet,eno);
					eventList.add(dto);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}return eventList;
	
	}

	public int DelOEvent(String eno) {
		
		conn();
		String sql = "delete from event where eno=?";
				
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, eno);
				cnt=psmt.executeUpdate();
					
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close();
			}return cnt;
				
		}
	
}
