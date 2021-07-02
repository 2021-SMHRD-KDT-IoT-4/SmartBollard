package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmcDAO {	// �������� ���� DAO

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	String a = null;
	EmcDTO dto = null;
	BoladDTO info = null;
	BoladDTO stinfo = null;
	ArrayList<BoladDTO> bolnoList = null;
	ArrayList<BoladDTO> streetList = null;
	
	public void conn() {	// DB ����
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
	
	public void close() {	// DB ��������

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
	
	
	public int emcAdd(EmcDTO dto) {	// �������� �߰�
		 conn();
		 
		 String sql = "insert into emc values(emcno_sequence.nextval,?,?,?,?,null,?)";
		 try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getInfo());
			psmt.setString(2, dto.getManager());
			psmt.setString(3, dto.getStreet());
			psmt.setString(4, dto.getTtime());
			psmt.setString(5, dto.getZone());
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		}
		 return cnt;
	}
	
	
	
	public ArrayList<EmcDTO> showEmc() {	// �������� ��ȸ
		ArrayList<EmcDTO> emcList = new ArrayList<EmcDTO>();
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
				
				dto = new EmcDTO(emcno, info, manager, street, ttime, lightcolor, zone);
				emcList.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return emcList;
		

}
	
	
	public int deleteOneEmc(int emcno) {	// �������� ����
			
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
		
	
		public ArrayList<BoladDTO> streetBoladShow(String street) {	// ���θ����� ����� �˻�
		
		bolnoList = new ArrayList<BoladDTO>();
		conn();
		
		try {
			String sql = "select * from bolad where street = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, street);
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				int bolno = rs.getInt(1);
				stinfo = new BoladDTO(bolno);
				bolnoList.add(stinfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return bolnoList;
		
	}
	
	
}
