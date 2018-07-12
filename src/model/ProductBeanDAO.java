package model;

import java.sql.*;
import java.util.ArrayList;

public class ProductBeanDAO {
	public synchronized ProductBean newProduct(String uMeta, String uPartenza, String uID, String uCompagnia,
			Float uPrezzo, Date uData) {

		Connection conn = null;
		PreparedStatement prepstat = null;

		try {

			conn = ConnectionPool.getConnection();

			String sqlInsert = ("insert into product (meta, partenza, ID, compagnia, prezzo, dataPartenza) values (?, ?, ?, ?, ?, ?);");

			prepstat = conn.prepareStatement(sqlInsert);
			prepstat.setString(1, uMeta);
			prepstat.setString(2, uPartenza);
			prepstat.setString(3, uID);
			prepstat.setString(4, uCompagnia);
			prepstat.setFloat(5, uPrezzo);
			prepstat.setDate(6, uData);
			int state = prepstat.executeUpdate();

			if (state != 0) {
				ProductBean pb = new ProductBean(uMeta, uPartenza, uID, uCompagnia, uPrezzo, uData);
				return pb;

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				prepstat.close();
				ConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return null;
	}
	
	public synchronized ArrayList <ProductBean> serachByName(String uString){
		
		Connection conn = null;
		PreparedStatement prepstat = null;
		ArrayList<ProductBean> search = new ArrayList <ProductBean>();
		
		try {
			conn = ConnectionPool.getConnection();
			prepstat = conn.prepareStatement("SELECT * FROM viaggi WHERE destinazione LIKE ?;");
			prepstat.setString(1, "%" + uString + "%");
			
			ResultSet rs = prepstat.executeQuery();
			
			while(rs.next()) {
				ProductBean pb = new ProductBean(rs.getString("meta"), rs.getString("partenza"), rs.getString("ID"), rs.getString("compagnia"), rs.getFloat("prezzo"), rs.getDate("dataVolo"));
				search.add(pb);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try {
				prepstat.close();
				ConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return search;
	}
	
	public synchronized ProductBean serachByID(String ID){
		
		ProductBean pb = null;
		Connection conn = null;
		PreparedStatement prepstat = null;
		
		try {
			conn = ConnectionPool.getConnection();
			prepstat = conn.prepareStatement("SELECT * FROM viaggi WHERE id_Volo = ? ");
			prepstat.setString(1, "%" + ID + "%");
			
			ResultSet rs = prepstat.executeQuery();
			
			while(rs.next()) {
				pb = new ProductBean(rs.getString("meta"), rs.getString("partenza"), rs.getString("id_Volo"), rs.getString("compagnia"), rs.getFloat("prezzo"), rs.getDate("dataVolo"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			try {
				prepstat.close();
				ConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
}
		}
		
		return pb;
	}
}
