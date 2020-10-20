package model;

import java.sql.Timestamp;


public class ProductBean {
	private String destinazione, partenza, compagniaAerea;
	private Float prezzo;
	private Timestamp dataArrivo, dataPartenza;
	private Integer id, posti;
	
	public ProductBean () {
		this.destinazione = "";
		this.partenza = "";
		this.id = 0;
		this.compagniaAerea = "";
		this.prezzo = (float) 0;
		this.dataPartenza = null;
		this.dataArrivo = null;
		this.posti = 0;
	}
	
	public ProductBean (Integer id, String partenza, String destinazione, String compagnia, Float prezzo, Timestamp dataPartenza, Timestamp dataArrivo, Integer posti) {
		this.destinazione = destinazione;
		this.partenza = partenza;
		this.id = id;
		this.compagniaAerea = compagnia;
		this.prezzo = prezzo;
		this.dataPartenza = dataPartenza;
		this.dataArrivo = dataArrivo;
		this.posti = posti;
	}

	public String getDestinazione() {
		return destinazione;
	}

	public void setDestinazione(String destinazione) {
		this.destinazione = destinazione;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCompagniaAerea() {
		return compagniaAerea;
	}

	public void setCompagniaAerea(String compagniaAerea) {
		this.compagniaAerea = compagniaAerea;
	}

	public String getPartenza() {
		return partenza;
	}

	public void setPartenza(String partenza) {
		this.partenza = partenza;
	}

	public Float getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(Float prezzo) {
		this.prezzo = prezzo;
	}

	public Timestamp getDataPartenza() {
		return dataPartenza;
	}

	public void setDataPartenza(Timestamp dataPartenza) {
		this.dataPartenza = dataPartenza;
	}

	public Timestamp getDataArrivo() {
		return dataArrivo;
	}

	public void setDataArrivo(Timestamp dataArrivo) {
		this.dataArrivo = dataArrivo;
	}

	public Integer getPosti() {
		return posti;
	}

	public void setPosti(Integer posti) {
		this.posti = posti;
	}
}
