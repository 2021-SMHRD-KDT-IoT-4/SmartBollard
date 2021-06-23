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
	emcDTO dto = null;
	
	
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
	
	
	public int emcAdd(emcDTO dto) {
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
	
	
	
	public ArrayList<emcDTO> showEmc() {
		ArrayList<emcDTO> emcList = new ArrayList<emcDTO>();
		conn();
		String sql = "select*from emc order by emcno";
		try {
			psmt= conn.prepareStatement(sql);
			
			rs= psmt.executeQuery();
			
			while(rs.next()) {
				int emcno = rs.getInt(1);
				String info = rs.getString(2);
				String manager = rs.getString(3);
				String street = rs.getString(4);
				String ttime = rs.getString(5);
				String lightcolor = rs.getString(6);
				String zone = rs.getString(7);
				
				dto = new emcDTO(emcno, info, manager, street, ttime, lightcolor, zone);
				emcList.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return emcList;
		

}
	
	
	public int deleteOneEmc(int emcno) {
			
			conn();
			
			String sql = "delete from emc where emcno = ?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, emcno);
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
		}
		
	
	
	
}
