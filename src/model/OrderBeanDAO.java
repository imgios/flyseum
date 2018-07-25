package model;

import java.sql.*;
import java.util.ArrayList;

public class OrderBeanDAO {
	
	public synchronized void addOrder(String email,Integer idProd) {
		PreparedStatement ps = null;
		Connection conn = null;
		
		try {
			conn = ConnectionPool.getConnection();
			String query = "INSERT INTO usrbooking (useremail,goflightid) VALUE (?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setInt(2, idProd);
			int state = ps.executeUpdate();
			
			if(state != 0) {
				System.out.println("ordine salvato");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
	
			try {	
				ps.close();
				ConnectionPool.releaseConnection(conn);
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}		
	}
	
	public synchronized ArrayList<OrderBean> getOrders(String email) {
		
		ArrayList<OrderBean> ordini = new ArrayList<OrderBean> ();
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = ConnectionPool.getConnection();
			ps = conn.prepareStatement("SELECT * FROM usrbooking WHERE useremail = ?");
			ps.setString(1, email);
			
			ResultSet res = ps.executeQuery();
			
			while(res.next()) {
				OrderBean ob = new OrderBean(email, res.getInt("goflightid"));
				ordini.add(ob);
			}
			return ordini;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				ps.close();
				ConnectionPool.releaseConnection(conn);
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
}
