package model;

import java.sql.*;

public class CartBeanDAO {
	
	public synchronized void saveCart(UserBean ub, ProductBean pb) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = ConnectionPool.getConnection();
			ps = conn.prepareStatement("INSERT INTO carrello (eMail_User, id_Volo) VALUES(?,?)");
			ps.setString(1, ub.getEmail());
			ps.setString(2, pb.getID());
			
			int status = ps.executeUpdate();
			
			if(status != 0) {
				System.out.println("carrello salvao con successo");
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
	
	public synchronized void  deleteFromCart(String uEmail, String IDFlight) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = ConnectionPool.getConnection();
			ps = conn.prepareStatement("DELETE FROM carrello WHERE eMail_User = ? AND id_Volo = ?");
			ps.setString(1, uEmail);
			ps.setString(2, IDFlight);
			
			int status = ps.executeUpdate();
			
			if(status != 0) {
				System.out.println("elemento eliminato con successo");
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
			ps = conn.prepareStatement("SELECT * FROM carrello WHERE eMail_User = ?");
			ps.setString(1, uEmail);
			
			ResultSet res = ps.executeQuery();
			CartBean cart = new CartBean();
			
			while( res.next() ) {
				ProductBeanDAO pbd = new ProductBeanDAO();
				ProductBean pb = pbd.serachByID(res.getString("id_Volo"));
				cart.addProduct(pb);
			}
			
			if(cart.getTotal()!=0) {
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
