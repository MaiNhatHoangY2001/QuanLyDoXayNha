package com.se.security.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(CartPK.class)
@Table(name = "cart")
public class Cart {

	@Id
	@ManyToOne
	@JoinColumn(name = "id_product")
	private Product idProduct;

	@Id
	@ManyToOne
	@JoinColumn(name = "id_customer")
	private Customer idCustomer;

	@Column(name = "title_product")
	private String titleProduct;

	@Column(name = "quantity")
	private int quantity;

	public Product getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(Product idProduct) {
		this.idProduct = idProduct;
	}

	public Customer getIdCustomer() {
		return idCustomer;
	}

	public void setIdCustomer(Customer idCustomer) {
		this.idCustomer = idCustomer;
	}

	public String getTitleProduct() {
		return titleProduct;
	}

	public void setTitleProduct(String titleProduct) {
		this.titleProduct = titleProduct;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Cart(Product idProduct, Customer idCustomer, String titleProduct, int quantity) {
		super();
		this.idProduct = idProduct;
		this.idCustomer = idCustomer;
		this.titleProduct = titleProduct;
		this.quantity = quantity;
	}

	public Cart() {
	}

}
