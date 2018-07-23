package model;

import java.sql.*;

public class CartBeanDAO {
	
	public synchronized void saveCart(CartBean cb, ProductBean pb) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = ConnectionPool.getConnection();
			ps = conn.prepareStatement("INSERT INTO cart (useremail, flightid) VALUES(?,?)");
			ps.setString(1, cb.getUser());
			ps.setInt(2, pb.getId());
			
			int status = ps.executeUpdate();
			
			if(status != 0) {
				System.out.println("Carrello salvato con successo!");
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
	
	public synchronized void  deleteFromCart(String uEmail, Integer IDFlight) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = ConnectionPool.getConnection();
			ps = conn.prepareStatement("DELETE FROM cart WHERE useremail = ? AND flightid = ?");
			ps.setString(1, uEmail);
			ps.setInt(2, IDFlight);
			
			int status = ps.executeUpdate();
			
			if(status != 0) {
				System.out.println("Elemento eliminato con successo");
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				ps.close();
				ConnectionPool.releaseConnection(conn);
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public synchronized CartBean restore(String uEmail) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = ConnectionPool.getConnection();
			ps = conn.prepareStatement("SELECT * FROM cart WHERE useremail = ?");
			ps.setString(1, uEmail);
			
			ResultSet res = ps.executeQuery();
			CartBean cart = new CartBean();
			
			while(res.next()) {
				ProductBeanDAO pbd = new ProductBeanDAO();
				ProductBean pb = pbd.searchByID(res.getInt("flightid"));
				cart.addProduct(pb);
			}
			
			if(!cart.isEmpty()) {
				cart.setUser(uEmail);
			}
			
			return cart;
			
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
