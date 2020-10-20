package model;

public class OrderBean {
	private String email;
	private Integer idProd;
	
	public OrderBean() {
		this.email = "";
		this.idProd = 0;
	}
	
	public OrderBean(String email,Integer idProd) {
		setEmail(email);
		setID(idProd);
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public Integer getID() {
		return idProd;
	}

	public void setID(Integer idProd) {
		this.idProd = idProd;
	}
}
