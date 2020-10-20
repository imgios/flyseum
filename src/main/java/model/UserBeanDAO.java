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
				ub.setRole(res.getString("role"));
				
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
	 
	 public synchronized UserBean changeEmail(UserBean ub, String oldemail, String newemail) {
		 Connection conn = null;
		 PreparedStatement ps = null;
		 
		 try {
			 conn = ConnectionPool.getConnection();
			 String sql = new String("SELECT * FROM user WHERE email = ? AND password = ?");
			 ps = conn.prepareStatement(sql);
			 ps.setString(1, ub.getEmail());
			 ps.setString(2, ub.getPsw());
			 
			 ResultSet res = ps.executeQuery();
			 String checkOld = null;
			 
			 if(res.next()) {
				 checkOld = res.getString("email");
				 System.out.println("test old and new");
				 System.out.println(oldemail);
				 System.out.println(checkOld);
				 if(checkOld.contentEquals(oldemail)) {
					 PreparedStatement prepstat = conn.prepareStatement("UPDATE user SET email = ? WHERE email = ?");
					 prepstat.setString(1, newemail);
					 prepstat.setString(2, oldemail);
					 int state = prepstat.executeUpdate();
					 
					 if(state != 0) {
						 ub.setEmail(newemail);
						 System.out.println("email modificata");
						 
						 return ub;
					 }
					 else {
							System.out.println("No changes");
							return null;
						}
						
				 } 
			 }
		 }catch (SQLException e) {
					e.printStackTrace();
					}
				 	finally {
						try {
						ps.close();
						ConnectionPool.releaseConnection(conn);
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					
		 return null;			
	 }
	 
	 public synchronized UserBean changePsw(UserBean ub, String oldpsw, String newpsw) {
		 Connection conn = null;
		 PreparedStatement ps = null;
		 
		 try {
			 conn = ConnectionPool.getConnection();
			 String sql = new String("SELECT * FROM user WHERE email = ? AND password = ?");
			 ps = conn.prepareStatement(sql);
			 ps.setString(1, ub.getEmail());
			 ps.setString(2, ub.getPsw());
			 
			 ResultSet res = ps.executeQuery();
			 String checkOld = null;
			 
			 if(res.next()) {
				 checkOld = res.getString("password");
				 
				 if(checkOld.contentEquals(oldpsw)) {
					 PreparedStatement prepstat = conn.prepareStatement("UPDATE user SET password = ? WHERE password = ?");
					 prepstat.setString(1, newpsw);
					 prepstat.setString(2, oldpsw);
					 int state = prepstat.executeUpdate();
					 
					 if(state != 0) {
						 ub.setPsw(newpsw);
						 System.out.println("psw modificata");
						 
						 return ub;
					 }
					 else {
							System.out.println("No changes");
							return null;
						}
						
				 } 
			 }
		 }catch (SQLException e) {
					e.printStackTrace();
					}
				 	finally {
						try {
						ps.close();
						ConnectionPool.releaseConnection(conn);
						} catch (SQLException e) {
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
