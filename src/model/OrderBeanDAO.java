package model;

import java.sql.*;

public class OrderBeanDAO {
	
	public synchronized void addOrder(String email,Integer idProd) {
		PreparedStatement ps = null;
		Connection conn = null;
		
		try {
			conn = ConnectionPool.getConnection();
			String query = "(INSERT INTO checkout (email,id_volo) VALUE (?,?)";
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
}
