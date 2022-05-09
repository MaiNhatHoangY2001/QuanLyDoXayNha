package com.se.security.demo.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;

@Embeddable
public class OrderDetailPK implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4916784602683599156L;
	private int order;
	private int product;

	@Override
	public int hashCode() {
		return Objects.hash(order, product);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDetailPK other = (OrderDetailPK) obj;
		return order == other.order && product == other.product;
	}

}
