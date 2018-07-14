package model;

import java.sql.*;

public class UserBeanDAO {
	 public synchronized UserBean doRetrieveByKey(String email, String password){ //ricerco nel db l'utente con email e psw dati in input
		 
		 Connection conn = null;
		 PreparedStatement ps = null;
		 try {
			UserBean ub = new UserBean(email, password); 
			conn = ConnectionPool.getConnection();
			ps = conn.prepareStatement("SELECT * FROM user WHERE email = ? AND password = ?");
			ps.setString(1, email);
			ps.setString(2, password);
					
			ResultSet res = ps.executeQuery();

			// 4. Prendi il risultato
			if(res.next())
			{
				ub.setNome(res.getString("name"));
				ub.setCognome(res.getString("surname"));
				
				return ub;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				ConnectionPool.releaseConnection(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	 }
	 
	 public synchronized UserBean UserRegistration(String email, String password, String name, String surname){
		 Connection conn =  null;
		 PreparedStatement ps = null;
		 
		 try {
			 conn = ConnectionPool.getConnection();
			 String sqlString = new String("INSERT INTO user(email,password,name,surname) VALUES(?,?,?,?)");
			 ps = conn.prepareStatement(sqlString);
			 
			 ps.setString(1, email);
			 ps.setString(2, password);
			 ps.setString(3, name);
			 ps.setString(4, surname);
			 
			 int upd = ps.executeUpdate();
			 
			 if(upd != 0) {
				    UserBean ub = new UserBean(email, password);
					ub.setNome(name);
					ub.setCognome(surname);
					System.out.print("Registrazione effettuata con successo");
					return ub;
			 }
		 }
		 catch(SQLException e){
			 if(e.getErrorCode() == 1062) {
				 return new UserBean("duplicato","duplicato"); 
			 }
			 
		 }
		 finally {
			 try {
				 //conn.commit();
				 ps.close();
				 ConnectionPool.releaseConnection(conn);
			 }
			 catch(Exception e2) {
				 e2.printStackTrace();
		 }
		 }
		 return null;
	 }
}
