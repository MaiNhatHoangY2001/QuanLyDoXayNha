package com.se.security.demo.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;

@Embeddable
public class CartPK implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6526967377403949168L;
	private int idProduct;
	private int idCustomer;

	@Override
	public int hashCode() {
		return Objects.hash(idCustomer, idProduct);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartPK other = (CartPK) obj;
		return idCustomer == other.idCustomer && idProduct == other.idProduct;
	}

}
