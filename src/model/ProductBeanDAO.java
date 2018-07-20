package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class ProductBeanDAO {
	public synchronized ProductBean newProduct(String destinazione, String partenza, String compagnia,
			Float prezzo, Timestamp dataPartenza, Timestamp dataArrivo) {

		Connection conn = null;
		PreparedStatement prepstat = null;

		try {

			conn = ConnectionPool.getConnection();

			String sqlInsert = ("insert into flight (departure, destination, company, dateDeparture, dateArrival, price) values (?, ?, ?, ?, ?, ?);");

			prepstat = conn.prepareStatement(sqlInsert);
			prepstat.setString(1, partenza);
			prepstat.setString(2, destinazione);
			prepstat.setString(3, compagnia);
			//prepstat.setTimestamp(4, new java.sql.Timestamp(dataPartenza.getTime()));
			//prepstat.setTimestamp(5, new java.sql.Timestamp(dataArrivo.getTime()));
			prepstat.setTimestamp(4, dataPartenza);
			prepstat.setTimestamp(5, dataArrivo);
			prepstat.setFloat(6, prezzo);
			int state = prepstat.executeUpdate();

			if (state != 0) {
				try {
					String sqlRetrieve = ("SELECT * FROM flight WHERE departure = ? AND destination = ? AND company = ? AND dateDeparture = ? AND dateArrival = ? AND price = ?");
					PreparedStatement stat = conn.prepareStatement(sqlRetrieve);
					stat.setString(1, partenza);
					stat.setString(2, destinazione);
					stat.setString(3, compagnia);
					stat.setTimestamp(4, new java.sql.Timestamp(dataPartenza.getTime()));
					stat.setTimestamp(5, new java.sql.Timestamp(dataArrivo.getTime()));
					stat.setFloat(6, prezzo);
					ResultSet rs = stat.executeQuery();
					rs.next();
					ProductBean pb = new ProductBean(rs.getInt("id"), rs.getString("departure"), rs.getString("destination"), rs.getString("company"), rs.getFloat("price"), rs.getTimestamp("dateDeparture"), rs.getTimestamp("dateArrival"), rs.getInt("passengers"));
					return pb;
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
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
	
	public synchronized ArrayList <ProductBean> searchByDestination(String destinazione){
		
		Connection conn = null;
		PreparedStatement prepstat = null;
		ArrayList<ProductBean> search = new ArrayList <ProductBean>();
		
		try {
			conn = ConnectionPool.getConnection();
			prepstat = conn.prepareStatement("SELECT * FROM flight WHERE destination LIKE ?;");
			prepstat.setString(1, "%" + destinazione + "%");
			
			ResultSet rs = prepstat.executeQuery();
			
			while(rs.next()) {
				ProductBean pb = new ProductBean(rs.getInt("id"), rs.getString("departure"), rs.getString("destination"), rs.getString("company"), rs.getFloat("price"), rs.getTimestamp("dateDeparture"), rs.getTimestamp("dateArrival"), rs.getInt("passengers"));
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
	
	public synchronized ProductBean searchByID(Integer id){
		
		ProductBean pb = null;
		Connection conn = null;
		PreparedStatement prepstat = null;
		
		try {
			conn = ConnectionPool.getConnection();
			prepstat = conn.prepareStatement("SELECT * FROM flight WHERE id = ?;");
			prepstat.setInt(1, id);
			
			ResultSet rs = prepstat.executeQuery();
			
			while(rs.next()) {
				pb = new ProductBean(rs.getInt("id"), rs.getString("departure"), rs.getString("destination"), rs.getString("company"), rs.getFloat("price"), rs.getTimestamp("dateDeparture"), rs.getTimestamp("dateArrival"), rs.getInt("passengers"));
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
