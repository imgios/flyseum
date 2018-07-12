package model;

public class UserBean {
	private String email;
	private String psw;
	private String nome;
	private String cognome;

	public UserBean(String email2, String psw2) {
		email = email2;
		psw = psw2;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPsw() {
		return psw;
	}
	
	public String getNome() {
		return nome;
	}
	
	public String getCognome() {
		return cognome;
	}
	
	public void setNome(String n) {
		nome = n;
	}
	
	public void setCognome(String c) {
		cognome = c;
	}
}
