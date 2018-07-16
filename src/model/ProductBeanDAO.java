package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class ProductBeanDAO {
	public synchronized ProductBean newProduct(String destinazione, String partenza, String compagnia,
			Float prezzo, Date dataPartenza, Date dataArrivo) {

		Connection conn = null;
		PreparedStatement prepstat = null;

		try {

			conn = ConnectionPool.getConnection();

			String sqlInsert = ("insert into flight (departure, destination, company, dateDeparture, dateArrival) values (?, ?, ?, ?, ?);");

			prepstat = conn.prepareStatement(sqlInsert);
			prepstat.setString(1, partenza);
			prepstat.setString(2, destinazione);
			prepstat.setString(3, compagnia);
			prepstat.setTimestamp(4, new java.sql.Timestamp(dataPartenza.getTime()));
			prepstat.setTimestamp(5, new java.sql.Timestamp(dataArrivo.getTime()));
			int state = prepstat.executeUpdate();

			if (state != 0) {
				ProductBean pb = new ProductBean(destinazione, partenza, compagnia, prezzo, dataPartenza, dataArrivo);
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
	
	public synchronized ArrayList <ProductBean> serachByDestination(String destinazione){
		
		Connection conn = null;
		PreparedStatement prepstat = null;
		ArrayList<ProductBean> search = new ArrayList <ProductBean>();
		
		try {
			conn = ConnectionPool.getConnection();
			prepstat = conn.prepareStatement("SELECT * FROM flights WHERE destination LIKE ?;");
			prepstat.setString(1, "%" + destinazione + "%");
			
			ResultSet rs = prepstat.executeQuery();
			
			while(rs.next()) {
				ProductBean pb = new ProductBean(rs.getString("destination"), rs.getString("departure"), rs.getInt("id"), rs.getString("company"), rs.getFloat("price"), rs.getDate("dateDeparture"), rs.getDate("dateArrival"));
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
			prepstat = conn.prepareStatement("SELECT * FROM flights WHERE id = ?;");
			prepstat.setInt(1, id);
			
			ResultSet rs = prepstat.executeQuery();
			
			while(rs.next()) {
				pb = new ProductBean(rs.getString("destination"), rs.getString("departure"), rs.getInt("id"), rs.getString("company"), rs.getFloat("price"), rs.getDate("dateDeparture"), rs.getDate("dateArrival"));
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
