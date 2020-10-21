package model;

import java.util.ArrayList;

public class CartBean {
	
	private String user;
	private ArrayList<ProductBean> voli;
	
	public CartBean ()
	{
		user = "";
		this.voli = new ArrayList<ProductBean>();
    }
	
	public float getTotal(){
		
		float tot = 0;
		
		if (!voli.isEmpty()) {
			for(ProductBean beans : voli) {
				tot += beans.getPrezzo();
			}
		}
		
		return tot;
	}
	
	public void addProduct(ProductBean pb) {
		if(voli.add(pb)) {
			System.out.println("Elemento aggiunto con successo!");
		}
	}
	
	public void removeProduct(ProductBean pb){
		voli.remove(pb);
	}
	
	public ProductBean getProduct(int i) {
		return this.voli.get(i);
	}
	
	public ArrayList<ProductBean> getAllProduct(){
		return voli;
	}
	
	public boolean isEmpty() {
		if(voli.isEmpty()) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public void deleteCart() {
		int i = 0;
		
		while(!(this.voli.isEmpty())) {
			this.voli.remove(i);
			i++;
		}
	}
	
	public String getUser() {
		return user;
	}
	
	public void setUser(String uEmail) {
		this.user = uEmail;
	}
	
	public CartBean restoreCart()
	{
		CartBeanDAO cbd = new CartBeanDAO();
		return cbd.restore(this.getUser());
	}
	
	public void saveCart (CartBean cart, ProductBean pb) {
		CartBeanDAO cbd = new CartBeanDAO();
		cbd.saveCart(cart, pb);
	}
	
	public void removeFlightDB (ProductBean pb) {
		CartBeanDAO cbd = new CartBeanDAO();
		cbd.deleteFromCart(this.getUser(), pb.getId());
	}
}
