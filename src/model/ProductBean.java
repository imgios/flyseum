package model;

import java.util.Date;


public class ProductBean {
	private String meta, partenza, ID, compagniaAerea;
	private Float prezzo;
	private Date data;
	
	public ProductBean( String uMeta, String uPartenza, String uID, String uCompagnia, Float uPrezzo, Date uData) {
		this.meta = uMeta;
		this.partenza = uPartenza;
		this.ID = uID;
		this.compagniaAerea = uCompagnia;
		this.prezzo = uPrezzo;
		this.data = uData;
	}
	
	public String getMeta() {
		return meta;
	}
	
	public void setMeta(String uMeta) {
		this.meta = uMeta;
	}
	
	public String getPartenza() {
		return partenza;
	}
	
	public void setPartenza(String uPartenza) {
		this.partenza = uPartenza;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getCompagniaAerea() {
		return compagniaAerea;
	}

	public void setCompagniaAerea(String compagniaAerea) {
		this.compagniaAerea = compagniaAerea;
	}

	public Float getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(Float prezzo) {
		this.prezzo = prezzo;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}
	
	
}
